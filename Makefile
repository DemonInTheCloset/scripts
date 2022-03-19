.PHONY: all clean install uninstall test

all: scripts.tar.xz config.tar.xz

scripts.tar.xz: $(wildcard bin/*)
	(cd bin; tar --create --xz -vv --file=../$@ *)

config.tar.xz: $(wildcard config/*)
	(cd config; tar --create --xz -vv --file=../$@ *)

clean:
	rm -f *.tar.xz

install:
	mkdir -vp $${XDG_CONFIG_HOME:-$$HOME/.config}
	cp -vr config/* $${XDG_CONFIG_HOME:-$$HOME/.config}
	mkdir -vp ~/.local/bin
	cp -vr bin/* ~/.local/bin

uninstall:
	find bin/* -maxdepth 0 -exec printf "$$HOME/.local/%s\0" {} ';' | xargs --null rm -vf
