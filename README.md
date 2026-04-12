# ROP Emporium Solutions

This repository contains my exploit scripts and notes for [ROP Emporium](https://ropemporium.com/), a series of wargames designed to teach the mechanics of Return Oriented Programming (ROP). The challenges progress in difficulty, requiring different techniques to chain assembly gadgets, manipulate registers, bypass protections like ASLR, and successfully hijack program execution flow.

The repository is organized by architecture. Inside the `x86_64/` directory, there is a dedicated folder for each challenge. Every challenge directory contains the `exploit.py` script used to solve it. Additionally, some directories include a `gadgets` text file, which I used as a scratchpad to manually copy and paste crucial gadgets I discovered while analyzing the binaries.

The entire development environment is managed and isolated using Nix. The root of this repository contains a `flake.nix` file that defines all the necessary packages, libraries, and reverse engineering tools required to run and debug the exploits. To drop directly into the configured environment, simply run `nix develop` from the root directory.

### Architectures

- [x] x86_64
- [ ] x86
- [ ] ARMv5
- [ ] ARMv8
- [ ] MIPS
