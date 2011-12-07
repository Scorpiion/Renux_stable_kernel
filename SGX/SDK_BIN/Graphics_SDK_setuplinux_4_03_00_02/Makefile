include Rules.make
include Makefile.KM
include Makefile.SDK

.PHONY: all

clean: clean_km clean_sdk

all: all_km all_sdk

install: install_km install_sdk

############################# HELP ##################################
help:
	@echo ""
	@echo "Usage (for build): make BUILD={debug | release} OMAPES={2.x | 3.x | 5.x | 6.x} FBDEV={yes | no} all"
	@echo "      Platform       				OMAPES "
	@echo "      --------					------ "       
	@echo "      OMAP35x(for SGX core 1.0.3)     		 2.x   "
	@echo "      OMAP35x			  		 3.x   "
	@echo "      OMAP37x/AM37x                    		 5.x   "
	@echo "      816x(389x)/814x(387x)         		 6.x   "
	@echo "--> Specifying OMAPES is mandatory. BUILD=release and FBDEV=yes by default"
	@echo "Usage (for install): make BUILD=(debug | release} OMAPES={2.x | 3.x | 5.x | 6.x} install"
	@echo "--> See online Graphics Getting Started Guide for further details."
	@echo ""

###########################################################################

