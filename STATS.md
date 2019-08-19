# Git Log

```
commit afb312da07dacc01a6773e6f7401fc35664102ae
Author: Sebastian Sangervasi <ssangervasi@squareup.com>
Date:   Mon Aug 19 11:47:23 2019 -0700

    Copy in examiner files
```

# CLOC


cloc|github.com/AlDanial/cloc v 1.82  T=0.04 s (1053.6 files/s, 46444.5 lines/s)
--- | ---

Language|files|blank|comment|code
:-------|-------:|-------:|-------:|-------:
Ruby|28|219|181|966
Markdown|7|68|0|125
Bourne Again Shell|1|6|0|35
YAML|1|6|10|15
--------|--------|--------|--------|--------
SUM:|37|299|191|1141

# Spec Results
## Fam

```

Fam
  .add_person
    with a new person
      persists the person (FAILED - 1)
      behaves like a successful response
        has the expected output (FAILED - 2)
        does not have an error
        has a status of 0 (FAILED - 3)
    with an existing person
      behaves like a failed response
        does not have any output
        has the expected error (FAILED - 4)
        has a non-zero status
      behaves like does not persist any state
        does not write to the output file
  .add_parents
    with an existing child
      when child has no parents
        adding one parent
          behaves like a successful response
            has the expected output (FAILED - 5)
            does not have an error
            has a status of 0 (FAILED - 6)
          behaves like a child-parent relationship
            persists the relationship (FAILED - 7)
        adding two parents
          behaves like a successful response
            has the expected output (FAILED - 8)
            does not have an error
            has a status of 0 (FAILED - 9)
          behaves like a child-parent relationship
            persists the relationship (FAILED - 10)
      when child has one parent
        adding one parent
          behaves like a successful response
            has the expected output (FAILED - 11)
            does not have an error
            has a status of 0 (FAILED - 12)
          behaves like a child-parent relationship
            persists the relationship (FAILED - 13)
        adding two parents
          behaves like a failed response
            does not have any output
            has the expected error (FAILED - 14)
            has a non-zero status
          behaves like does not persist any state
            does not write to the output file
      when child has two parents
        behaves like a failed response
          does not have any output
          has the expected error (FAILED - 15)
          has a non-zero status
        behaves like does not persist any state
          does not write to the output file
      adding a non-existent parent
        behaves like a failed response
          does not have any output
          has the expected error (FAILED - 16)
          has a non-zero status
        behaves like does not persist any state
          does not write to the output file
    with a non-existent child
      behaves like a failed response
        does not have any output
        has the expected error (FAILED - 17)
        has a non-zero status
  .get_person
    with an existing person
      behaves like a successful response
        has the expected output (FAILED - 18)
        does not have an error
        has a status of 0 (FAILED - 19)
    with a non-existent person
      behaves like a failed response
        does not have any output
        has the expected error (FAILED - 20)
        has a non-zero status
  .get_parents
    with an existing child
      with parents
        behaves like a successful response
          has the expected output (FAILED - 21)
          does not have an error
          has a status of 0 (FAILED - 22)
      with no parents
        behaves like a successful response
          has the expected output
          does not have an error
          has a status of 0 (FAILED - 23)
    with a non-existent child
      behaves like a failed response
        does not have any output
        has the expected error (FAILED - 24)
        has a non-zero status
  .get_grandparents
    with an existing child
      with greatness 0
        with a full tree
          behaves like a successful response
            has the expected output (FAILED - 25)
            does not have an error
            has a status of 0 (FAILED - 26)
        with no grandparents
          behaves like a successful response
            has the expected output
            does not have an error
            has a status of 0 (FAILED - 27)
      with greatness 1
        with a full tree
          behaves like a successful response
            has the expected output (FAILED - 28)
            does not have an error
            has a status of 0 (FAILED - 29)
      with greatness 2
        with a full tree
          behaves like a successful response
            has the expected output (FAILED - 30)
            does not have an error
            has a status of 0 (FAILED - 31)
    with a non-existent child
      behaves like a failed response
        does not have any output
        has the expected error (FAILED - 32)
        has a non-zero status

Failures:

  1) Fam.add_person with a new person persists the person
     Failure/Error: expect(read(path: output_pathname)).to eq(Adam: [])

       expected: {:Adam=>[]}
            got: {}

       (compared using ==)

       Diff:
       @@ -1,2 +1 @@
       -:Adam => [],
     # ./spec/fam/fam_spec.rb:32:in `block (4 levels) in <top (required)>'

  2) Fam.add_person with a new person behaves like a successful response has the expected output
     Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

       expected: "Added person: Adam"
            got: ""

       (compared using ==)
     Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:27
     # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  3) Fam.add_person with a new person behaves like a successful response has a status of 0
     Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

       expected: 0
            got: 1

       (compared using ==)
     Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:27
     # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  4) Fam.add_person with an existing person behaves like a failed response has the expected error
     Failure/Error: it('has the expected error') { expect(subject.error).to eq(error) }

       expected: "Person 'Adam' already in family"
            got: ""

       (compared using ==)
     Shared Example Group: "a failed response" called from ./spec/fam/fam_spec.rb:39
     # ./spec/spec_helpers/fam.rb:20:in `block (2 levels) in <top (required)>'

  5) Fam.add_parents with an existing child when child has no parents adding one parent behaves like a successful response has the expected output
     Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

       expected: "Added Bob as parents of Adam"
            got: ""

       (compared using ==)
     Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:62
     # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  6) Fam.add_parents with an existing child when child has no parents adding one parent behaves like a successful response has a status of 0
     Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

       expected: 0
            got: 1

       (compared using ==)
     Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:62
     # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  7) Fam.add_parents with an existing child when child has no parents adding one parent behaves like a child-parent relationship persists the relationship
     Failure/Error: expect(read(path: output_pathname)[child.to_sym]).to eq([*parents])

       expected: ["Bob"]
            got: nil

       (compared using ==)
     Shared Example Group: "a child-parent relationship" called from ./spec/fam/fam_spec.rb:63
     # ./spec/spec_helpers/fam.rb:36:in `block (2 levels) in <top (required)>'

  8) Fam.add_parents with an existing child when child has no parents adding two parents behaves like a successful response has the expected output
     Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

       expected: "Added Bob & Betsy as parents of Adam"
            got: ""

       (compared using ==)
     Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:70
     # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  9) Fam.add_parents with an existing child when child has no parents adding two parents behaves like a successful response has a status of 0
     Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

       expected: 0
            got: 1

       (compared using ==)
     Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:70
     # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  10) Fam.add_parents with an existing child when child has no parents adding two parents behaves like a child-parent relationship persists the relationship
      Failure/Error: expect(read(path: output_pathname)[child.to_sym]).to eq([*parents])

        expected: ["Bob", "Betsy"]
             got: nil

        (compared using ==)
      Shared Example Group: "a child-parent relationship" called from ./spec/fam/fam_spec.rb:71
      # ./spec/spec_helpers/fam.rb:36:in `block (2 levels) in <top (required)>'

  11) Fam.add_parents with an existing child when child has one parent adding one parent behaves like a successful response has the expected output
      Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

        expected: "Added Betsy as parents of Adam"
             got: ""

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:81
      # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  12) Fam.add_parents with an existing child when child has one parent adding one parent behaves like a successful response has a status of 0
      Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

        expected: 0
             got: 1

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:81
      # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  13) Fam.add_parents with an existing child when child has one parent adding one parent behaves like a child-parent relationship persists the relationship
      Failure/Error: expect(read(path: output_pathname)[child.to_sym]).to eq([*parents])

        expected: ["Bob", "Betsy"]
             got: nil

        (compared using ==)
      Shared Example Group: "a child-parent relationship" called from ./spec/fam/fam_spec.rb:82
      # ./spec/spec_helpers/fam.rb:36:in `block (2 levels) in <top (required)>'

  14) Fam.add_parents with an existing child when child has one parent adding two parents behaves like a failed response has the expected error
      Failure/Error: it('has the expected error') { expect(subject.error).to eq(error) }

        expected: "Child 'Adam' can't have more than 2 parents!"
             got: ""

        (compared using ==)
      Shared Example Group: "a failed response" called from ./spec/fam/fam_spec.rb:89
      # ./spec/spec_helpers/fam.rb:20:in `block (2 levels) in <top (required)>'

  15) Fam.add_parents with an existing child when child has two parents behaves like a failed response has the expected error
      Failure/Error: it('has the expected error') { expect(subject.error).to eq(error) }

        expected: "Child 'Adam' can't have more than 2 parents!"
             got: ""

        (compared using ==)
      Shared Example Group: "a failed response" called from ./spec/fam/fam_spec.rb:98
      # ./spec/spec_helpers/fam.rb:20:in `block (2 levels) in <top (required)>'

  16) Fam.add_parents with an existing child adding a non-existent parent behaves like a failed response has the expected error
      Failure/Error: it('has the expected error') { expect(subject.error).to eq(error) }

        expected: "No such person 'Bob' in family"
             got: ""

        (compared using ==)
      Shared Example Group: "a failed response" called from ./spec/fam/fam_spec.rb:105
      # ./spec/spec_helpers/fam.rb:20:in `block (2 levels) in <top (required)>'

  17) Fam.add_parents with a non-existent child behaves like a failed response has the expected error
      Failure/Error: it('has the expected error') { expect(subject.error).to eq(error) }

        expected: "No such person 'Adam' in family"
             got: ""

        (compared using ==)
      Shared Example Group: "a failed response" called from ./spec/fam/fam_spec.rb:113
      # ./spec/spec_helpers/fam.rb:20:in `block (2 levels) in <top (required)>'

  18) Fam.get_person with an existing person behaves like a successful response has the expected output
      Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

        expected: "Adam"
             got: ""

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:128
      # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  19) Fam.get_person with an existing person behaves like a successful response has a status of 0
      Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

        expected: 0
             got: 1

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:128
      # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  20) Fam.get_person with a non-existent person behaves like a failed response has the expected error
      Failure/Error: it('has the expected error') { expect(subject.error).to eq(error) }

        expected: "No such person 'Adam' in family"
             got: ""

        (compared using ==)
      Shared Example Group: "a failed response" called from ./spec/fam/fam_spec.rb:132
      # ./spec/spec_helpers/fam.rb:20:in `block (2 levels) in <top (required)>'

  21) Fam.get_parents with an existing child with parents behaves like a successful response has the expected output
      Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

        expected: "Bob\nBetsy"
             got: ""

        (compared using ==)

        Diff:
        @@ -1,3 +1 @@
        -Bob
        -Betsy
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:148
      # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  22) Fam.get_parents with an existing child with parents behaves like a successful response has a status of 0
      Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

        expected: 0
             got: 1

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:148
      # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  23) Fam.get_parents with an existing child with no parents behaves like a successful response has a status of 0
      Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

        expected: 0
             got: 1

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:154
      # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  24) Fam.get_parents with a non-existent child behaves like a failed response has the expected error
      Failure/Error: it('has the expected error') { expect(subject.error).to eq(error) }

        expected: "No such person 'Adam' in family"
             got: ""

        (compared using ==)
      Shared Example Group: "a failed response" called from ./spec/fam/fam_spec.rb:159
      # ./spec/spec_helpers/fam.rb:20:in `block (2 levels) in <top (required)>'

  25) Fam.get_grandparents with an existing child with greatness 0 with a full tree behaves like a successful response has the expected output
      Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

        expected: "Chris\nCarol\nCarl\nChrystal"
             got: ""

        (compared using ==)

        Diff:
        @@ -1,5 +1 @@
        -Chris
        -Carol
        -Carl
        -Chrystal
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:189
      # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  26) Fam.get_grandparents with an existing child with greatness 0 with a full tree behaves like a successful response has a status of 0
      Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

        expected: 0
             got: 1

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:189
      # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  27) Fam.get_grandparents with an existing child with greatness 0 with no grandparents behaves like a successful response has a status of 0
      Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

        expected: 0
             got: 1

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:201
      # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  28) Fam.get_grandparents with an existing child with greatness 1 with a full tree behaves like a successful response has the expected output
      Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

        expected: "Don\nDiane\nDave\nDasha\nDude\nDaisy\nDan\nDestiny"
             got: ""

        (compared using ==)

        Diff:
        @@ -1,9 +1 @@
        -Don
        -Diane
        -Dave
        -Dasha
        -Dude
        -Daisy
        -Dan
        -Destiny
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:229
      # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  29) Fam.get_grandparents with an existing child with greatness 1 with a full tree behaves like a successful response has a status of 0
      Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

        expected: 0
             got: 1

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:229
      # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  30) Fam.get_grandparents with an existing child with greatness 2 with a full tree behaves like a successful response has the expected output
      Failure/Error: it('has the expected output') { expect(subject.output).to eq(output) }

        expected: "Ed\nEmma\nEdd\nEmily\nEddy\nElizabeth\nEddie\nElla\nEdward\nEleanore\nEggbert\nEllie\nEasports\nEliana\nEinstein\nElena"
             got: ""

        (compared using ==)

        Diff:
        @@ -1,17 +1 @@
        -Ed
        -Emma
        -Edd
        -Emily
        -Eddy
        -Elizabeth
        -Eddie
        -Ella
        -Edward
        -Eleanore
        -Eggbert
        -Ellie
        -Easports
        -Eliana
        -Einstein
        -Elena
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:273
      # ./spec/spec_helpers/fam.rb:13:in `block (2 levels) in <top (required)>'

  31) Fam.get_grandparents with an existing child with greatness 2 with a full tree behaves like a successful response has a status of 0
      Failure/Error: it('has a status of 0') { expect(subject.status).to eq(0) }

        expected: 0
             got: 1

        (compared using ==)
      Shared Example Group: "a successful response" called from ./spec/fam/fam_spec.rb:273
      # ./spec/spec_helpers/fam.rb:15:in `block (2 levels) in <top (required)>'

  32) Fam.get_grandparents with a non-existent child behaves like a failed response has the expected error
      Failure/Error: it('has the expected error') { expect(subject.error).to eq(error) }

        expected: "No such person 'Adam' in family"
             got: ""

        (compared using ==)
      Shared Example Group: "a failed response" called from ./spec/fam/fam_spec.rb:279
      # ./spec/spec_helpers/fam.rb:20:in `block (2 levels) in <top (required)>'

Finished in 0.1863 seconds (files took 0.66683 seconds to load)
65 examples, 32 failures

Failed examples:

rspec ./spec/fam/fam_spec.rb:29 # Fam.add_person with a new person persists the person
rspec ./spec/fam/fam_spec.rb[1:1:1:1:1] # Fam.add_person with a new person behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:1:1:1:3] # Fam.add_person with a new person behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb[1:1:2:1:2] # Fam.add_person with an existing person behaves like a failed response has the expected error
rspec ./spec/fam/fam_spec.rb[1:2:1:1:1:1:1] # Fam.add_parents with an existing child when child has no parents adding one parent behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:2:1:1:1:1:3] # Fam.add_parents with an existing child when child has no parents adding one parent behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb:63 # Fam.add_parents with an existing child when child has no parents adding one parent behaves like a child-parent relationship persists the relationship
rspec ./spec/fam/fam_spec.rb[1:2:1:1:2:1:1] # Fam.add_parents with an existing child when child has no parents adding two parents behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:2:1:1:2:1:3] # Fam.add_parents with an existing child when child has no parents adding two parents behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb:71 # Fam.add_parents with an existing child when child has no parents adding two parents behaves like a child-parent relationship persists the relationship
rspec ./spec/fam/fam_spec.rb[1:2:1:2:1:1:1] # Fam.add_parents with an existing child when child has one parent adding one parent behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:2:1:2:1:1:3] # Fam.add_parents with an existing child when child has one parent adding one parent behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb:82 # Fam.add_parents with an existing child when child has one parent adding one parent behaves like a child-parent relationship persists the relationship
rspec ./spec/fam/fam_spec.rb[1:2:1:2:2:1:2] # Fam.add_parents with an existing child when child has one parent adding two parents behaves like a failed response has the expected error
rspec ./spec/fam/fam_spec.rb[1:2:1:3:1:2] # Fam.add_parents with an existing child when child has two parents behaves like a failed response has the expected error
rspec ./spec/fam/fam_spec.rb[1:2:1:4:1:2] # Fam.add_parents with an existing child adding a non-existent parent behaves like a failed response has the expected error
rspec ./spec/fam/fam_spec.rb[1:2:2:1:2] # Fam.add_parents with a non-existent child behaves like a failed response has the expected error
rspec ./spec/fam/fam_spec.rb[1:3:1:1:1] # Fam.get_person with an existing person behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:3:1:1:3] # Fam.get_person with an existing person behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb[1:3:2:1:2] # Fam.get_person with a non-existent person behaves like a failed response has the expected error
rspec ./spec/fam/fam_spec.rb[1:4:1:1:1:1] # Fam.get_parents with an existing child with parents behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:4:1:1:1:3] # Fam.get_parents with an existing child with parents behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb[1:4:1:2:1:3] # Fam.get_parents with an existing child with no parents behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb[1:4:2:1:2] # Fam.get_parents with a non-existent child behaves like a failed response has the expected error
rspec ./spec/fam/fam_spec.rb[1:5:1:1:1:1:1] # Fam.get_grandparents with an existing child with greatness 0 with a full tree behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:5:1:1:1:1:3] # Fam.get_grandparents with an existing child with greatness 0 with a full tree behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb[1:5:1:1:2:1:3] # Fam.get_grandparents with an existing child with greatness 0 with no grandparents behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb[1:5:1:2:1:1:1] # Fam.get_grandparents with an existing child with greatness 1 with a full tree behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:5:1:2:1:1:3] # Fam.get_grandparents with an existing child with greatness 1 with a full tree behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb[1:5:1:3:1:1:1] # Fam.get_grandparents with an existing child with greatness 2 with a full tree behaves like a successful response has the expected output
rspec ./spec/fam/fam_spec.rb[1:5:1:3:1:1:3] # Fam.get_grandparents with an existing child with greatness 2 with a full tree behaves like a successful response has a status of 0
rspec ./spec/fam/fam_spec.rb[1:5:2:1:2] # Fam.get_grandparents with a non-existent child behaves like a failed response has the expected error

```

## Boilerplate

```

Fam::CLI::Add::Parents
  when the child and parent names are given
    behaves like a successful command
      exits with a zero status code (FAILED - 1)
      matches the expected output (FAILED - 2)
  when all names are missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 3)
      matches the expected error (FAILED - 4)

Fam::CLI::Add::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 5)
      matches the expected output (FAILED - 6)
  when no name is provided
    behaves like a failed command
      exits with a non-zero status code
      matches the expected error

Fam::CLI::Get::Parents
  when a child name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 7)
      matches the expected output (FAILED - 8)
  when the child name is missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 9)
      matches the expected error (FAILED - 10)

Fam::CLI::Get::Person
  when a name is given
    behaves like a successful command
      exits with a zero status code (FAILED - 11)
      matches the expected output (FAILED - 12)
  when the name is missing
    behaves like a failed command
      exits with a non-zero status code (FAILED - 13)
      matches the expected error (FAILED - 14)

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

Failures:

  1) Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command exits with a zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/parents_spec.rb:25
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  2) Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command matches the expected output
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/parents_spec.rb:25
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  3) Fam::CLI::Add::Parents when all names are missing behaves like a failed command exits with a non-zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/add/parents_spec.rb:35
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  4) Fam::CLI::Add::Parents when all names are missing behaves like a failed command matches the expected error
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/add/parents_spec.rb:35
     # ./spec/boilerplate/cli/add/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  5) Fam::CLI::Add::Person when a name is given behaves like a successful command exits with a zero status code
     Failure/Error: expect(subject.status).to eq(0), (subject.output + subject.error)
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/person_spec.rb:13
     # ./spec/spec_helpers/cli.rb:28:in `block (3 levels) in <top (required)>'

  6) Fam::CLI::Add::Person when a name is given behaves like a successful command matches the expected output
     Failure/Error: expect(subject.output).to match expected_output
       expected "" to match "José Exemplo"
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/add/person_spec.rb:13
     # ./spec/spec_helpers/cli.rb:32:in `block (3 levels) in <top (required)>'

  7) Fam::CLI::Get::Parents when a child name is given behaves like a successful command exits with a zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/parents_spec.rb:33
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  8) Fam::CLI::Get::Parents when a child name is given behaves like a successful command matches the expected output
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/parents_spec.rb:33
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  9) Fam::CLI::Get::Parents when the child name is missing behaves like a failed command exits with a non-zero status code
     Failure/Error:
       expect(
         Hatchery::Names.simpsons.map do |person_name|
           exec_fam('add', 'person', person_name)
         end
       ).to(
         all(be_success),
         'Must be able to `add person` before testing `get parents`'
       )

       Must be able to `add person` before testing `get parents`
     Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/parents_spec.rb:43
     # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  10) Fam::CLI::Get::Parents when the child name is missing behaves like a failed command matches the expected error
      Failure/Error:
        expect(
          Hatchery::Names.simpsons.map do |person_name|
            exec_fam('add', 'person', person_name)
          end
        ).to(
          all(be_success),
          'Must be able to `add person` before testing `get parents`'
        )

        Must be able to `add person` before testing `get parents`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/parents_spec.rb:43
      # ./spec/boilerplate/cli/get/parents_spec.rb:14:in `block (2 levels) in <top (required)>'

  11) Fam::CLI::Get::Person when a name is given behaves like a successful command exits with a zero status code
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/person_spec.rb:21
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  12) Fam::CLI::Get::Person when a name is given behaves like a successful command matches the expected output
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a successful command" called from ./spec/boilerplate/cli/get/person_spec.rb:21
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  13) Fam::CLI::Get::Person when the name is missing behaves like a failed command exits with a non-zero status code
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/person_spec.rb:31
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

  14) Fam::CLI::Get::Person when the name is missing behaves like a failed command matches the expected error
      Failure/Error:
        expect(exec_fam('add', 'person', person_name))
          .to(
            be_success,
            'Must be able to `add person` before testing `get person`'
          )

        Must be able to `add person` before testing `get person`
      Shared Example Group: "a failed command" called from ./spec/boilerplate/cli/get/person_spec.rb:31
      # ./spec/boilerplate/cli/get/person_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 8.63 seconds (files took 0.51674 seconds to load)
20 examples, 14 failures

Failed examples:

rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:1:1:1] # Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:1:1:2] # Fam::CLI::Add::Parents when the child and parent names are given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:2:1:1] # Fam::CLI::Add::Parents when all names are missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/add/parents_spec.rb[1:2:1:2] # Fam::CLI::Add::Parents when all names are missing behaves like a failed command matches the expected error
rspec ./spec/boilerplate/cli/add/person_spec.rb[1:1:1:1] # Fam::CLI::Add::Person when a name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/add/person_spec.rb[1:1:1:2] # Fam::CLI::Add::Person when a name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:1:1:1] # Fam::CLI::Get::Parents when a child name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:1:1:2] # Fam::CLI::Get::Parents when a child name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:2:1:1] # Fam::CLI::Get::Parents when the child name is missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/get/parents_spec.rb[1:2:1:2] # Fam::CLI::Get::Parents when the child name is missing behaves like a failed command matches the expected error
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:1:1:1] # Fam::CLI::Get::Person when a name is given behaves like a successful command exits with a zero status code
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:1:1:2] # Fam::CLI::Get::Person when a name is given behaves like a successful command matches the expected output
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:2:1:1] # Fam::CLI::Get::Person when the name is missing behaves like a failed command exits with a non-zero status code
rspec ./spec/boilerplate/cli/get/person_spec.rb[1:2:1:2] # Fam::CLI::Get::Person when the name is missing behaves like a failed command matches the expected error

```

