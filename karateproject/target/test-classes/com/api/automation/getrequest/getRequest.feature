Feature: To test the get end point of the application

  Background: Setup the base path
    Given url 'http://localhost:9191'
    And print '*******This is the background******'

  
  Scenario: To get all data from application in JSON format
    Given path '/normal/webapi/all'
    When method get
    And print response
    Then status 200

  Scenario: To get all data from application in JSON format using path variable
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200

  Scenario: To get all data from application in XML format using path variable
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200