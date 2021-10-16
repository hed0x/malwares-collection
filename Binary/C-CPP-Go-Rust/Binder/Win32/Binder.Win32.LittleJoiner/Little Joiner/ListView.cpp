#include "Includes.h"

VOID InitListView1(HWND hList)
{
	LV_COLUMN LVC;
	SendMessage(hList,LVM_SETEXTENDEDLISTVIEWSTYLE,0,LVS_EX_GRIDLINES+LVS_EX_FULLROWSELECT );
	memset(&LVC,0,sizeof(LV_COLUMN));

	LVC.mask=LVCF_TEXT+LVCF_WIDTH;
	LVC.fmt=LVCFMT_LEFT;
	LVC.cx=300;
	LVC.cchTextMax =256;
	LVC.pszText="Archivo";
	SendMessage(hList,LVM_INSERTCOLUMN,0,(LPARAM)&LVC);

	LVC.mask=LVCF_TEXT+LVCF_WIDTH;
	LVC.fmt=LVCFMT_LEFT;
	LVC.cx=90;
	LVC.cchTextMax =256;
	LVC.pszText="Tamaño";
	SendMessage(hList,LVM_INSERTCOLUMN,2,(LPARAM)&LVC);
}

VOID ListAddItem(HWND hList,LPSTR Text1,LPSTR Text2)
{
	LV_ITEM LVI;
	memset(&LVI,0,sizeof(LV_ITEM));

	LVI.mask=1;
	LVI.pszText=Text1;
	LVI.cchTextMax=256;
	LVI.stateMask=0;
	LVI.state=0;
	LVI.iImage=0;
	LVI.lParam=0;
	SendMessage(hList,LVM_INSERTITEM,1,(LPARAM)&LVI);

	LVI.mask=LVIF_TEXT;
	LVI.iSubItem=1;
	LVI.pszText=Text2;
	LVI.cchTextMax=256;
	SendMessage(hList,LVM_SETITEM,0,(LPARAM)&LVI); 
}

VOID DeleteSelectedItem(HWND hList)
{
	DWORD Item=SendMessage(hList,LVM_GETNEXTITEM,-1,LVNI_FOCUSED);
	SendMessage(hList,LVM_DELETEITEM,Item,0);
}

LPSTR GetItem(HWND hList,DWORD Item,DWORD SubItem)
{
	LV_ITEM LVI;
	CHAR pszText[MAX_PATH];
	memset(&LVI,0,sizeof(LV_ITEM));

	LVI.mask = LVIF_TEXT;
	LVI.iItem=Item;
	LVI.iSubItem=SubItem;
	LVI.cchTextMax=MAX_PATH;
	LVI.pszText = pszText;

	SendMessage(hList,LVM_GETITEM,0,(LPARAM)&LVI);

	return LVI.pszText;
}
