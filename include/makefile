# This makefile may be included by the
# the actual dirs which contain the books.
# define there:
# books := mybook.pdf 
# TOPDIR := ..
# include $(TOPDIR)/include/makefile
#

INSTDIR = $(TOPDIR)/out
install_targets = $(addprefix $(INSTDIR)/,$(books) $(patsubst %.pdf,%.log,$(books))) 

# The suffixes used in this Makefile.
.SUFFIXES: .tex .dep .pdf .log .toc .toc.md5 .aux

.PHONY: all install
all: $(books)
install: $(install_targets)

DEPFILES := $(addsuffix .dep,$(basename $(books)))
$(DEPFILES):
include $(wildcard $(DEPFILES))

%.pdf: %.tex
	./$(TOPDIR)/include/mklatex.sh $(*F)


$(INSTDIR)/%: %
	cp $< $@

