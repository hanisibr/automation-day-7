*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keywords ***
Login
     [arguments]    ${my_email}     ${my_pw}
     Open Browser   url=https://app.deriv.com    browser=chrome
     set window size    1280    1028
     wait until page does not contain element   dt_core_header_acc-info-preloader    60
     wait until page contains element   ${login_button}      60
     click element  ${login_button}
     wait until page contains element   ${email_field}     15
     input text     ${email_field}      ${my_email}
     input text     ${pw_field}      ${my_pw}
     click element  ${login_oauth_btn}

AccountSettings
     wait until page does not contain element   dt_core_header_acc-info-preloader   60
     wait until page contains element   //*[contains(@class, "account-settings-toggle")]    30
     click element  //*[contains(@class, "account-settings-toggle")]
     wait until page does not contain element   //*[contains(@class, "initial-loader account__initial-loader")]     60
     wait until page contains element   dc_api-token_link    30
     click element      dc_api-token_link
     wait until page does not contain element   //*[contains(@class, "initial-loader account__initial-loader")]     60
     wait until element is visible       //*[contains(@class, "da-api-token")]   30

Checkbox
    click element    //*[contains(@class, "composite-checkbox api-token__checkbox")]
    wait until element is visible       //*[contains(@class, "composite-checkbox api-token__checkbox composite-checkbox--active")]

CreateToken
    input text      //*[contains(@class, "dc-input__field")]     text=token_name_1
    wait until element is visible   //*[contains(@class, "dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button")]    10
    click element       //*[contains(@class, "dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button")]
    wait until page does not contain element    //*[contains(@class, "initial-loader initial-loader--btn")]     15

CopyToken
    wait until element is visible   //*[contains(@class, "da-api-token__table-cell-row")]   15
    click element   //*[contains(@class, "dc-popover__target")]



