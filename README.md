# Tech Test: Bank

This tech test was based on the instructions of

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

This project has been written in Ruby.

## User stories

These have been based on the given brief

```
As a user
I can make a deposit
So I can save my monies
```
```
As a user
I can make a withdrawal
So I can spend my monies
```
```
As a user
I can print out a statement
So I can see my monies
```

## Running Tests

On your command line, when located in the Bank directory, run this command:
```
rspec
```
### Individual Unit Tests
For a specific file run rspec command as so
```
rspec spec/unit/file_you_wish_to_test.rb
```
### Feature Test
To run feature tests run this command
```
rspec spec/feature/
```

## Run in IRB
Require the account file
```
require './lib/account.rb'
```
To create an account, deposit in, withdraw
```
acc = Account.new
acc.deposit(50)
acc.withdraw(15)
acc.print_statement
```
If you want to add in a date yourself to a deposit or withdrawal then go nuts!

However, you must enter it in like so "12/12/12" or "12-12-12"...
That is, it has to be given as a string.

Statements will always show the date in the format of "12/12/12", even when entered the other way.
