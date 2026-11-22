#!/bin/sh
# id: 2
# group: SETUP
# desc: Build - raco exe main.rkt
. "$(dirname "$0")/lib.sh"

enter
mkdir -p bin
raco exe -o bin/hello_racket_gui main.rkt
