Feature: User sees course progress statistics

Scenario: User sees course progress statistics

When user opens the detailed view of a course
Then user sees course progress
* user sees number of parts, in which he was present
* user sees number of parts, in which he was absent
* user sees numbe of remaining parts out of the total number
* user sees a graphical percental representation of the above data
