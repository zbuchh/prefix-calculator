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
You will see a prompt >. Enter expressions in prefix notation:

> + 1 2
1: 3.0
> * $1 4
2: 12.0
> quit

```
$n references the n-th result in history (1-indexed).

Type quit to exit interactive mode.

### Batch Mode

Run the program with the -b or --batch flag:
```bash
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

```
$n works the same way as in interactive mode.

Only the results and errors are printed; prompts are suppressed.

---

### Notes on Expressions

- Expressions are prefix notation: operator comes first. Example: + 1 2 equals 3.

- Binary operators (+, *, /) require exactly two operands.

- Unary negation (-) requires a single operand.

- History references use $n, where n corresponds to the result ID.

- Whitespace can be used to separate tokens but is otherwise ignored.

- Extra characters after a valid expression are considered errors. Example: + 1 2 3 is invalid.

---

### Implementation Details

- Written in Racket using functional programming principles.

- Recursive descent parser evaluates expressions character-by-character.

- History is implemented as a list, with the most recent value at the front.

- Command-line arguments determine interactive vs batch mode.

- Results are converted to floats using real->double-flonum before printing.

- Proper error handling ensures the program never crashes, even with invalid input.
