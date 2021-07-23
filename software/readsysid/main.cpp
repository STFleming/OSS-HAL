/**
 * \file main.cpp 
 *
 * \description main entry point for Application.
 *
 *
 * \copyright Critical Link LLC 2013
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sysid.h"

#define SYSID_BASEADDR          0xFF200000

int main(int argc, char* argv[])
{
	/* Initialize controller objects */
	tcSysID sysId(SYSID_BASEADDR);

	/* Print out Sys ID and Build data */
	printf ("%s\n", sysId.GetSysIdString());
	return 0;
}
