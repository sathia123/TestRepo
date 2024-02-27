Feature: Validate JSON Array

  Background: Setup the base path
    Given url apiUrl
    And print '*******This is the background******'

  Scenario: To get the data in JSON format array
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    And print response
    Then status 200
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'
    #validate the size of array
    And match response.[0].experience == '#[3]'
    And match response.[0].project[0].technology == '#[3]'
    #use wild card char, sequence of item in array is important
    And match response.[0].experience[*] == ["Google","Apple","Mobile Iron"]
    And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
    # use contains keyword
    And match response.[0].experience[*] contains 'Apple'
    And match response.[0].project[0].technology[*] contains 'SQL Lite'
    And match response.[*].jobId contains 1

  Scenario: To get the data in JSON format array and validate using fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    And print response
    Then status 200
    And match response.[0].jobId == '#present'
    And match response.[0].jobTitle == '#string'
    And match response.[0].experience[1] == '#notnull'
    And match response.[0].project[0].projectName == '#ignore'
    And match response.[0].project[0].technology == '#array'
    And match response.[0].jobId == '#number'
    #complex fuzzy matcher
    And match response.[0].jobId == '#? _>=1'
     And match response.[0].jobTitle == '#string? _.length ==13'
     #to validate array
     And match response.[0].experience == '#[]'
     And match response.[0].experience == '#[3]'
     #make sure it is a array of string
     And match response.[0].experience == '#[3] #string? _.length >= 3'
      
     
     
    
