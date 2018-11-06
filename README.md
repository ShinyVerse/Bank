# Tech Test: Bank

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

## User stories

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
For a specific file run rspec command as so:
```
rspec spec/file_you_wish_to_test.rb
```

## Run in IRB
Require the files
```
require './lib/account.rb'
require './lib/statement.rb'
require './lib/printer.rb'

acc = Account.new
acc.deposit(50)
acc.print_statement
```
