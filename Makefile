TOP=.
include $(TOP)/Make.rules

TARGETS=\
	handout.pdf

all:: $(TARGETS)

clean:: texclean
	rm -f *.o $(TARGETS) *.out
