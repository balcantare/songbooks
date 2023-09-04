# This makefile may be included by the
# the actual dirs which contain the books.
# define there:
# books := mybook.pdf 
# TOPDIR := ..
# include $(TOPDIR)/include/makefile
#

INSTDIR = $(TOPDIR)/out
install_targets = $(addprefix $(INSTDIR)/,$(books) $(patsubst %.pdf,%.log,$(books))) 

LATEX_CMD := xelatex

# The suffixes used in this Makefile.
.SUFFIXES: .tex .dep .pdf .log

.PHONY: all install
all: $(books)
install: $(install_targets)

DEPFILES := $(addsuffix .dep,$(basename $(books)))
$(DEPFILES):
include $(wildcard $(DEPFILES))

%.pdf: %.tex
	$(LATEX_CMD) $< 
	echo -n '$@ : ' > $(*F).dep
	grep -Eo '\.+/[^>) ]*\.tex' $(*F).log | tr '\n' ' ' >> $(*F).dep


$(INSTDIR)/%: %
	cp $< $@

