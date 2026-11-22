# AGENTS.md — hello_racket_gui

## What this is
Small Racket GUI hello-world program built with `racket/gui`.

The window shows “Hello, world!” with a **Quit** button.

## Stack
- Racket
- `racket/gui`

## Structure
- `main.rkt` — GUI entry point
- `ask.sh` — task runner menu
- `ask.d/lib.sh` — shared task helpers
- `ask.d/setup.sh` — task 1: check and install Racket requirements
- `ask.d/build.sh` — task 2: build with `raco exe`
- `ask.d/run.sh` — task 3: run with `racket`
- `README.md` — project title, logo, and run command
- `AGENTS.md` — this project guide
- `LICENSE` — GNU GPL v3
- `.gitignore` — Racket/editor and build-output ignore rules
- `hello_racket_gui.svg` — README logo

## Run
```sh
./ask.sh
```

Task 1 checks for `racket` and `raco` and installs Racket when missing: `apt-get`, `dnf`, or `pacman` on Linux; Homebrew on macOS; `winget`, Chocolatey, or Scoop under a POSIX shell on Windows (Git Bash/MSYS/Cygwin). Task 2 builds `bin/hello_racket_gui`. Task 3 runs `main.rkt` directly.

Direct command:
```sh
racket main.rkt
```

## Conventions
- Keep the README logo as its first line.
- No code comments unless asked.
- Do not compile or run Racket code; the user builds and runs it.
- Apply workspace permissions after edits: `chown -R 1000:33 <project>` and `chmod -R g+w <project>`.
