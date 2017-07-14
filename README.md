# Theory of Computation [![License MIT](http://img.shields.io/badge/license-MIT-brightgreen.svg)](license.md)

## Introduction
This repository contains Theory of Computation problem sets. It has only academic purpose. It also serves as an introduction to Functional Programming. All problem sets have a `pdf` summary which are written in Portuguese.

## Problem Sets
- [PsetA](psetA/INTRUCTIONS.md)
- [PsetB](psetB/INTRUCTIONS.md)

## Usage

### Install
The problem sets were made using *OCaml*. I recommend to install it using *OPAM*, use this [link](https://github.com/realworldocaml/book/wiki/Installation-Instructions) to get instructions how to do this. Make sure to install the following packages:
```shell
$ opam install core utop merlin ocp-indent
```

### Build
All code was developed and tested on *Ubuntu Linux 14.04* using *OCaml* compiler 4.02.3. Inside each problem set folder there is a `Makefile`.
```shell
$ make nameOfPset
```

### Run
```shell
$ ocamlrun nameOfPset
```
### Test
Each for problem set there is a test suite, to run the bash script:
```shell
$ ./check nameOfPset
```
