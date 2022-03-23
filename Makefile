.PHONY: all clean install uninstall test

XDG_CONFIG_HOME=~/.config
INSTALLDIR=~/.local/bin/

all: scripts.tar.xz config.tar.xz

scripts.tar.xz: $(wildcard bin/*)
	(cd bin; tar --create --xz -vv --file=../$@ *)

config.tar.xz: $(wildcard config/*)
	(cd config; tar --create --xz -vv --file=../$@ *)

clean:
	rm -f *.tar.xz

install:
	mkdir -vp $(XDG_CONFIG_HOME)
	cp -vr config/* $(XDG_CONFIG_HOME)
	mkdir -vp $(INSTALLDIR)
	cp -vr bin/* $(INSTALLDIR)

uninstall:
	find bin/* -maxdepth 0 -exec printf "$$HOME/.local/%s\0" {} ';' | xargs --null rm -vf
