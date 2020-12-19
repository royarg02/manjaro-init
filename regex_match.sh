#!/usr/bin/env sh

### Regex matches a string containing a variable in POSIX.
###
### Takes the variable and the regex string respectively.
regex_match() {
    expr "$1" : "$2" > /dev/null
}
