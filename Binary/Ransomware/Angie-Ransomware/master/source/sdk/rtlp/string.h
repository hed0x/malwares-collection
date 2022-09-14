#ifndef __INCLUDE_RTLP_STRING_H
#define __INCLUDE_RTLP_STRING_H

VOID
RtlpStringToUppercase(
    IN PSTR szString
    );

SIZE_T
RtlpStringCount(
    IN PSTR szString
    );

BOOL
RtlpStringCompareNZ(
    IN PVOID  String1,
    IN PVOID  String2,
    IN SIZE_T MaxCompareCount
    );

#endif
