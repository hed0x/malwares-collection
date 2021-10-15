/* Shadowinteger's simple XOR crypt (C) 2004 Michel Blomgren <michel@cycom.se>
 * $Id: xorcrypt.h,v 1.53 2004/05/13 15:54:33 shadow Exp $
 * http://www.cycom.se/dl/rrs
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 */

/* uncomment these if you need them
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
*/

static char *xorcrypt_key = NULL;
static int xorcrypt_key_length = 0;

int xorcrypt_symmetric_crypt(char *buf, int size, char *key, int keylength, int *key_offset_counter) {
    int i;

    if (buf == NULL)
        return 1;
    if (size <= 0)
        return 1;

    for (i = 0; i < size; i++) {
        /* xor it with current byte in the key */
        buf[i] = buf[i] ^ key[*key_offset_counter];

        key_offset_counter[0]++;
        /* rotate the counter, if we've reached that far... */
        if (*key_offset_counter >= keylength) {
            key_offset_counter[0] = 0;
        }
    }

    return 0;
}


int xorcrypt_write(int fd, char *buf, int size) {
    char *mbuf;
    int ret;
    static int xorcrypt_internal_counter = 0;

    /* duplicate input buffer, for encryption */
    if ((mbuf = strdup(buf)) == NULL) {
        return -1;
    }

    /* encrypt it */
    xorcrypt_symmetric_crypt(mbuf, size,
        xorcrypt_key, xorcrypt_key_length,
        &xorcrypt_internal_counter);

    /* write it */
    ret = write(fd, mbuf, size);

    /* free the duplicated buffer */
    free(mbuf);
    return ret;
}


int xorcrypt_read(int fd, char *buf, int size) {
    int ret;
    static int xorcrypt_internal_counter = 0;

    /* read it */
    ret = read(fd, buf, size);
    /* check if an error occured or EOF */
    if (ret <= 0) {
        return ret;
    }

    /* decrypt it */
    xorcrypt_symmetric_crypt(buf, ret,
        xorcrypt_key, xorcrypt_key_length,
        &xorcrypt_internal_counter);

    return ret;
}


int xorcrypt_init(char *key) {
/*
 * initialize xorcrypt_read and _write with a pass phrase
 */
    if (key == NULL)
        return 1;

    xorcrypt_key_length = strlen(key);

    if ((xorcrypt_key = strdup(key)) == NULL) {
        return 1;
    }

    return 0;
}


/**** below is not officially in xorcrypt ****/

#include "md5.h"
#include "sha1.h"

char *generate_xorcrypt_key(char *phrase) {
/*
 * this function will generate an ascii (sha1+md5)+(sha1+md5) hash to pass to
 * xorcrypt_init(). First, "phrase" will be hashed as a sha1, then an md5
 * hash. Then "phrase" will be reversed and hashed with a sha1+md5 once
 * again, only reversed. This will result in a 144 char long ascii key.
 */
    static char key[(((20*2) + (16*2)) * 2) + 1];
    char *revphrase;

    sha1_state sha1state;
    sha1_state *s = &sha1state;
    word *r;

    md5_state_t state;
    md5_byte_t digest[16];
    int di, xi;

    /* allocate memory for reverse phrase */
    if ((revphrase = malloc(strlen(phrase)+1)) == NULL) {
        return NULL;
    }

    /* make reverse phrase */
    di = strlen(phrase);
    xi = 0;
    while (di) {
        di--;
        revphrase[xi] = (char)phrase[di];
        xi++;
    }
    revphrase[xi] = '\0';

    /** generate sha1 hash **/

    sha1_init(s);
    di = 0;
    while (phrase[di]) {
        sha1_byte(s, phrase[di]);
        di++;
    }
    r = sha1_finish(s);
    sprintf(key, "%08lX%08lx%08lX%08lx%08lX", r[0], r[1], r[2], r[3], r[4]);

    /** generate md5 hash **/

    md5_init(&state);
    md5_append(&state, (const md5_byte_t*) phrase, strlen(phrase));
    md5_finish(&state, digest);
    /* lamely convert to hex */
    xi = strlen(key);
    for (di = 0; di < 16; ++di) {
        sprintf((key + xi) + di * 2, "%02x", digest[di]);
    }

    /** generate sha1 hash of reversed phrase **/

    sha1_init(s);
    di = 0;
    while (revphrase[di]) {
        sha1_byte(s, revphrase[di]);
        di++;
    }
    r = sha1_finish(s);
    sprintf(&key[strlen(key)], "%08lx%08lX%08lX%08lX%08lx", r[0], r[1], r[2], r[3], r[4]);

    /** generate md5 hash of reversed phrase **/

    md5_init(&state);
    md5_append(&state, (const md5_byte_t*) revphrase, strlen(revphrase));
    md5_finish(&state, digest);
    /* lamely convert to hex */
    xi = strlen(key);
    for (di = 0; di < 16; ++di) {
        sprintf((key + xi) + di * 2, "%02x", digest[di]);
    }

    return &key[0];
}

