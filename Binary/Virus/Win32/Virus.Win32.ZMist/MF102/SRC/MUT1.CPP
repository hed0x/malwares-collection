
  for (hooy* h=root; h; h=h->next)
  if (h->flags & (FL_OPCODE|FL_FIXUP))
  if (h->next->flags & FL_OPCODE)
  if (h->dataptr[0] != 0xEB)
  {
    hooy* z = (hooy*) user_malloc(user_arg,sizeof(hooy));
    if (z==0) return ERR_NOMEMORY;
    z->flags = FL_OPCODE | FL_CODE | FL_PRESENT | FL_VPRESENT;
    z->datalen = 5;
    z->dataptr = (BYTE*) user_malloc(user_arg, z->datalen);
    if (z->dataptr==0) return ERR_NOMEMORY;
    z->dataptr[0] = 0xEB;
    z->dataptr[1] = 0x03;
    z->dataptr[2] = '•';
    z->dataptr[3] = '“';
    z->dataptr[4] = '‰';
    z->next = h->next;
    h->next = z;
  }
