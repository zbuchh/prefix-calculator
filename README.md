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
Run the program without arguments:

```bash
racket calculator.rkt

You will see a prompt >. Enter expressions in prefix notation:
---

> + 1 2
1: 3.0
> * $1 4
2: 12.0
> quit

$n references the n-th result in history (1-indexed).

Type quit to exit interactive mode.

Batch Mode
Run the program with -b or --batch flag:

racket calculator.rkt -b

Input: + 3 4
Output: 1: 7.0

Input: * $1 2
Output: 2: 14.0

Input: / 10 0
Output: Error: Invalid Expression

Input: - 5
Output: 3: -5.0

Input: $99
Output: Error: Invalid Expression


