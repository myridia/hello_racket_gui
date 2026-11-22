<img src="hello_racket_gui.svg" alt="Hello Racket GUI logo" width="120">

# hello_racket-gui

Minimal Racket GUI hello-world program.

## Run

```sh
racket main.rkt
```

## Task Runner

```sh
./ask.sh
```

| ID | Task |
|----|------|
| 1 | Setup - check and install requirements (Linux, macOS, Windows) |
| 2 | Build - `raco exe` + `raco distribute` |
| 3 | Run - `racket main.rkt` |
| 0 | Exit |

## Build output

Task 2 creates a Racket distribution in `dist/hello_racket_gui/` with the executable and the runtime libraries it needs. Copy that directory to another machine with the same OS and CPU architecture. On Windows, Racket DLLs are embedded into the executable.
