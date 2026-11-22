#!/bin/sh
# id: 1
# group: SETUP
# desc: Setup - check and install requirements
. "$(dirname "$0")/lib.sh"

enter

missing=0
for cmd in racket raco; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "ok    %s\n" "$cmd"
  else
    printf "FAIL  %s missing\n" "$cmd"
    missing=1
  fi
done

[ "$missing" -eq 0 ] && exit 0

case "$(uname -s)" in
  Linux*)
    if command -v apt-get >/dev/null 2>&1; then
      if [ "$(id -u)" -eq 0 ]; then
        apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y racket
      elif command -v sudo >/dev/null 2>&1; then
        sudo apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt-get install -y racket
      else
        printf "FAIL cannot install racket: sudo not found\n"
        exit 1
      fi
    elif command -v dnf >/dev/null 2>&1; then
      dnf install -y racket
    elif command -v pacman >/dev/null 2>&1; then
      pacman -S --noconfirm racket
    else
      printf "FAIL no supported package manager; install racket manually\n"
      exit 1
    fi
    ;;
  Darwin*)
    if [ -x /opt/homebrew/bin/brew ]; then
      brew_bin=/opt/homebrew/bin/brew
    elif [ -x /usr/local/bin/brew ]; then
      brew_bin=/usr/local/bin/brew
    elif command -v brew >/dev/null 2>&1; then
      brew_bin=brew
    else
      printf "FAIL brew not found; install Homebrew from https://brew.sh\n"
      exit 1
    fi
    "$brew_bin" install racket || "$brew_bin" install --cask racket
    ;;
  MINGW*|MSYS*|CYGWIN*)
    if command -v winget >/dev/null 2>&1; then
      winget install --id Racket.Racket -e --accept-source-agreements --accept-package-agreements
    elif command -v winget.exe >/dev/null 2>&1; then
      winget.exe install --id Racket.Racket -e --accept-source-agreements --accept-package-agreements
    elif command -v choco >/dev/null 2>&1; then
      choco install racket -y
    elif command -v choco.exe >/dev/null 2>&1; then
      choco.exe install racket -y
    elif command -v scoop >/dev/null 2>&1; then
      scoop install racket
    else
      printf "FAIL no supported package manager; install racket manually\n"
      exit 1
    fi
    ;;
  *)
    printf "FAIL unsupported platform: %s\n" "$(uname -s)"
    exit 1
    ;;
esac

for cmd in racket raco; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "ok    %s\n" "$cmd"
  else
    printf "FAIL  %s missing after install; open a new shell if PATH changed\n" "$cmd"
    exit 1
  fi
done
