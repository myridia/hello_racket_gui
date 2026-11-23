#!/bin/sh
# id: 2
# group: SETUP
# desc: Build - raco exe + distribute
. "$(dirname "$0")/lib.sh"

set -e
enter

rm -rf bin dist/hello_racket_gui
mkdir -p bin dist

case "$(uname -s)" in
  MINGW*|MSYS*|CYGWIN*)
    raco exe --gui --embed-dlls -o bin/hello_racket_gui main.rkt
    ;;
  *)
    raco exe --gui -o bin/hello_racket_gui main.rkt
    ;;
esac

exe=bin/hello_racket_gui
for suffix in .exe .app; do
  if [ -e "$exe$suffix" ]; then
    exe="$exe$suffix"
    break
  fi
done

raco distribute dist/hello_racket_gui "$exe"
printf "ok    dist/hello_racket_gui\n"
