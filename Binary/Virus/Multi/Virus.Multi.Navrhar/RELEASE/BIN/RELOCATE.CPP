#include <stdio.h>
#include <stdlib.h>

#define BASE1 0x0
#define BASE2 0x1
#define MAXLEN 10240
#define MAXRELOS 10240

char file1[MAXLEN];
char file2[MAXLEN];
int  actual_len;

struct reloinfo {
  char relo[MAXRELOS];
  int  relos;
  int  relo_base;
  int  relo_fp;
};

reloinfo relo_list[3] = { {{0}, MAXRELOS-1, -1, 0},
                   {{0}, MAXRELOS-1, -1, 0}, {{0}, MAXRELOS-1, -1, 0} };


void find_relos()
{
  int i, j, k, l;

  for (i=relo_list[2].relo_fp; i<actual_len-1; i++) {
    if (file1[i]!=file2[i]) {

        k = (*((int *) &file1[i]) -= BASE1);

        for (l=0; l<3; l++)
          if (l==2||relo_list[l+1].relo_fp>k) {

            *((int *) &file1[i]) -= relo_list[l].relo_fp;

            // relative to start of relocode
            j = i-relo_list[l].relo_base;
            if (j<256) relo_list[l].relo[relo_list[l].relos--] = j;
            else {
              relo_list[l].relo[relo_list[l].relos--] = 0;
              relo_list[l].relo[relo_list[l].relos--] = j >> 8;
              relo_list[l].relo[relo_list[l].relos--] = j & 255;
            }
            relo_list[l].relo_base = i;
            i+=3;
            break;
          }

    }
  }
}

void main(int args, char * files[])
{
  FILE * f;
  int l, xlen;

  printf("VXD res relocator\n");
  if (args==4) {
    printf("Relocating files %s and %s to file %s\n", files[1], files[2], files[3]);
  } else exit(1);

  if (!(f=fopen(files[1], "rb"))) return ;
  fseek(f, 0x200+BASE1, SEEK_SET);
  actual_len = fread(file1, 1, MAXLEN,  f);
  fclose(f);

  if (!(f=fopen(files[2], "rb"))) return ;
  fseek(f, 0x200+BASE2, SEEK_SET);
  if (actual_len != fread(file2, 1, MAXLEN, f)) return ;
  fclose(f);

  relo_list[1].relo_fp = *((int *) file1);
  relo_list[2].relo_fp = *((int *) (file1+4));
  relo_list[0].relo_base = relo_list[2].relo_fp-1;
  relo_list[1].relo_base = relo_list[2].relo_fp-1;
  relo_list[2].relo_base = relo_list[2].relo_fp-1;



  xlen = *((int *) (file1+4)) - *((int *) file1);

//  relo1base = relo2base = filebase-1;

  if (*(int *)(&file1[relo_list[2].relo_fp])!='IMOD') {
    printf("Invalid module file\n");
    return;
  }

  // do something
  find_relos();
  // add null relo (terminator)
  for (l=0; l<3; l++) {
    relo_list[l].relo[relo_list[l].relos--] = 0;
    relo_list[l].relo[relo_list[l].relos--] = 0;
    relo_list[l].relo[relo_list[l].relos--] = 0;
  }

  *(int *)(&file1[relo_list[2].relo_fp]) = actual_len - relo_list[2].relo_fp +
       (MAXRELOS-relo_list[0].relos-1) + (MAXRELOS-relo_list[1].relos-1) +
       (MAXRELOS-relo_list[2].relos-1) - 1;

  if (!(f=fopen(files[3], "w+b"))) return ;
  fwrite(&file1[relo_list[2].relo_fp], actual_len-relo_list[2].relo_fp, 1, f);

  for (l=2; l>=0; l--) {
    fwrite(&relo_list[l].relo[1+relo_list[l].relos], 1, MAXRELOS-relo_list[l].relos-1, f);
  }
  fwrite(&xlen, 4, 1, f);
  fclose(f);
  printf("DONE\n");
}
