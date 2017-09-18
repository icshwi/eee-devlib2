# LIBVERSION is overwritten by the python script in module.Makefile, so it didn't work
# LIBVERSION=2.9.0

STARTUPS=-none-
EXCLUDE_VERSIONS=3.14


# SRC_TOP : Local Variable to represent where all source files are located.
#           Input variable of the main Makefile

DBDS += $(SRC_TOP)/pciApp/epicspci.dbd


HEADERS += $(SRC_TOP)/pciApp/devLibPCI.h
HEADERS += $(SRC_TOP)/pciApp/devLibPCIImpl.h

SOURCES += $(SRC_TOP)/pciApp/devLibPCI.c
SOURCES += $(SRC_TOP)/pciApp/devLibPCIStrings.c
SOURCES += $(SRC_TOP)/pciApp/pcish.c

SOURCES_Linux   += $(SRC_TOP)/pciApp/os/Linux/devLibPCIOSD.c

#HEADERS_RTEMS   += $(SRC_TOP)/pciApp/os/RTEMS/devLibPCIOSD.h
#SOURCES_RTEMS   += $(SRC_TOP)/pciApp/os/RTEMS/devLibPCIOSD.c
#SOURCES_RTEMS   += $(SRC_TOP)/pciApp/osdPciShared.c

#HEADERS_vxWorks += $(SRC_TOP)/pciApp/os/vxWorks/devLibPCIOSD.h
#SOURCES_vxWorks += $(SRC_TOP)/pciApp/os/vxWorks/devLibPCIOSD.c
#SOURCES_vxWorks += $(SRC_TOP)/pciApp/osdPciShared.c


DBDS += $(SRC_TOP)/vmeApp/epicsvme.dbd

HEADERS += $(SRC_TOP)/vmeApp/devcsr.h
HEADERS += $(SRC_TOP)/vmeApp/vmedefs.h

SOURCES += $(SRC_TOP)/vmeApp/devcsr.c
SOURCES += $(SRC_TOP)/vmeApp/iocreg.c
SOURCES += $(SRC_TOP)/vmeApp/vmesh.c
SOURCES += $(SRC_TOP)/vmeApp/devlib_compat.c

SOURCES_Linux   += $(SRC_TOP)/pciApp/os/Linux/devLibPCIOSD.c
#SOURCES_RTEMS   += $(SRC_TOP)/pciApp/os/RTEMS/devLibPCIOSD.c
#SOURCES_vxWorks += $(SRC_TOP)/pciApp/os/vxWorks/devLibPCIOSD.c


#include ${HOME}/ics_gitsrc/m-epics-environment/scripts/module.Makefile


include ${EPICS_ENV_PATH}/module.Makefile

