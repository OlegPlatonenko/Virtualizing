# VIM Text Editor

```bash
#Run VIM in GUI mode
vim -g

yum install gvim
gvim
```

## VIM Modes

- **Normal mode (Command mode)**

- **Insert mode (EX mode)**

- **Last line mode (File mode)**

## VIM Options

- h - left
- j - down
- k - up
- l - right

- w - move right within a word
- e - move to the end letter of the word
- b - move to the beginning letter of the word

- 0 - move to the beginning of the line
- $ - move to the end of the line

- { - move between paragraphs
- % - move between matching pairs of brackets (parenthesis)

- N+command - do command with N iterations

## VIM Text Editing

- i - move to Insert mode
- a - add append
- o - add to the end of line
- r - replace character
- u - undo
- x - delete one character in a time
- . - redo smth
- dd - delete line
- dw - delete a word
- d0 - delete line from cursor to beginning
- d$ - delete from cursor to the end
- 3i - insert smth 3x times
- 4u - indo last 4 things
- 4r - replace 4x times
- 7x - delete 7 characters

## VIM Copy, Search and Replace

- y - copy line
- p - paste copied
- v - higlight mode
- >> - default Tab value (8 spaces)
- << - remove default Tab value
- / - serach for smth
- n - go to the next searched iteration
- N - go to previous serched
- ? - search from the bottom

```
- : #s/<what to replace>/<replace with>/<options>
```

## VIM Executing External Commands

```
: ! ls -al ~
:r ! cat /root/.bash_profile - insert command result to file
: ! ls -al | wc -l
:r ! ls -al /etc | wc -l

:16,23 ! sort -r - sort values from line 16 to 23
```