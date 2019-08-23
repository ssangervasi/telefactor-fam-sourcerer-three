# Git Log

```
commit d3c22376679b1174c8c0ef4cee8a331a7e7b8845
Merge: fea59c3 2a01142
Author: Brian Peck <Catbert321@gmail.com>
Date:   Tue Aug 20 21:27:28 2019 -0700

    Merge pull request #7 from ssangervasi/feature/peckb/swap-classes-for-modules
    
    utilize module with extend to clean things up a bit
```

# CLOC


cloc|github.com/AlDanial/cloc v 1.82  T=0.04 s (1102.1 files/s, 47310.4 lines/s)
--- | ---

Language|files|blank|comment|code
:-------|-------:|-------:|-------:|-------:
Ruby|33|263|186|1086
Markdown|7|69|0|127
Bourne Again Shell|1|6|0|35
YAML|1|6|10|15
--------|--------|--------|--------|--------
SUM:|42|344|196|1263

# Spec Results
## Fam

```

Fam
  .add_person
    with a new person
      persists the person
      behaves like a successful response
        has the expected output
        does not have an error
        has a status of 0
    with an existing person
      behaves like a failed response
        does not have any output
        has the expected error
        has a non-zero status
      behaves like does not persist any state
        does not write to the output file
  .add_parents
    with an existing child
      when child has no parents
        adding one parent
          behaves like a successful response
            has the expected output
            does not have an error
            has a status of 0
          behaves like a child-parent relationship
            persists the relationship
        adding two parents
          behaves like a successful response
            has the expected output
            does not have an error
            has a status of 0
          behaves like a child-parent relationship
            persists the relationship
      when child has one parent
        adding one parent
          behaves like a successful response
            has the expected output
            does not have an error
            has a status of 0
          behaves like a child-parent relationship
            persists the relationship
        adding two parents
          behaves like a failed response
            does not have any output
            has the expected error
            has a non-zero status
          behaves like does not persist any state
            does not write to the output file
      when child has two parents
        behaves like a failed response
          does not have any output
          has the expected error
          has a non-zero status
        behaves like does not persist any state
          does not write to the output file
      adding a non-existent parent
        behaves like a failed response
          does not have any output
          has the expected error
          has a non-zero status
        behaves like does not persist any state
          does not write to the output file
    with a non-existent child
      behaves like a failed response
        does not have any output
        has the expected error
        has a non-zero status
  .get_person
    with an existing person
      behaves like a successful response
        has the expected output
        does not have an error
        has a status of 0
    with a non-existent person
      behaves like a failed response
        does not have any output
        has the expected error
        has a non-zero status
  .get_parents
    with an existing child
      with parents
        behaves like a successful response
          has the expected output
          does not have an error
          has a status of 0
      with no parents
        behaves like a successful response
          has the expected output
          does not have an error
          has a status of 0
    with a non-existent child
      behaves like a failed response
        does not have any output
        has the expected error
        has a non-zero status
  .get_grandparents
    with an existing child
      with greatness 0
        with a full tree
          behaves like a successful response
            has the expected output
            does not have an error
            has a status of 0
        with no grandparents
          behaves like a successful response
            has the expected output
            does not have an error
            has a status of 0
      with greatness 1
        with a full tree
          behaves like a successful response
            has the expected output
            does not have an error
            has a status of 0
      with greatness 2
        with a full tree
          behaves like a successful response
            has the expected output
            does not have an error
            has a status of 0
    with a non-existent child
      behaves like a failed response
        does not have any output
        has the expected error
        has a non-zero status

Finished in 0.16412 seconds (files took 2.26 seconds to load)
65 examples, 0 failures

```

## Boilerplate

```

Fam::CLI::Add::Parents
  when the child and parent names are given
    behaves like a successful command
      exits with a zero status code
      matches the expected output
  when all names are missing
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Add::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code
      matches the expected output
  when no name is provided
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Get::Parents
  when a child name is given
    behaves like a successful command
      exits with a zero status code
      matches the expected output
  when the child name is missing
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Get::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code
      matches the expected output
  when the name is missing
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::File::Reader::JSONReader
  #read
    when the file does not exist
      raises an error
    when the file exists
      should be a kind of Hash

Fam::File::Writer::JSONWriter
  #write
    should be a kind of String
    modifies the specified file

Finished in 23.54 seconds (files took 0.61256 seconds to load)
20 examples, 0 failures

```

