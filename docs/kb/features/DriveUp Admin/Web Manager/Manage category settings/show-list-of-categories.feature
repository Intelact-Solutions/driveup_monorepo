Feature: Show list of categories

  Scenario: User sees list of active categories
  
  Given user is logged in to driveUp
  When user opens "Category settings"
  Then user sees list of active categories on top of the page
  * user sees details for each category
  |icon|Category name|Badge| driving lesson price | administration fee | session duration| 
  * clicking on a category opens the detailed view on a sidebar

  Scenario: User sees list of inactive categories
  
  Given user is logged in to driveUp
  When user opens "Category settings"
  Then user sees list of inactive categories below active categorie
  * user sees only category name and icon for each category
  * toggler is turned off 
  * clicking on the category itself does not trigger the sidebar
