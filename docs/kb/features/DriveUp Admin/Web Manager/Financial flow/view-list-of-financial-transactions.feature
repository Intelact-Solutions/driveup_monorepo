Feature: View list of financial transactions

  Scenario: User can filter financial transactions
  
  Given user is manager
  * company has various types of financial transactions
  When user opens the "Financial Flow" page
  * user clicks the filter button
  * user filters by <filter_type>
  Then user sees only the selected type of financial transactions in the list
  
  Examples:
  | filter_type         |
  | time period         |
  | instructor          |
  | financial item type |
  | training type       |
  | transaction status  |

  Scenario: User can search for a specific financial transaction
  
  Given user is manager
  * user opens the "Financial Flow" page
  * user enters <searchCriteria> in the search bar
  Then list is filtered to show only transactions matching the search criteria
  
  Examples:
  | searchCriteria      |
  | student name        |
  | student phone number|
  | transaction amount  |

  Scenario: User can see cancelled financial transactions
  
  Given user is manager
  * company has cancelled financial transactions
  When user opens the "Financial Flow" page
  Then user sees cancelled financial transactions in the list
  * each cancelled transaction displays the cancellation type, amount, date & time
  * each cancelled transaction shows the student profile picture, name and phone number

  Scenario: User can see discounts in the list of financial transactions
  
  Given user is manager
  * company has discounts applied to student payments
  When user opens the "Financial Flow" page
  Then user sees discounts in the list of financial transactions
  * each discount displays the label "Discount", amount, date & time
  * each discount shows the student profile picture, name and phone number

  Scenario: User can see financial flow
  
  Given user is manager
  When user opens the "Financial Flow" page
  Then user sees list of financial transactions
  * each transaction displays the transaction type, amount, date & time and status
  * each transaction shows the student profile picture, name and phone number

  Scenario: User can see refunds in the list of financial transactions
  
  Given user is manager
  * company has refunds issued to students
  When user opens the "Financial Flow" page
  Then user sees refunds in the list of financial transactions
  * each refund displays the label "Refund", amount, date & time
  * each refund shows the student profile picture, name and phone number

  Scenario: User sees both approved and pending payments
  
  Given user is manager
  When user opens the "Financial Flow" page
  Then user sees both approved and pending payments in the list
  * each payment displays the amount, date & time, and status
  * each payment shows the student profile picture, name and phone number
