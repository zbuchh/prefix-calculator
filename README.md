# Prefix-Notation Expression Calculator

## Overview
This project is a **prefix-notation calculator** implemented in Racket. It evaluates expressions written in **prefix notation** (operator first) and maintains a **history of results** that can be referenced in later expressions using `$n`.  

The calculator handles basic arithmetic, unary negation, and provides robust error handling for invalid input.

---

## Features
- Evaluate **prefix expressions** with nested operations.
- Supports operators:
  - `+` : Addition (binary)
  - `*` : Multiplication (binary)
  - `/` : Integer division (binary, with divide-by-zero detection)
  - `-` : Unary negation
- Reference previous results using `$n` (history-based lookup)
- Maintains a **history** of results with sequential IDs
- Interactive and batch modes
- Graceful error handling:
  - Invalid syntax
  - Divide-by-zero
  - Invalid history references

---

## Usage

### Interactive Mode
Run the program without any arguments:

```bash
racket calculator.rkt

> + 1 2
1: 3.0
> * $1 4
2: 12.0
> quit

```
$n references the n-th result in history (1-indexed).

Type quit to exit interactive mode.


