
    // ForEach: on multithread lists, must be used under critical section
#define ForEach( list, entry_s, var )        \
  for( entry_s* var = (entry_s*) list.root;  \
       var != NULL;                          \
       var = (entry_s*) var->next )

struct list_entry_struct                // list entry prototype
{
  list_entry_struct* next;              // pointer to next entry in list
  DWORD whatever;                       // data
};

struct list_struct
{
  int count;                            // # of entries in list
  list_entry_struct* root;              // first entry
  list_entry_struct* tail;              // last entry
};

void list_attach(list_struct* list, void* entry)
{
  EnterCriticalSection(&critical_section);

  list->count++;

  list_entry_struct* l_entry = (list_entry_struct*) entry;

  l_entry->next = NULL;

  if (list->root == NULL)
    list->root = l_entry;
  else
    list->tail->next = l_entry;

  list->tail = l_entry;

  LeaveCriticalSection(&critical_section);
}

void list_detach(list_struct* list, void* entry)
{
  EnterCriticalSection(&critical_section);

  int success = 0;

  for (list_entry_struct* t = list->root, *prev = NULL;
       t != NULL;
       prev = t, t = t->next)
  {
    if (t == entry)
    {
      if (t == list->tail) list->tail = prev;

      if (prev)
        prev->next = t->next;
      else
        list->root = t->next;

      list->count--;

      free( entry );

      success++;

      break;
    }
  }

  if (!success)
    log("ERROR:invalid list_detach operation\n");

  LeaveCriticalSection(&critical_section);
}
