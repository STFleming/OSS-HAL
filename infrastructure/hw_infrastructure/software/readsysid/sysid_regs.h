/**
 * \file sysid_regs.h 
 *
 * \description Definition file for sysid core registers
 *
 *
 * \copyright Critical Link LLC 2013
 */

/* 4 byte word offsets */
#define VERSION_OFFSET		0
#define TIMEStAMP_OFFSET	1

typedef union
{
	struct
	{
		unsigned int minor	: 16;
		unsigned int major	: 16;
	} msBits;
	unsigned int mnWord;
} tuSYSIDVER;

typedef union
{
	struct
	{
		unsigned int enable	: 1;
		unsigned int reserved	: 31;
	} msBits;
	unsigned int mnWord;
} tuSYSIDTSR;

