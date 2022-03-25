.PHONY: all clean install uninstall test

XDG_DATA_HOME=~/.local/share/
INSTALLDIR=~/.local/bin/

all: scripts.tar.xz data.tar.xz

scripts.tar.xz: $(wildcard bin/*)
	(cd bin; tar --create --xz -vv --file=../$@ *)

data.tar.xz: $(wildcard data/*)
	(cd data; tar --create --xz -vv --file=../$@ *)

clean:
	rm -f *.tar.xz

install:
	mkdir -vp $(XDG_DATA_HOME)/scripts
	cp -vr data/* $(XDG_DATA_HOME)/scripts
	mkdir -vp $(INSTALLDIR)
	cp -vr bin/* $(INSTALLDIR)

uninstall:
	find bin/* -maxdepth 0 -exec printf "$$HOME/.local/%s\0" {} ';' | xargs --null rm -vf
