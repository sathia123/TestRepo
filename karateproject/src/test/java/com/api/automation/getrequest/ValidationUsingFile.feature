Feature: To validate the GET End response from file
  To validate the get end point response from external file

  Background: Setup the base path
    Given url apiUrl

  Scenario: to get the data in JSOn format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    #create a variable to store  the data from external file
    * def actualResponse = read("../JsonResponse.json")
    And print "File ==> ", actualResponse
    And match response == actualResponse
    
    
    Scenario: to get the data in xml format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
     #create a variable to store  the data from external file
    * def XMLactualResponse = read("../XmlResponse.xml")
    And match response == XMLactualResponse
      