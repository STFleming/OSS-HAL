/**
 * \file sysid.cpp 
 *
 * \description Implementation file for Altera SYSID core controller class.
 *
 *
 * \copyright Critical Link LLC 2013
 */

#include "sysid.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>

tcSysID::tcSysID(unsigned int BaseAddr)
: mnSysId(0)
{
	int fd;

	sprintf(maSysIdString, "Unknown");
	sprintf(maTimestamp, "Unknown");

	/* map in the addresses */
	if ((fd = open("/dev/mem", O_RDONLY)) < 0)
	{
		perror("/dev/mem");
	}
	else
	{
		void *lpmem = mmap(0, 4096, PROT_READ, MAP_SHARED, fd, BaseAddr);
		close(fd);
		if (lpmem == MAP_FAILED)
		{
			perror("mmap");
		}
		else
		{
			/* read out the version and timestamps */
			unsigned int * lpint = (unsigned int *)lpmem;
			mnSysId = lpint[0];
			time_t t = lpint[1];
			strcpy(maTimestamp, ctime(&t));
		sprintf(maSysIdString, "FPGA SYSID - %08x : %s\n", 
				mnSysId, maTimestamp);

			/* close the address */
			munmap(lpmem, 4096);
		}
	}
}
