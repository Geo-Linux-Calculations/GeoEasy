# add path to tcl_cruncher if installed
#TCL_CRUNCHER = ./tcl_cruncher
SRCS = src
# uncomment next line if no tcl_cruncher installed

all: source

source: ${SRCS}
	$(MAKE) -C ${SRCS} source -r

clean: ${SRCS}
	$(MAKE) -C ${SRCS} clean
