# October 18, 2025 10:00 AM

# In this session, I am starting to set up my project. Regarding the project, I know that I have to build prefix-notation expression calculator in Racket. The project should be able to run in two modes: Interactive and Batch.
# In interactive mode, the program prompts the user for input, while in batch mode (triggered with the “-b” or “--batch” flag), it reads expressions without showing prompts, only the results and error messages are printed.
# The goals of this project is to create a program that evaluates prefix expressions and to keep track of previous results in history. The user should be able to enter expressions involving addition, multiplication, integer division, and unary negation, as well as reference previous results using the `$n` notation.
# Each successful evaluation should be stored in a history list, with each result assigned an incremental ID (1, 2, 3, …). Results are printed as `<id>: <float value>`, and errors should display as `Error: Invalid Expression`. Division by zero, invalid syntax, or bad history references should all trigger an error message.
# My main plan is:
  # 1. Implement reliable expression parsing that handles whitespace and nested prefix expressions.
  # 2. Correctly detect both interactive and batch modes.
  # 3. Ensure all errors print the correct message and don’t crash the program.
  # 4. Properly maintain the history list and print results with the correct ID order.
  # 5. Test the program with different valid and invalid expressions to confirm the evaluator behaves as required.
