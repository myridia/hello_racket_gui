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

Task 2 creates a Racket distribution in `dist/hello_racket_gui/` containing the executable and the runtime libraries it needs:

| Path | Size |
|------|------|
| `bin/hello_racket_gui` | 23 MB |
| `lib/` | 45 MB |
| Whole distribution | 68 MB |

The runtime lives in separate shared libraries under `lib/`, so copy the **whole** directory and keep the `bin/` + `lib/` layout intact — the executable finds its libraries by relative path. No Racket install is needed on the target machine, but the OS and CPU architecture must match the build machine. On Windows, Racket DLLs are embedded into the executable.

| Project | Distribution | Size |
|---------|--------------|------|
| Racket | `bin/` executable + `lib/` runtime libraries | ~68 MB |
| McCLIM / SBCL | one self-contained executable | ~22 MB |
