

    DWORD tt;
    for (DWORD i=0; i<pe->pe_numofobjects; i++)
      if (oe[i].oe_objectflags==0xC0000040)
        tt = oe[i].oe_virtrva +
            (oe[i].oe_virtsize == 0 ? oe[i].oe_physsize : oe[i].oe_virtsize);

  for (hooy* h=root, *h0=h; h; h0=h, h=h->next)
  if (h->oldrva >= tt)
  if (h->flags & FL_SECTALIGN)
  {
    hooy* z = (hooy*) user_malloc(user_arg,sizeof(hooy));
    if (z==0) return ERR_NOMEMORY;
    z->flags = FL_DATA | FL_VPRESENT;
    z->datalen = 1000;
    z->dataptr = (BYTE*) user_malloc(user_arg, z->datalen);
    if (z->dataptr==0) return ERR_NOMEMORY;
    memset(z->dataptr, 0, z->datalen);
    z->next = h0->next;
    h0->next = z;
    break;
  }
