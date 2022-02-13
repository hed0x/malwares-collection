
struct hostaddr_struct : list_entry_struct
{
  DWORD host_ip;
};

list_struct hostaddr_list = {0,NULL,NULL};

void init_hostaddr_list()
{
  memset(&hostaddr_list, 0x00, sizeof(list_struct));

  BYTE  computer[MAX_COMPUTERNAME_LENGTH+1];
  gethostname(&computer[0], sizeof(computer));

  hostent* he = gethostbyname(computer);
  if ((he == NULL) || (he->h_addrtype != AF_INET))
  {
    log("ERROR:gethostbyname error\n");
    return;
  }

  for (int i=0; he->h_addr_list[i]!=NULL; i++)
  {
    hostaddr_struct* hostaddr = (hostaddr_struct*) malloc( sizeof(hostaddr_struct) );
    if (hostaddr == NULL)
    {
      log("ERROR:no memory\n");
      return;
    }
    hostaddr->host_ip = *(DWORD*)he->h_addr_list[i];
    list_attach(&hostaddr_list, (void*)hostaddr);
  }
}
