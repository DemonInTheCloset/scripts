#!/bin/sh

cache_file() {
	cache_dir="${XDG_CACHE_HOME:-~/.cache}/scripts"
	[ -d "$cache_dir" ] || mkdir -p "$cache_dir"
	echo "$cache_dir/$1"
}
