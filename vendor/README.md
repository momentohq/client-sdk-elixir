# Vendored libraries

## `./hdr_histogram_erl`

This directory contains a vendored copy of the HDR histogram library from this repo and commit: https://github.com/HdrHistogram/hdr_histogram_erl/tree/075798518aabd73a0037007989cde8bd6923b4d9.

We are vendoring this library for now because the upstream version doesn't support Macs that have the ARM architecture.

We have contributed a PR upstream to fix this; if it is merged, we should switch back to the released version:

https://github.com/HdrHistogram/hdr_histogram_erl/pull/43
