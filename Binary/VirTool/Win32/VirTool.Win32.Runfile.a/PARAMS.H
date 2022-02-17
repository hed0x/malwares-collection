
// PARAMS.H - AZCME global parameters/constants
// Copyright (C) 1998 Z0MBiE/29A

#define max_code_size           0x10000    // max code sction size
#define max_cmd                 4096       // max instructions in code sect.

/* disassembler parameters */

//#define FULL_DUMP               // full instruction dump
//#define SHORT_DUMP              // short dump

/* file infection parameters */

#define RENAME_SECTIONS         // rename sections at random
#define RESORT_OBJTABLE         // restort objentries
#define RESORT_MY_SECTIONS      // add own sections with random order

#define REDEFINE_SUBSYSTEM      // set subsystem to windows char

/* engine parameters */

//#define DEBUG_FILES             // create debug files


