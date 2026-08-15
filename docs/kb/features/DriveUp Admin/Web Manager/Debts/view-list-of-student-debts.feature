Feature: View list of student debts

  Scenario: User can filter list for debts over a specific amount
  
  Given user is driveUp admin
  When user is on the list of student debts
  * user filters the list for debts over a specific amount (e.g. 100)
  Then user sees only student debts over 100

  Scenario: User can filter the list of student debts by training status
  
  Given user is driveUp admin
  When user is on the list of student debts
  * user filters the list for "<trainingStatus>" trainings
  Then user sees only student debts for "<trainingStatus>" trainings
  
  Examples:
  | trainingStatus |
  | In progress    |
  | Completed      |
  | Terminated     |

  Scenario: User can search the list of student debts by student name or amount
  
  Given user is driveUp admin
  When user is on the list of student debts
  * user searches the list for "<searchTerm>"
  Then user sees only student debts matching "<searchTerm>"
  
  Examples:
  | searchTerm      |
  | John Doe        |
  | 100             |

  Scenario: User can view the list of student debts
  
  Given user is driveUp admin
  When user is on the list of student debts
  Then user sees a list of student debts
  * each debt item displays student, financial balance and training status
