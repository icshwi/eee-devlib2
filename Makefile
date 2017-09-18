PROJECT=devlib2-epics

# LIBVERSION is overwritten by the python script in module.Makefile, so it didn't work
# However, I would like to keep this. 
#
LIBVERSION=2.9.0
STARTUPS=-none-
EXCLUDE_VERSIONS=3.14


PROJECT_TOP:=./devlib2
#BUILD_DIR:=$(PROJECT_TOP)/builddir

DBDS += $(PROJECT_TOP)/pciApp/epicspci.dbd


HEADERS += $(PROJECT_TOP)/pciApp/devLibPCI.h
HEADERS += $(PROJECT_TOP)/pciApp/devLibPCIImpl.h

SOURCES += $(PROJECT_TOP)/pciApp/devLibPCI.c
SOURCES += $(PROJECT_TOP)/pciApp/devLibPCIStrings.c
SOURCES += $(PROJECT_TOP)/pciApp/pcish.c

SOURCES_Linux   += $(PROJECT_TOP)/pciApp/os/Linux/devLibPCIOSD.c

#HEADERS_RTEMS   += $(PROJECT_TOP)/pciApp/os/RTEMS/devLibPCIOSD.h
#SOURCES_RTEMS   += $(PROJECT_TOP)/pciApp/os/RTEMS/devLibPCIOSD.c
#SOURCES_RTEMS   += $(PROJECT_TOP)/pciApp/osdPciShared.c

#HEADERS_vxWorks += $(PROJECT_TOP)/pciApp/os/vxWorks/devLibPCIOSD.h
#SOURCES_vxWorks += $(PROJECT_TOP)/pciApp/os/vxWorks/devLibPCIOSD.c
#SOURCES_vxWorks += $(PROJECT_TOP)/pciApp/osdPciShared.c


DBDS += $(PROJECT_TOP)/vmeApp/epicsvme.dbd

HEADERS += $(PROJECT_TOP)/vmeApp/devcsr.h
HEADERS += $(PROJECT_TOP)/vmeApp/vmedefs.h

SOURCES += $(PROJECT_TOP)/vmeApp/devcsr.c
SOURCES += $(PROJECT_TOP)/vmeApp/iocreg.c
SOURCES += $(PROJECT_TOP)/vmeApp/vmesh.c
SOURCES += $(PROJECT_TOP)/vmeApp/devlib_compat.c

SOURCES_Linux   += $(PROJECT_TOP)/pciApp/os/Linux/devLibPCIOSD.c
#SOURCES_RTEMS   += $(PROJECT_TOP)/pciApp/os/RTEMS/devLibPCIOSD.c
#SOURCES_vxWorks += $(PROJECT_TOP)/pciApp/os/vxWorks/devLibPCIOSD.c


#include ${HOME}/ics_gitsrc/m-epics-environment/scripts/module.Makefile

include ${EPICS_ENV_PATH}/module.Makefile
