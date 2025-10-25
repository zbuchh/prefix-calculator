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
- The mode detection for interactive and batch works successfully.
- I encountered no issues .
- Parsing numbers and skipping whitespace fucntions work properly.
- I successfully implemented number parsing and whitespace skipping.
- Learned that cons builds result-history pairs efficiently.
  
# Next Steps
- I need to create a read-history-ref function with will handle the logic for accessing the history.
- I also have to create a get-history-value function.

## October 18, 2025 – 6:00 PM

# Thoughts So Far
- History references allow access to previous results.
- I need to align 1-indexed user references with list indexing.
- Reversing the list is necessary for newest-first storage.

# Session Goals
- In this session I will implement a read-history-ref.
- I will also Implement get-history-value.
- Then I will commit after verifying history works.

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
- Testing revealed all edge cases working correctly

Problems Encountered:
- I had to remember history is stored newest-first due to cons
- I needed to reverse before indexing
- Index conversion: user sees 1-indexed, list uses 0-indexed


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
- I have to implement a function called eval-expression to ensure full input is consumed.

# October 20, 2025 – 6:00 PM

# Thoughts So Far
- Must ensure expressions are fully consumed; trailing characters are invalid.

# Session Goals
- I will Implement a function called eval-expression.
- Commit after testing.

# October 20, 2025 – 7:00 PM

# Reflections
- Works perfectly; invalid expressions return #f.
- I am ready to implement main eval-loop.

# Next Steps
- I will build a function called eval-loop for interactive input, history, and float formatting.

# October 22, 2025 – 5:00 PM

# Thoughts So Far
- Everything parses correctly.
- Eval-loop manages input, history, and batch mode.
- Convert results to float for consistent output.

# Session Goals
- I need to implement the eval-loop.
- I have to display results with history ID.
- I also need to handle errors gracefully.
- Commit after testing interactive and batch modes.

# October 22, 2025 – 7:00 PM

# Reflections
- Interactive and batch modes work.
- History references resolve correctly.
- Operators handle errors, including divide-by-zero.
- Float conversion ensures consistent output.

# Next Steps
- Test complex nested expressions in batch mode.
- Test each operator individually
- Test complex nested expressions
- Test all error cases
- Verify output formatting

# October 24, 2025 – 3:00 PM

# Thoughts So Far
All core features of the prefix-notation calculator are complete. Addition, multiplication, division, and unary negation work as expected. The history system using $n references is fully functional, with proper handling of invalid IDs. Interactive and batch modes are correctly implemented.

# Session Goals
- Verifying all operators with complex nested expressions.
- Testing error handling for invalid input, extra characters, and divide-by-zero.
- Confirming batch mode execution works from the command line.
- Preparing a concise README with usage instructions and description of the program.
- Conduct final comprehensive testing of all calculator features.
- Run batch mode tests to confirm correct behavior without interactive prompts.

# Plan:
- Open a terminal and run several batch mode test cases to confirm output matches expectations.
- Walk through a set of interactive test expressions, including nested and invalid cases.
- Edit the code to remove unnecessary inline comments or debugging messages.
- Create README.md and include:
   - Project overview.
   - Instructions for running in both modes.
   - Examples of valid and invalid input.
 
# October 24, 2025 – 11:30 PM

# Reflections

Today's session was the last one and it was focused on final validation and documentation. I successfully verified that all operators — including addition, multiplication, division, and unary negation — work correctly, even in complex nested expressions. Error handling for divide-by-zero, invalid syntax, and incorrect $n references performed exactly as expected. Batch mode testing confirmed that the program correctly suppresses prompts and only outputs results or error messages. Creating the README was simple, and it now clearly explains both interactive and batch modes with working examples. The overall structure of the code feels stable, readable, and modular. No major issues were encountered, and all the goals set for this session were achieved.

# Next Steps
At this stage, the calculator is feature-complete and ready for submission. The only remaining tasks are:
- Verifying that all files (calculator.rkt, devlog.md, README.md) are committed and well-documented.
- Preparing the repository for final submission by tagging the last commit as the release version.
- Submitting a ZIP file with inlcudes calculator.rkt, devlog.md, and README.md




  
