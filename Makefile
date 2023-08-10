SHELL = /bin/sh

all: secure-pbcopy

.SUFFIXES:
.SUFFIXES: .c .o

.PHONY: all install clean

CFLAGS = -g
ALL_CFLAGS = -framework AppKit $(CFLAGS)

secure-pbcopy: main.m
	$(CC) $(CPPFLAGS) -o secure-pbcopy $(ALL_CFLAGS) main.m

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

PREFIX ?= /usr/local
bindir = $(PREFIX)/bin

install: secure-pbcopy
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) secure-pbcopy $(DESTDIR)$(bindir)/secure-pbcopy

clean:
	rm -f secure-pbcopy
