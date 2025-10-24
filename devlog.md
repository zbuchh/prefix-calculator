## October 18, 2025 - 10:00 AM

- In this session, I am starting to set up my project. Regarding the project, I know that I have to build prefix-notation expression calculator in Racket. The project should be able to run in two modes: Interactive and Batch.
- In interactive mode, the program prompts the user for input, while in batch mode (triggered with the “-b” or “--batch” flag), it reads expressions without showing prompts, only the results and error messages are printed.
- The goals of this project is to create a program that evaluates prefix expressions and to keep track of previous results in history. The user should be able to enter expressions involving addition, multiplication, integer division, and unary negation, as well as reference previous results using the `$n` notation.
- Each successful evaluation should be stored in a history list, with each result assigned an incremental ID (1, 2, 3, …). Results are printed as `<id>: <float value>`, and errors should display as `Error: Invalid Expression`. Division by zero, invalid syntax, or bad history references should all trigger an error message.

# My main plan is:
  1. Implement reliable expression parsing that handles whitespace and nested prefix expressions.
  2. Correctly detect both interactive and batch modes.
  3. Ensure all errors print the correct message and don’t crash the program.
  4. Properly maintain the history list and print results with the correct ID order.
  5. Test the program with different valid and invalid expressions to confirm the evaluator behaves as required.
  

## October 18, 2025 - 1:00 PM

# Thoughts So Far
- I am starting the project in the rkt file.
- The main challenge will be parsing prefix expressions recursively while handling errors gracefully.
- I need to detect interactive vs batch mode before processing input.
- Parsing numbers requires skipping initial whitespace.
- Must return a failure marker #f for invalid input.
- Recursive character parsing seems natural in Racket.
  
# Session Goals
- Set up basic file/project structure.
- Implement interactive/batch mode detection.
- Commit initial skeleton to Git.
- Implement the skip-whitespace function.
- Implement read-number function with helper read-digits.
- Commit after testing number parsing.
  
## October 18, 2025 - 3:00 PM

# Reflections
- Mode detection works successfully.
- No issues encountered.
- Parsing numbers and skipping whitespace fucntions work properly.
- Successfully implemented number parsing and whitespace skipping.
- Learned that cons builds result-history pairs efficiently.
  
# Next Steps
- Create read-history-ref function.
- Create get-history-value function.

## October 18, 2025 – 6:00 PM

# Thoughts So Far
- History references allow access to previous results.
- Must align 1-indexed user references with list indexing.
- Reversing the list is necessary for newest-first storage.

# Session Goals
- Implement read-history-ref.
- Implement get-history-value.
- Commit after verifying history works.

## October 18, 2025 – 7:30 PM

# Reflections
- This session was quite easy and short. I just implemented the read-history-ref and get-history-value functions in the racket file.
- I accomplished my goal since the history functions work as expected.
- Implemented read-history-ref function
- Created get-history-value function which:
  - Reverses history list 
  - Converts 1-indexed ID to 0-indexed list access
  - Validates ID is in valid range
  - Returns #f for invalid IDs
- Added $n case to parse-expr
  - Parses history reference
  - Looks up value in history
  - Returns error if invalid
- History system fully functional!

Problems Encountered:
- Had to remember history is stored newest-first due to cons
- Need to reverse before indexing
- Index conversion: user sees 1-indexed, list uses 0-indexed
- Testing revealed all edge cases working correctly


# Next Steps
- I need to build recursive parse-expr.
- I have to include operators and handle divide-by-zero issue.
- As well as add unary negation -.

# October 19, 2025 – 1:00 PM

# Thoughts So Far
- Recursive parsing is logical.
- Binary operators follow the same recursive pattern.
- Division requires zero-check; unary negation is different (one operand).

# Session Goals
- I plan on implementing parse-expr for all arithmetic operators.
- I also have to handle divide-by-zero.
- Commit after testing.

# October 19, 2025 – 5:00 PM

# Reflections
- This session was long and dificult to implment since I had to build the logic for the operators. I implemented the parse-expr chars history function in the racket file.
- All operators implemented.
- Extra characters produce errors as expected.
- Unary vs binary distinction handled.
# Next Steps
- Implement eval-expression to ensure full input is consumed.

# October 20, 2025 – 6:00 PM

# Thoughts So Far
- Must ensure expressions are fully consumed; trailing characters are invalid.

# Session Goals
- I will Implement a function called eval-expression in the next session.
- Commit after testing.

# October 20, 2025 – 7:00 PM

# Reflections
- Works perfectly; invalid expressions return #f.
- I am ready to implement main eval-loop.

# Next Steps
- Build eval-loop for interactive input, history, and float formatting.

# October 22, 2025 – 5:00 PM

# Thoughts So Far
- Everything parses correctly.
- Eval-loop manages input, history, and batch mode.
- Convert results to float for consistent output.

# Session Goals
- I need to implement the eval-loop.
- Display results with history ID.
- Handle errors gracefully.
- Commit after testing interactive and batch modes.




  

  
