# Package

version       = "0.1.0"
author        = "Anton Sakhanovych"
description   = "Musical program in NIM"
license       = "GPL-2.0-only"
srcDir        = "src"
bin           = @["chords"]


# Dependencies

requires "nim >= 1.6.10"

task run, "Compiles the entrypoint and runs it":
  exec "nim c -r $bin"

task test, "Runs the test suite":
  exec "nim c -r tests/tester"