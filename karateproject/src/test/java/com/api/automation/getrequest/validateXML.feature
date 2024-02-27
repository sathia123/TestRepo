Feature: Validate XML response

  Background: Setup the base path
    Given url apiUrl
    And print '*******This is the background******'

  Scenario: To validate XML response
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    And print response
    Then status 200
    And match response/List/item/jobId == '1'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[3] == 'Gradle'
    #skip response keyword
    And match  /List/item/experience/experience[1] == 'Google'
    #Traverse to XML similar to JSON
    And match response.List.item.experience.experience[0] == 'Google'
    
    
    Scenario: To validate XML response and fuzzy matcher
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    And print response
    Then status 200
    And match response/List/item/jobId == '#notnull'
     And match response/List/item/jobTitle == '#string'
    And match response/List/item/experience/experience[1] == '#notnull'
    And match response/List/item/project/project/projectName == '#present'
    And match response/List/item/project/project/technology/technology[3] == '#ignore'
    