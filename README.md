This is a word jumbler app for pratice purposes

run the palavras.rb file to create a random matrix with the given numbers. 

## Requirements 
in order to point up the words, you MUST install colorize
```ruby
 gem install colorize
```

## How to run

You must pass 2 numbers as parameters to create the matrix of random letters.

You also can pass a filename to search for the words that it contains.

If you dont pass any file or the file doesnt exists in application directory,
the program will run using the sample file. 

```ruby
 ruby palavras.rb 40 50 teste
 
 #creates a matrix with 40 rows x 50 columns to find the words in teste file.
```



