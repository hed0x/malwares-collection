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



#ifndef COMCODE_H
#define COMCODE_H		1

#define LYM_EXIT 0x00 		// ask if sure want to quit y/n [n]:
#define LYM_PING 0x01		// virtual lyceum ping
#define LYM_HIBERNATE 0x02	// tell server to hibernate
#define LYM_OIBBD 0x03		// open bounce icmp backdoor
#define LYM_OIBD 0x04		// open icmp backdoor
#define LYM_BNDCMD 0x05		// execute blind command
#define LYM_SUBNET 0x06		// set server subnet spoofing
#define LYM_PING_REPLY 0x07	// lyceum ping reply

#define BI_SPOOF 0
#define BOUNCE 1

#endif // COMCODE_H
