Feature: User can request max. 5 verification codes in one hour

Scenario: User can request max. 5 verification codes in one hour

Given user has submitted phone number
  * user has received an initial verification code per SMS
  * user has resent the verification code 4 times in an hour
  When user clicks "Resend" a 5th time in an hour
  Then the "Resend" button remains disabled
  * user sees message "Resend will be available in 1 h"
