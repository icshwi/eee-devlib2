# This makefile is only valid for Tag 2.9, not for master branch
# with from EPICS BASE 3.15 

# LIBVERSION is overwritten by the python script in module.Makefile, so it didn't work
# LIBVERSION=2.9.0

STARTUPS=-none-
EXCLUDE_VERSIONS=3.14


# SRC_TOP : Local Variable to represent where all source files are located.
#           Input variable of the main Makefile
# All source codes are defined here, are defined in Makefile in each main Applcations with 
# Library IOC only. I don't add PRODUCT in this makefile. Still I have no idea how I implement
# the PRODUCT binary within EEE


PCIAPP = $(SRC_TOP)/pciApp
USR_INCLUDES += -I$(PCIAPP)

HEADERS += $(PCIAPP)/devLibPCI.h
HEADERS += $(PCIAPP)/devLibPCIImpl.h


SOURCES += $(wildcard $(PCIAPP)/devLib*.c)
SOURCES += $(PCIAPP)/pcish.c
SOURCES_Linux += $(PCIAPP)/os/Linux/devLibPCIOSD.c

DBDS += $(PCIAPP)/epicspci.dbd


VMEAPP = $(SRC_TOP)/vmeApp
USR_INCLUDES += -I$(VMEAPP)

HEADERS += $(VMEAPP)/devcsr.h
HEADERS += $(VMEAPP)/vmedefs.h

SOURCES += $(VMEAPP)/devcsr.c
SOURCES += $(VMEAPP)/iocreg.c
SOURCES += $(VMEAPP)/vmesh.c
SOURCES += $(VMEAPP)/devlib_compat.c

DBDS    += $(VMEAPP)/epicsvme.dbd





#include ${HOME}/ics_gitsrc/m-epics-environment/scripts/module.Makefile

include ${EPICS_ENV_PATH}/module.Makefile

