#include <windows.h>
#include <commctrl.h>
#include <conio.h>

#ifndef LISTVIEW_H
#define LISTVIEW_H
VOID InitListView1(HWND hList);
VOID ListAddItem(HWND hList,LPSTR Text1,LPSTR Text2);
VOID DeleteSelectedItem(HWND hList);
LPSTR GetItem(HWND hList,DWORD Item,DWORD SubItem);
#endif