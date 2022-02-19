
// CODE PERVERTOR
// 1.01

#define CODESIZE 4096

int OPT_ALL=0;

void pervert_buf(BYTE* buf,
                 DWORD bufsize)
{
  printf("perverting %ik\n", bufsize/1000);
  disasm_init();

  for (DWORD i=0; i<bufsize-16; i+=disasm(&buf[i]))
  {
//  printf("+%04X\n",i);

    if (disasm(&buf[i])<=0)
    {
      printf("***ERROR***: cant disassemble at %04X, %02X %02X\n",i,buf[i],buf[i+1]);
      return;
    }

    if ((buf[i]==0)&&(buf[i+1]==0))
    {
      printf("0");
      break;
    }

    // push ebp
    // mov ebp, esp
    // sub esp, ...
    // enter
    if (buf[i]==0x55)
    if (buf[i+1]==0x8B)
    if (buf[i+2]==0xEC)
    if (buf[i+3]==0x83) // add esp, -x
    if (buf[i+4]==0xC4)
    if (((char)buf[i+5]<=0)&&(buf[i+5]!=0x80)) // -128 sux
    if (OPT_ALL||rnd(2))
    {
      printf("k");
      buf[i]=0xC8;
      buf[i+1]=-buf[i+5];
      buf[i+2]=0;
      buf[i+3]=0;
      buf[i+4]=0x90;
      buf[i+5]=0x90;
    }

    // enter
    if (buf[i]==0x55)
    if (buf[i+1]==0x8B)
    if (buf[i+2]==0xEC)
    if (buf[i+3]==0x81) // add esp, xxxxxxxx
    if (buf[i+4]==0xC4)
    if ((buf[i+7]==0xFF)&&(buf[i+8]==0xFF))
    if (OPT_ALL||rnd(2))
    {
      printf("l");
      buf[i]=0xC8;
      long t = -((long)buf[i+5]+(buf[i+6]<<8));
      buf[i+1]=t;
      buf[i+2]=t>>8;
      buf[i+3]=0;
      buf[i+4]=0x90;
      buf[i+5]=0x90;
      buf[i+6]=0x90;
      buf[i+7]=0x90;
      buf[i+8]=0x90;
    }

    // enter
    if (buf[i]==0x55)
    if (buf[i+1]==0x8B)
    if (buf[i+2]==0xEC)
    if (buf[i+3]==0x83) // sub esp, x
    if (buf[i+4]==0xEC)
    if ((signed)buf[i+5]>=0)
    if (OPT_ALL||rnd(2))
    {
      printf("m");
      buf[i]=0xC8;
      buf[i+1]=buf[i+5];
      buf[i+2]=0;
      buf[i+3]=0;
      buf[i+4]=0x90;
      buf[i+5]=0x90;
    }

    // mov esp, ebp
    // pop ebp
    // leave
    if (buf[i]==0x8B)
    if (buf[i+1]==0xE5)
    if (buf[i+2]==0x5D)
    if (OPT_ALL||rnd(2))
    {
      printf("n");
      buf[i]==0xC9;
      buf[i+1]==0x90;
      buf[i+2]==0x90;
    }

    // 000ttt01 11xxxyyy     ; ttt r1,r2 (ADD,ADC,AND,OR,SUB,SBB,XOR,CMP)
    // 000ttt11 11yyyxxx
    // 10001001 11xxxyyy     ; mov r1,r2
    // 10001011 11yyyxxx
    if ((buf[i+1]&0xC0)==0xC0)
    if (((buf[i]&0xE1)==0x01)||((buf[i]&0xFD)==0x89))
//  if (((buf[i]&0xE0)==0x00)||((buf[i]&0xFC)==0x88))
    if (OPT_ALL||rnd(2))
    {
      printf("a");
      buf[i]^=0x02;
      buf[i+1]=0xC0|((buf[i+1]>>3)&7)|((buf[i+1]&7)<<3);
    }

    // 10001001 11xxxyyy     ; mov r1,r2
    // 01010xxx 01011yyy     ; push r2 // pop r1
    // 10001011 11xxxyyy     ; mov r1,r2
    // 01010yyy 01011xxx     ; push r2 // pop r1
    if ((buf[i+1]&0xC0)==0xC0)
    if ((buf[i]&0xFD)==0x89)
    if (OPT_ALL||rnd(2))
    {
      printf("b");
      BYTE t=buf[i];
      buf[i]  =0x50|((buf[i+1]>>(t==0x89?3:0))&7);
      buf[i+1]=0x58|((buf[i+1]>>(t==0x89?0:3))&7);
    }

    //if (xxx==yyy)
    //001100xx 11xxxyyy     ; xor r1,r1
    //001010xx 11xxxyyy     ; sub r1,r1
    if (((buf[i+1]&0xC0)==0xC0)&&(((buf[i+1]>>3)&7)==(buf[i+1]&7)))
    if (((buf[i]&0xFC)==0x30)||((buf[i]&0xFC)==0x28))
    if (OPT_ALL||rnd(2))
    {
      printf("c");
      buf[i]^=0x30^0x28;
    }

    //if (xxx==yyy)
    //0000100x 11xxxyyy     ; or r1,r1
    //1000010x 11xxxyyy     ; test r1,r1
    if (((buf[i+1]&0xC0)==0xC0)&&(((buf[i+1]>>3)&7)==(buf[i+1]&7)))
    if (((buf[i]&0xFE)==0x08)||((buf[i]&0xFE)==0x84))
    if (OPT_ALL||rnd(2))
    {
      printf("d");
      buf[i]^=0x08^0x84;
    }

    //10000011 11000xxx c   ; add r1,c
    //10000011 11101xxx -c  ; sub r1,-c
    if (buf[i]==0x83)
    if (((buf[i+1]&0xF8)==0xC0)||((buf[i+1]&0xF8)==0xE8))
    if (buf[i+2]!=0x80)
    if ((buf[i+1]&7)==4) // ESP only. May cause errors otherwise (CF)
    if (OPT_ALL||rnd(2))
    {
      printf("e");
      buf[i+1]^=0x28;
      buf[i+2]=-buf[i+2];
    }


    //1101000x 11tttxxx     ; ttt r1,1 (ROL,ROR,RCL,RCR,SHL/SHA,SHR,SAR)
    //1101000x 11tttxxx     ;
    //1100000x 11tttxxx c   ; ttt r1,c
    if (((buf[i]&0xFE)==0xD0)&&(buf[i+2]==buf[i]))
    if (((buf[i+1]&0xC0)==0xC0)&&(buf[i+3]==buf[i+1]))
    if (OPT_ALL||rnd(2))
    {
      printf("f");
      buf[i]^=0x10;
      buf[i+2]=2;
      buf[i+3]=0x90;
      if (rnd(2))
      {
        buf[i+3]=buf[i+2];
        buf[i+2]=buf[i+1];
        buf[i+1]=buf[i];
        buf[i]=0x90;
      }
    }

    //if (aaa==bbb)
    //if (ddd==aaa)
    //001100x1 11aaabbb     ; xor/sub r1,r1
    //100010x0 11cccddd     ; mov r1l,r2l
    //00001111 10110110 11aaaddd ; movzx r1,r2l
    if (((buf[i]&0xFD)==0x31)||((buf[i]&0xFD)==0x29))
    if ((buf[i+1]&0xC0)==0xC0)
    if ((buf[i+3]&0xC0)==0xC0)
    if ((((buf[i+1]>>3)^buf[i+1])&7)==0)
    if ((buf[i+1]&7)<4)
    if ((buf[i+2]&0xFD)==0x88)
    if (((buf[i+3]>>(buf[i+2]==0x88?0:3))&7)==(buf[i+1]&7))
    if (OPT_ALL||rnd(2))
    {
      printf("g");
      buf[i+2]=0xC0|
               (buf[i+1]&0x38)|
               ((buf[i+3]>>(buf[i+2]==0x88?3:0))&7);
      buf[i+1]=0xB6;
      buf[i]=0x0F;
      buf[i+3]=0x90;
      if (rnd(2))
      {
        buf[i+3]=buf[i+2];
        buf[i+2]=buf[i+1];
        buf[i+1]=buf[i];
        buf[i]=0x90;
      }
    }

    // mov r1, fs:[0]
    // xor r1,r1
    // mov r1,fs:[r1]
    if (buf[i]==0x64)
    if (buf[i+1]==0x67)
    if (buf[i+2]==0x8B)
    if ((buf[i+3]&0xC7)==0x06)
    if (buf[i+4]==0)
    if (buf[i+5]==0)
    if (OPT_ALL||rnd(2))
    {
      printf("h");
      buf[i]=0x33;
      buf[i+1]=0xC0|(buf[i+3]&0x38)|(buf[i+3]>>3)&7;
      buf[i+2]=0x64;
      buf[i+4]=(buf[i+3]&0x38)>>3;
      buf[i+3]=0x8B;
      buf[i+5]=0x90;
      if (rnd(2))
      {
        buf[i+5]=buf[i+4];
        buf[i+4]=buf[i+3];
        buf[i+3]=buf[i+2];
        buf[i+2]=buf[i+1];
        buf[i+1]=buf[i];
        buf[i]=0x90;
      }
    }

    // mov eax, fs:[0]
    // xor eax,eax
    // mov eax, fs:[r1]
    if (buf[i]==0x64)
    if (buf[i+1]==0x67)
    if (buf[i+2]==0xA1)
    if (buf[i+3]==0)
    if (buf[i+4]==0)
    if (OPT_ALL||rnd(2))
    {
      printf("i");
      buf[i]=0x33;
      buf[i+1]=0xC0;
      buf[i+2]=0x64;
      buf[i+3]=0x8B;
      buf[i+4]=0x00;
    }

    // or ecx,-1
    // xor ecx,ecx//dec ecx
    if (buf[i]==0x83)
    if ((buf[i+1]&0xF8)==0xC8)
    if (buf[i+2]==0xFF)
    if (OPT_ALL||rnd(2))
    {
      printf("j");
      buf[i]=0x33;
      BYTE t=buf[i+1]&7;
      buf[i+1]=0xC0|t|(t<<3);
      buf[i+2]=0x48|t;
    }



/////////////////////////////////////////////////////
/*
mov r1,mem   ;ebp
mov r2,mem
*/

  }
  printf("\nbuffer perverted\n");
}

void pervert_file(const char *filename)
{
  printf("processing file %s...\n", filename);
  MZ_HEADER mz;
  PE_HEADER pe;
  PE_OBJENTRY oe;
  FILE*f=fopen(filename,"r+b");
  if (f==NULL)
  {
    printf("***ERROR***: can not open file\n");
    return;
  }
  if ((fread(&mz,1,sizeof(mz),f)!=sizeof(mz))||(mz.mz_id!='MZ'))
  {
    printf("***ERROR***: bad MZ header\n");
    fclose(f);
    return;
  }
  fseek(f,mz.mz_neptr,SEEK_SET);
  if ((fread(&pe,1,sizeof(pe),f)!=sizeof(pe))||(pe.pe_id!=0x00004550))
  {
    printf("***ERROR***: bad PE header\n");
    fclose(f);
    return;
  }
  if (pe.pe_entrypointrva==0)
  {
    printf("***ERROR***: no entry point\n");
    fclose(f);
    return;
  }
  int j=0;
  for (int i=0; i<pe.pe_numofobjects; i++)
  {
    fread(&oe,1,sizeof(oe),f);
    if ((pe.pe_entrypointrva>=oe.oe_virtrva)&&
        (pe.pe_entrypointrva<oe.oe_virtrva+oe.oe_physsize))
    {
      j++;
      break;
    }
  }
  if (pe.pe_entrypointrva<pe.pe_headersize)
  {
    j++;
    oe.oe_physoffs=0;
    oe.oe_virtrva=0;
    oe.oe_physsize=oe.oe_virtsize=pe.pe_headersize;
  }
  if (!j)
  {
    printf("***ERROR***: entry point not found\n");
    fclose(f);
    return;
  }
  DWORD base_offs = oe.oe_physoffs+pe.pe_entrypointrva-oe.oe_virtrva;
//  DWORD base_virt = pe.pe_imagebase+pe.pe_entrypointrva;
  fseek(f,base_offs,SEEK_SET);
  BYTE buf[CODESIZE];
  DWORD bufsize = fread(&buf,1,sizeof(buf),f);
  pervert_buf(buf, bufsize);
  fseek(f,oe.oe_physoffs+pe.pe_entrypointrva-oe.oe_virtrva,SEEK_SET);
  fwrite(&buf,1,bufsize,f);
  fclose(f);
  printf("done\n");
}
