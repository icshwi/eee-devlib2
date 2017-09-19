# This makefile is only valid for Tag 2.9, not for master branch
# with from EPICS BASE 3.15 

# LIBVERSION is overwritten by the python script in module.Makefile, so it didn't work
# LIBVERSION=2.9.0

STARTUPS=-none-
EXCLUDE_VERSIONS=3.14


# SRC_TOP : Local Variable to represent where all source files are located.
#           Input variable of the main Makefile


# USR_INCLUDES += -I$(SRC_TOP)/common/
# USR_INCLUDES += -I$(SRC_TOP)/pciApp/
# USR_INCLUDES += -I$(SRC_TOP)/vmeApp/


HEADERS += $(SRC_TOP)/pciApp/devLibPCI.h
HEADERS += $(SRC_TOP)/pciApp/devLibPCIImpl.h


SOURCES += $(wildcard $(SRC_TOP)/pciApp/devLib*.c)
SOURCES += $(SRC_TOP)/pciApp/pcish.c

SOURCES_Linux   += $(SRC_TOP)/pciApp/os/Linux/devLibPCIOSD.c


HEADERS += $(SRC_TOP)/vmeApp/devcsr.h
HEADERS += $(SRC_TOP)/vmeApp/vmedefs.h

SOURCES += $(SRC_TOP)/vmeApp/devcsr.c
SOURCES += $(SRC_TOP)/vmeApp/iocreg.c
SOURCES += $(SRC_TOP)/vmeApp/vmesh.c
SOURCES += $(SRC_TOP)/vmeApp/devlib_compat.c


DBDS += $(SRC_TOP)/pciApp/epicspci.dbd
DBDS += $(SRC_TOP)/vmeApp/epicsvme.dbd


#include ${HOME}/ics_gitsrc/m-epics-environment/scripts/module.Makefile

include ${EPICS_ENV_PATH}/module.Makefile

