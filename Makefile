.PHONY: all clean install uninstall test

all: uninstall
	:

clean:
	:

install:
	mkdir -vp $${XDG_CONFIG_HOME:-$$HOME/.config}
	cp -vr config/* $${XDG_CONFIG_HOME:-$$HOME/.config}
	mkdir -vp ~/.local/bin
	cp -vr bin/* ~/.local/bin

uninstall:
	find bin/* -maxdepth 0 -exec printf "$$HOME/.local/%s\0" {} ';' | xargs --null rm -vf
