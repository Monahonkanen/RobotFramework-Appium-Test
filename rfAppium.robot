*** Settings ***
Library            AppiumLibrary
Test Setup         Open My Application
Test Teardown      Close Application

*** Test Cases ***
First Test Case
    Validate First View

Second Test Case
    Leave Input Empty
    Validate Second Test

Third Test Case
    Add Inalid Values
    Validate Third Case

Fourth Test Case
    Add Valid Values
    Validate Second View
    Press Arrow
    #Validate First View

Fifth Test Case
    Valid inputs at once
    Validate last Case

*** Keywords ***
Open My Application
    Open Application        http://localhost:4723/wd/hub        platformName=Android            platformVersion=8.0.0        
                    ...     deviceName= 8NH4C17214000986        automationName=uiautomator2      
                    ...     app=C:/Users/honka/AndroidStudioProjects/BMIApp/app/build/outputs/apk/debug/app-debug.apk    
                    ...     appPackage=fi.example.bmiapp     appActivity=fi.example.bmiappesp.MainActivity
                    ...     skipDeviceInitialization=true
                    ...     noReset=true

Validate First View
    Wait Until Page Contains            titleText
    Element Should Contain Text         editPituus      ${EMPTY}
    Element Should Contain Text         editPaino       ${EMPTY}
    Wait Until Page Contains            laskeButton

Leave Input Empty
    Wait Until Page Contains            editPituus
    Input Text                          editPituus        170
    Tap                                 laskeButton

Validate Second Test
    Element Text Should Be              editPituus        170
    Wait Until Page Contains Element     //*["Kirjoita paino!"]

Add Inalid Values
    Wait Until Page Contains            editPituus
    Input Text                          editPituus         170
    Input Text                          editPaino          20
    Tap                                 laskeButton

Validate Third Case
    Element Text Should Be              editPituus          170
    Element Text Should Be              editPaino           20
    Wait Until Page Contains Element    //*["30 - 220"]    

Add Valid Values
    Wait Until Page Contains            editPituus
    Input Text                          editPituus          170
    Input Text                          editPaino           65
    Tap                                 laskeButton

Validate Second View
    Wait Until Page Contains            tulosTitleView
    Element Text Should Be              resultView          22,5
    Element Should Contain Text         labelView           Olet normaalipainoinen
    Element Should Be Visible           imageView2

Press Arrow
    Click Element                       class=android.widget.ImageButton

Valid inputs at once
    Wait Until Page Contains            editPituus
    Input Text                          editPituus          160
    Input Text                          editPaino           35
    Tap                                 laskeButton

Validate last Case
    Wait Until Page Contains            tulosTitleView
    Element Text Should Be              resultView          13,7
    Element Should Contain Text         labelView           Olet alipainoinen
    Element Should Be Visible           imageView2