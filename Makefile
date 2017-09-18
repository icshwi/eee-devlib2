
TOP = $(CURDIR)

include $(TOP)/configure/CONFIG

M_DIRS:=$(sort $(dir $(wildcard $(TOP)/*/.)))


# help is defined in 
# https://gist.github.com/rcmachado/af3db315e31383502660
help:
	$(info --------------------------------------- )	
	$(info Available targets)
	$(info --------------------------------------- )
	@awk '/^[a-zA-Z\-\_0-9]+:/ {                    \
	  nb = sub( /^## /, "", helpMsg );              \
	  if(nb == 0) {                                 \
	    helpMsg = $$0;                              \
	    nb = sub( /^[^:]*:.* ## /, "", helpMsg );   \
	  }                                             \
	  if (nb)                                       \
	    print  $$1 "\t" helpMsg;                    \
	}                                               \
	{ helpMsg = $$0 }'                              \
	$(MAKEFILE_LIST) | column -ts:	

default: help



#
# We have to keep ${EPICS_ENV_PATH} within SUDO
# 
## Install   EPICS Module in order to use it with EEE
install:
	sudo -E bash -c 'make -f $(ESS_MODULE_MAKEFILE) LIBVERSION=$(ESS_MODULE_VERSION) SRC_TOP=$(EPICS_MODULE_PATH) PROJECT=$(ESS_MODULE_PROJECT_NAME)  install'


## Build     EPICS Module in order to use it with EEE
build:
	make -f $(ESS_MODULE_MAKEFILE) LIBVERSION=$(ESS_MODULE_VERSION) SRC_TOP=$(EPICS_MODULE_PATH) PROJECT=$(ESS_MODULE_PROJECT_NAME)


## Clean     EPICS Module in terms of EEE Makefile (module.Makefile)
clean:
	make -f $(ESS_MODULE_MAKEFILE) LIBVERSION=$(ESS_MODULE_VERSION) SRC_TOP=$(EPICS_MODULE_PATH) PROJECT=$(ESS_MODULE_PROJECT_NAME) clean


## Distclean EPICS Module in terms of EEE Makefile (module.Makefile)
distclean:
	make -f $(ESS_MODULE_MAKEFILE) LIBVERSION=$(ESS_MODULE_VERSION) SRC_TOP=$(EPICS_MODULE_PATH) PROJECT=$(ESS_MODULE_PROJECT_NAME) distclean


## Get      EPICS Module, and change its $(EPICS_MODULE_TAG)
init:
	@git submodule deinit -f $(EPICS_MODULE_NAME)/
	git submodule deinit -f $(EPICS_MODULE_NAME)/	
	git submodule init $(EPICS_MODULE_NAME)/
	git submodule update --init --remote --recursive $(EPICS_MODULE_NAME)/.
	cd $(EPICS_MODULE_NAME) && git checkout tags/$(EPICS_MODULE_TAG)


## Print ENV variables
env:
	@echo ""
	@echo "EPICS_BASE             : "$(EPICS_BASE)
	@echo "EPICS_MODULE_NAME      : "$(EPICS_MODULE_NAME)
	@echo "EPICS_MODULE_TAG       : "$(EPICS_MODULE_TAG)
	@echo "ESS_MODULE_VERSION     : "$(ESS_MODULE_VERSION)
	@echo "ESS_MODULE_MAKEFILE    : "$(ESS_MODULE_MAKEFILE)
	@echo "ESS_MODULE_PROJECTNAME : "$(ESS_MODULE_PROJECT_NAME)
	@echo ""
	@echo "EPICS_BASES_PATH       : "$(EPICS_BASES_PATH)
	@echo "EPICS_MODULES_PATH     : "$(EPICS_MODULES_PATH)
	@echo "EPICS_HOST_ARCH        : "$(EPICS_HOST_ARCH)
	@echo "EPICS_ENV_PATH         : "$(EPICS_ENV_PATH)
	@echo ""



dirs:
	@echo $(M_DIRS) || true


.PHONY: install build clean distclean init env dirs
