prefix = /usr/local

all: src/hey

src/hey: src/hey.c
	@echo "CFLAGS=$(CFLAGS)" | \
		fold -s -w 70 | \
		sed -e 's/^/# /'
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@ $^

install: src/hey
	install -D src/hey \
		$(DESTDIR)$(prefix)/bin/hey

clean:
	-rm -f src/hey

distclean: clean

uninstall:
	-rm -f $(DESTDIR)$(prefix)/bin/hello

.PHONY: all install clean distclean uninstall
