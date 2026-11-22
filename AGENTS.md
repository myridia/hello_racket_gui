# AGENTS.md — hello_racket_gui

## What this is
Small starter repository for a Racket GUI program. The name indicates a `hello world`-style desktop app built with Racket's GUI libraries.

Current state: repository metadata only — no Racket source code, no build script, and no task runner yet.

## Stack
- Racket (planned; `racket/gui` is the expected GUI library)
- No runtime dependencies documented yet

## Structure
- `README.md` — project title and logo
- `AGENTS.md` — this project guide
- `LICENSE` — GNU GPL v3
- `.gitignore` — Racket/editor ignore rules
- `hello_racket_gui.svg` — README logo

## Run
No entry point exists yet. Once a Racket source file is added, document the exact command here.

## Conventions
- Keep the README logo as its first line.
- No code comments unless asked.
- Do not compile or run Racket code; the user builds and runs it.
- Apply workspace permissions after edits: `chown -R 1000:33 <project>` and `chmod -R g+w <project>`.
