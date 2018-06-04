# bare-metal-template

*Contributors: Vaughn Kottler*

A hardware-platform independent, C/C++, microcontroller-firmware template
project.

## Scope

### Toolchains and Build Ecosystems

#### Supported

* [make](https://www.gnu.org/software/make/) + [GCC](https://gcc.gnu.org/)

#### Support Planned

* [bazel](https://bazel.build/)
* generic, tooling-agnostic Python wrapper

#### Not Supported

* [cmake](https://cmake.org/)

It can be difficult to provide toolchain-agnostic source code, so please report
bugs and issues with your desired configuration as needed and we can try to
add support.

### Interfaces

Find online documentation here. TODO

#### Hardware & Driver Interfaces

* TODO

#### Specific Device Support

* TODO

#### Software APIs

* TODO

## Getting Started

TODO

## Goals and Motivation

To develop an [ARM MBED](https://www.mbed.com/en/)-like starting point for
advanced or non-hobbyist projects that makes no assumption about the hardware
platform the developer will use, or the third-party libraries and overall
features that are desired.

### Why not [MBED](https://www.mbed.com/en/)?

MBED has transitioned from a hobbyist-grade development board platform into
a fully integrated IoT ecosystem in favor of ARM's bottom line. It includes
all drivers for each variant of device manufacturers' products. The resulting
codebase is massive.

It is so large that it is impossible to checkout the repository
and create software with it. Software using MBED's interfaces must be
edited in their online compiler and built with a single button that prompts
you to download the produced binary. How it does this is obfuscated!

Many more criticisms could be cited, but we suggest trying MBED to see
if it fits your use case. If you want to be in control of your software stack,
it likely won't.

### Why not [CMSIS](https://developer.arm.com/embedded/cmsis)?

If you are not a software/firmware engineer writing device drivers for your
company's devices, then CMSIS is not a standard you need to comply with.

It attempts to commonize software interfaces with their already commonized
hardware interfaces, which benefits their other software products
(such as MBED).

It is not C++ and as a result is not a good candidate for a modern application
on its own. Wrapping CMSIS interfaces in C++ is a common use case for this
project.
