# fdlibm for wasm

Porting fdlibm to wasm

## How to use

The ported `libm.wasm` is available. You may instantiate it and use exported math functions.

## Build

- You need to set up WASI SDK: https://github.com/WebAssembly/wasi-sdk
- After setting the PATH to the SDK bin directory, just `make` to build libm.wasm. You may not need to set `sysroot`.
