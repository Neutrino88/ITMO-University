#include "MyEdit.h"

MyEdit::MyEdit(const HINSTANCE hInstance, const HWND hParent, const DWORD flags, 
			   size_t l, size_t t, size_t w, size_t h)
	:hInstance(hInstance), hParent(hParent)
{ 
	hWnd = CreateWindowEx(WS_EX_CLIENTEDGE, L"edit",
		MYEDIT_BASE_TEXT, WS_VISIBLE | WS_TABSTOP | WS_CHILD | flags,
		l, t, w, h, hParent, NULL, hInstance, NULL);
}

HWND MyEdit::getParentHWnd(void) {
	return hParent;
}

HWND MyEdit::getHWnd(void) {
	return hWnd;
}