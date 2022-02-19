
#ifndef __PLAN_HPP__
#define __PLAN_HPP__

#pragma pack(push)
#pragma pack(1)

#define EV_PLAN_PER_MACHINE     0xCC81276B+0
#define EV_PLAN_PER_SESSION     0xCC81276B+1
#define EV_PLAN_PER_PROCESS     0xCC81276B+2

// EV_PLAN_PER_PROCESS: user_param values
#define PLAN_STDFILE            0
#define PLAN_EXPLORER           1
#define PLAN_WINSOCK            2
#define PLAN_ARCDROPPER         3

#pragma pack(pop)

#endif // __PLAN_HPP__
