/**
 * \file sysid.h 
 *
 * \description Definition file for Altera SYSID core controller class.
 *
 *
 * \copyright Critical Link LLC 2013
 */
#ifndef TCSYSID_H
#define TCSYSID_H

class tcSysID {
public:
	tcSysID(unsigned int BaseAddr);
	~tcSysID(void) {};

	const char* GetSysIdString(void) { return maSysIdString; }
	const char* GetTimestamp(void) { return maTimestamp; }
	unsigned int GetSysId(void) { return mnSysId; }

protected:
	char		maSysIdString[128];
	char		maTimestamp[80];
	unsigned int	mnSysId;
};

#endif
