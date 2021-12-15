*** Settings ***
Library   SeleniumLibrary
Resource  common.robot

*** Variable ***
${login_button}   dt_login_button
${email_field}   //*[@name="email"]
${pw_field}     //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]

*** Test Cases ***
Open Deriv
     Login  ${my_email}     ${my_pw}
     AccountSettings
     Checkbox
     CreateToken
     CopyToken
