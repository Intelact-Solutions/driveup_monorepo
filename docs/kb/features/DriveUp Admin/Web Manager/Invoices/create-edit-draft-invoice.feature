Feature: Create-Edit draft invoice

  Scenario: Current date is always pre-filled as invoice date in the form
  
  Given user is driveUp admin
  When user is on the "Add invoice" form
  Then current date is pre-filled as invoice date

  Scenario: Edit form triggers alert if user has missing mandatory data
  
  Given user is driveUp admin
  * driving school has not registered mandatory field <field>
  * user is on the list of invoices
  When user clicks "Add invoice"
  Then user sees alert for missing mandatory field <field>
  
  Examples: 
  |field|
  |Company address|
  |Tax ID|
  |IBAN|

  Scenario: No invoice number is generated for a draft invoice
  
  Given user is driveUp admin
  * user is on the list of invoices
  When user clicks "Add invoice"
  * user fills in all mandatory fields for a new invoice
  * user clicks "Save as draft"
  Then new draft invoice is created without an invoice number
  * user sees info text "Invoice number will be generated after generating the invoice" in the edit form

  Scenario: User can add missing mandatory data directly from the form
  
  Given user is driveUp admin
  * driving school has not registered mandatory field <field>
  * user is on the "Add invoice" form
  When user clicks on the alert for missing mandatory field <field>        
  Then user sees a popup form to add the missing data
  * alert is deactivated after adding the missing data
  * user can successfully create a draft invoice after adding the missing data
  
  Examples: 
  |field|
  |Company address|
  |Tax ID|
  |IBAN|

  Scenario: User can create a new draft invoice
  
  Given user is driveUp admin
  * user is on the list of invoices
  When user clicks "Add invoice"
  * user fills in all mandatory fields for a new invoice
  * user clicks "Save as draft"
  Then new draft invoice is created and displayed in the list of invoices

  Scenario: User can delete draft invoice
  
  Given user has a draft invoice
  When user opens the list of invoices
  * user clicks on a draft invoice
  * user clicks on "Delete draft"
  * user confirms the deletion
  Then draft invoice is deleted

  Scenario: User can edit draft invoice
  
  Given user is driveUp admin
  * user is on the list of invoices
  * user has a draft invoice
  When user clicks on the draft invoice in the list
  Then user sees "Edit invoice" button on the sidebar
  * user can open the edit mask of the invoice by clicking the button

  Scenario: User can edit pre-filled VAT rate
  
  Given user is driveUp admin
  * VAT rate is pre-filled in the "Add invoice" form
  When user changes the pre-filled VAT rate
  Then new VAT rate is saved in the draft invoice
  * total calculation is updated according to the new VAT rate

  Scenario: User can opt to save newly added data in company settings
  
  Given user is driveUp admin
  * driving school has not registered mandatory field <field>
  * user is on the "Add invoice" form
  When user clicks on the alert for missing mandatory field <field>        
  * user adds the missing data 
  * user clicks the checkbox "Save in company settings"
  * user saves the newly added data
  Then newly added data is saved in company settings
  * user does not see the alert in the next attempt
  
  Examples: 
  |field|
  |Company address|
  |Tax ID|
  |IBAN|

  Scenario: VAT rate is pre-filled in the Add invoice form
  
  Given user is driveUp admin
  * driving school has set a default VAT rate in company settings
  When user is on the "Add invoice" form
  Then VAT rate is pre-filled with the default VAT rate from company settings
