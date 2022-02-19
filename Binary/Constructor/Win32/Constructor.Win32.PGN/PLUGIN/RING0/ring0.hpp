
#ifndef __RING0_HPP__
#define __RING0_HPP__

#pragma pack(push)
#pragma pack(1)

int __cdecl call_in_ring0( int __cdecl r0proc(...), ... );

#pragma pack(pop)

#endif // __RING0_HPP__
