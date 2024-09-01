INSTDIR := out
SUBDIRS := frchor bwchor balcantare

$(INSTDIR) :
	mkdir $(INSTDIR)

.PHONY: all install $(SUBDIRS)
all: $(INSTDIR) $(SUBDIRS) 

$(SUBDIRS):
	$(MAKE) -C $@ INSTDIR=../$(INSTDIR) all install
