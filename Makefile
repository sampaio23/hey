prefix = /usr/local

all: src/heyworld

src/hey: src/heyworld.c
	@echo "CFLAGS=$(CFLAGS)" | \
		fold -s -w 70 | \
		sed -e 's/^/# /'
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@ $^

install: src/heyworld
	install -D src/heyworld \
		$(DESTDIR)$(prefix)/bin/heyworld

clean:
	-rm -f src/heyworld

distclean: clean

uninstall:
	-rm -f $(DESTDIR)$(prefix)/bin/heyworld

.PHONY: all install clean distclean uninstall
