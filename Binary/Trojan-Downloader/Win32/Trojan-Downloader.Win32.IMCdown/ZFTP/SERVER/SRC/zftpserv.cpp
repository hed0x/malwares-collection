
////////x///////x///////x///////x///////x///////x///////x///////x///////x///

#define ZFTP_SERVER_PORT        12345    // port, server listens on
#define ZFTP_PACKET_SIZE        512      // packet size

#define ZFTP_CLIENT_THREAD_MAX_TIME  60  // max summary work time, then terminate
#define ZFTP_SERVER_THREAD_MAX_TIME  30  // max time since idle, then restart
#define ZFTP_CLIENT_TIMEOUT          30  // max wait responce time, then disconnect
#define ZFTP_STOP_TIMEOUT            300 // used when stopping server, to finish xfer sessions
#define ZFTP_MONITOR_CHECKTIME       10  // when to check halted threads
#define ZFTP_MAX_CLIENT_THREAD_COUNT 64  // limit number of client threads

struct zftp_client_struct : list_entry_struct
{
  DWORD          time0;         // creation GetTickCount()
  SOCKET         io_socket;     // client SOCKET
  HANDLE         handle;        // client thread handle
  DWORD          server_ip;     // server ip, client connected to
  sockaddr_in    addr;          // client ip:port
};

struct zftp_server_struct : list_entry_struct
{
  DWORD          time0;         // GetTickCount(), of last "alive" moment
  SOCKET         listen_socket; // server SOCKET
  HANDLE         handle;        // server thread handle
  DWORD          server_ip;     // server ip, to listen on
};

struct zftp_sentok_struct : list_entry_struct
{
  DWORD          client_ip;     // client, who downloaded file from our server
};

////////x///////x///////x///////x///////x///////x///////x///////x///////x///

list_struct zftp_server_list = {0,NULL,NULL}; // server threads, on ip:SERVER_PORT
list_struct zftp_client_list = {0,NULL,NULL}; // client threads
list_struct zftp_sentok_list = {0,NULL,NULL}; // for each successful file xfer

int    zftp_server_mustdie = 0;     // when set, all threads trying to exit
HANDLE zftp_monitor_thread = NULL;  // handle of monitor-thread

////////x///////x///////x///////x///////x///////x///////x///////x///////x///

void WINAPI zftp_ClientThread(zftp_client_struct* client)
{
  list_attach(&zftp_client_list, (void*)client);

  DWORD nb1 = 1;
  ioctlsocket(client->io_socket, FIONBIO, &nb1);

  int success = 0;

  *(DWORD*)&filebuf[filesize] = 0x55AA55AA;     // eof sign

  for( DWORD tpos = 0; tpos < filesize+4; )
  {

    int i;
    for(i=0; i<ZFTP_CLIENT_TIMEOUT; i++)
    {
      if (zftp_server_mustdie) break;

      fd_set writefds;
      writefds.fd_count = 1;
      writefds.fd_array[0] = client->io_socket;
      timeval timeout = {1,0};

      if (select(1, NULL,&writefds,NULL, &timeout) != 0) break;
    }
    if (i >= ZFTP_CLIENT_TIMEOUT)
    {
      log("ZFTP:ERROR:timeout\n");
      break;
    }
    if (zftp_server_mustdie)              // terminate connection
    {
      log("ZFTP:terminating connection\n");
      break;
    }

    int buflen = MIN(filesize+4 - tpos, ZFTP_PACKET_SIZE);
    int res = send(client->io_socket, &filebuf[tpos], buflen, 0);
    if ((res == SOCKET_ERROR) && (WSAGetLastError()==WSAEWOULDBLOCK)) continue;
    if ((res == 0) || (res == SOCKET_ERROR))
    {
      log("ZFTP:ERROR:error sending block or connection error (send()=%i, err=%i)\n", res, WSAGetLastError());
      break;
    }

    tpos += res;
    if (tpos == filesize+4) success++;

  }//for

  closesocket(client->io_socket);
  client->io_socket = NULL;

  if (success)
  {
    log("ZFTP:sent OK\n");

    zftp_sentok_struct* sentok = (zftp_sentok_struct*) malloc( sizeof(zftp_sentok_struct) );
    if (sentok==NULL)
      log("ZFTP:ERROR:no memory\n");
    else
    {
      sentok->client_ip = client->addr.sin_addr.s_addr;
      list_attach(&zftp_sentok_list, (void*)sentok);
    }
  }

  CloseHandle(client->handle);
  client->handle = NULL;

  list_detach(&zftp_client_list, (void*)client);

  ExitThread(0);

} // zftp_ClientThread

void WINAPI zftp_ServerThread(zftp_server_struct* server)
{
  list_attach(&zftp_server_list, (void*)server);

  log("ZFTP:server listens on %s:%i\n", inet_ntoa( *(in_addr*)&server->server_ip ), ZFTP_SERVER_PORT);

  SOCKET t = socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
  if (t == INVALID_SOCKET)
    log("ZFTP:ERROR:cant create socket\n");
  else
  {
    server->listen_socket = t;

    sockaddr_in addr = {AF_INET};
    addr.sin_port = htons(ZFTP_SERVER_PORT);
    addr.sin_addr.s_addr = server->server_ip;

    if (bind(server->listen_socket, (sockaddr*)&addr, sizeof(sockaddr)) != 0)
      log("ZFTP:ERROR:cant bind\n");
    else
    {
      DWORD nb1 = 1;
      ioctlsocket(server->listen_socket, FIONBIO, &nb1);

      for(;;)
      {

        server->time0 = GetTickCount();  // update last-alive time

        if (listen(server->listen_socket, SOMAXCONN) == SOCKET_ERROR)
        {
          log("ZFTP:ERROR:listen error\n");
          break;
        }

        fd_set readfds;
        readfds.fd_count = 1;
        readfds.fd_array[0] = server->listen_socket;
        timeval timeout = {1,0}; // 1 sec

        if (select(1, &readfds,NULL,NULL, &timeout)==0)
        {
          if (zftp_server_mustdie)
          {
            log("ZFTP:exiting\n");
            break;
          }
          else
            continue; // just timeout, no incoming data
        }

        sockaddr_in from;
        int fromlen = sizeof(from);
        SOCKET io_socket = accept(server->listen_socket, (sockaddr*)&from, &fromlen);
        if (io_socket == INVALID_SOCKET)
          log("ZFTP:ERROR:accept error\n");
        else
        {

          log("ZFTP:connection from %s:%i\n", inet_ntoa(from.sin_addr), ntohs(from.sin_port));

          if (zftp_client_list.count >= ZFTP_MAX_CLIENT_THREAD_COUNT)
          {
            log("ZFTP:ERROR:thread limit\n");
            closesocket(io_socket);
          }
          else
          {

            zftp_client_struct* client = (zftp_client_struct*) malloc( sizeof(zftp_client_struct) );
            if (client == NULL)
            {
              log("ZFTP:ERROR:no memory\n");
              closesocket(io_socket);
            }
            else
            {
              client->server_ip = server->server_ip;
              client->time0     = GetTickCount();
              client->addr      = from;
              client->io_socket = io_socket;
              DWORD tid;
              client->handle = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)&zftp_ClientThread, (LPVOID)client, 0, &tid);
              if (client->handle == NULL)
              {
                log("ZFTP:ERROR:cant create client thread\n");
                free(client);
                closesocket(io_socket);
              } // createthread

            } // malloc

          } // thread limit

        } // accept

      } // main cycle

    }// bind

    closesocket(server->listen_socket);
    server->listen_socket = NULL;

  } //socket

  CloseHandle(server->handle);
  server->handle = NULL;

  list_detach(&zftp_server_list, (void*)server);

  ExitThread(0);

} // zftp_ServerThread

void zftp_start_server_thread(DWORD server_ip)
{
  zftp_server_struct* server = (zftp_server_struct*) malloc( sizeof(zftp_server_struct) );
  if (server == NULL)
    log("ZFTP:ERROR:no memory\n");
  else
  {
    server->server_ip = server_ip;
    server->time0     = GetTickCount();
    DWORD tid;
    server->handle = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)&zftp_ServerThread, (LPVOID)server, 0, &tid);
    if (server->handle == NULL)
    {
      log("ZFTP:ERROR:cant create server thread\n");
      free(server);
    }
  }
} // zftp_start_server_thread

void zftp_kill_server_thread(zftp_server_struct* server)
{
  if (server->handle)
  {
    SuspendThread( server->handle );
    if (server->listen_socket)
    {
      closesocket( server->listen_socket );
      server->listen_socket = NULL;
    }
    TerminateThread( server->handle,0 );
    CloseHandle(server->handle);
    server->handle = NULL;
  }
  list_detach(&zftp_server_list, (void*)server);
} // zftp_kill_server_thread

void zftp_kill_client_thread(zftp_client_struct* client)
{
  if (client->handle)
  {
    SuspendThread( client->handle );
    if (client->io_socket)
    {
      closesocket( client->io_socket );
      client->io_socket = NULL;
    }
    TerminateThread( client->handle,0 );
    CloseHandle(client->handle);
    client->handle = NULL;
  }
  list_detach(&zftp_client_list, (void*)client);
} // zftp_kill_client_thread

void WINAPI zftp_MonitorThread(int)
{
  for(;;)
  {
    Sleep(ZFTP_MONITOR_CHECKTIME*1000);

    if (zftp_server_mustdie) break;

    EnterCriticalSection(&critical_section);

    ForEach(zftp_client_list, zftp_client_struct, client)
    {
      if (GetTickCount() - client->time0 > ZFTP_CLIENT_THREAD_MAX_TIME*1000)
      {
        log("ZFTP:ERROR:timeout, terminating client\n");
        zftp_kill_client_thread( client );
        break;
      }
    }

    ForEach(zftp_server_list, zftp_server_struct, server)
    {
      if (GetTickCount() - server->time0 > ZFTP_SERVER_THREAD_MAX_TIME*1000)
      {
        log("ZFTP:ERROR:timeout, restarting server\n");
        DWORD save_ip = server->server_ip;
        zftp_kill_server_thread( server );
        zftp_start_server_thread( save_ip );
        break;
      }
    }

    LeaveCriticalSection(&critical_section);

  }

  CloseHandle(zftp_monitor_thread);
  zftp_monitor_thread = NULL;

  ExitThread(0);

} // zftp_MonitorThread

void zftp_StartServer()
{
  memset(&zftp_server_list, 0x00, sizeof(list_struct));
  memset(&zftp_client_list, 0x00, sizeof(list_struct));
  memset(&zftp_sentok_list, 0x00, sizeof(list_struct));

  zftp_server_mustdie = 0;
  zftp_monitor_thread = NULL;

  ForEach(hostaddr_list, hostaddr_struct, h)
  {
    zftp_start_server_thread( h->host_ip );
  }

  DWORD tid;
  zftp_monitor_thread = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)&zftp_MonitorThread, (LPVOID)NULL, 0, &tid);
  if (zftp_monitor_thread == NULL)
    log("ZFTP:ERROR:cant create monitor thread\n");

} // zftp_StartServer

void zftp_StopServer()
{
  zftp_server_mustdie++;

  for (int i=0; i < ZFTP_STOP_TIMEOUT * 1000; i++)
  {
    if (zftp_server_list.count + zftp_client_list.count == 0) break;
    Sleep(1000);
  }

  if (zftp_monitor_thread)  // in case of monitor thread halted
  {
    TerminateThread( zftp_monitor_thread,0 );
    CloseHandle(zftp_monitor_thread);
    zftp_monitor_thread = NULL;
  }

  while (zftp_server_list.count)        // halted server threads
  {
    log("ZFTP:ERROR:terminating server\n");
    zftp_kill_server_thread( (zftp_server_struct*)zftp_server_list.tail );
  }

  while (zftp_client_list.count)        // halted client threads
  {
    log("ZFTP:ERROR:terminating client\n");
    zftp_kill_client_thread( (zftp_client_struct*)zftp_client_list.tail );
  }

} // zftp_StopServer

////////x///////x///////x///////x///////x///////x///////x///////x///////x///
