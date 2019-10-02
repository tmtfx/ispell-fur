SHELL      = /bin/sh
MAKE       = make
BUILDHASH  = buildhash
MUNCHLIST  = munchlist
LANGUAGE   = furlan
AFFIXES    = $(LANGUAGE).aff
DICTIONARY = $(LANGUAGE).dic
HASHFILE   = $(LANGUAGE).hash
INSTALLDIR = /usr/lib/ispell

all: $(HASHFILE)

$(HASHFILE):	$(AFFIXES) $(DICTIONARY)
	rm -f $(HASHFILE)
	$(BUILDHASH) $(DICTIONARY) $(AFFIXES) $(HASHFILE)

build: $(AFFIXES) $(DICTIONARY)
	$(BUILDHASH) $(LANGUAGE).words+ $(AFFIXES) $(HASHFILE)

clean:
	rm -f core $(HASHFILE) $(DICTIONARY).cnt \
		$(DICTIONARY).stat

install:
	@if [ -d $(INSTALLDIR) ]; \
	then \
		if [ -w $(INSTALLDIR) ]; \
		then \
			cp $(HASHFILE) $(AFFIXES) $(INSTALLDIR) && \
			cd  $(INSTALLDIR) && chmod 644 $(HASHFILE) $(AFFIXES) && \
			echo "$(HASHFILE) e $(AFFIXES) copiâts in $(INSTALLDIR)"; \
		else \
			echo "Erôr no tu âs i permès par instalâ il file"; \
		fi \
	else \
		echo "La directory di instalazion specificade ($(INSTALLDIR)) no esist."; \
		echo "Coreç il Makefile."; \
	fi 
