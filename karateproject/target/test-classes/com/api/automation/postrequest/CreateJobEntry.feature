Feature: To create job entry in the pplication

  #  Use post /normal/webapi/add to create job
  Background: Create and initialize base url
    Given url apiUrl


  Scenario: To create the job entry in JSON format
    Given path '/normal/webapi/add'
    And request {"jobId": 1,"jobTitle": "Software Tester", "jobDescription": "To develop andriod application", "experience": ["Google","Apple","Mobile Iron"],"project": [{"projectName":"Movie App","technology": ["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept: 'application/json', Content-type: 'application/json'}
    When method post
    And print response
    And status 201
    And match response.jobTitle == 'Software Tester'

  @ignore
  Scenario: To cdreate the job entry in JSON format using external file
    Given path '/normal/webapi/add'
    * def data = read("data/jobEntry.json")
    And request data
    And headers {Accept: 'application/json', Content-type: 'application/json'}
    When method post
    And print response
    And status 201
    And match response.jobTitle == 'Software Tester6'

  @ignore
  Scenario: To create the Job Entry using XML request body formt
    Given path '/normal/webapi/add'
    And request <item><jobId>7</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience><experience>Subex</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology><technology>Jenkins</technology></technology></project></project></item>
    And headers {Accept : 'application/json', Content-Type: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response.jobId == 7

  @ignore
  Scenario: To create the Job Entry using XML request body formt
    Given path '/normal/webapi/add'
    * def data = read("data/jobEntry.xml")
    And request data
    And headers {Accept: 'application/json', Content-type: 'application/xml'}
    When method post
    And print response
    And status 201
    And match response.jobId == 8

@ignore
  Scenario: To create the Job Entry with JSON data with embeded variable
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {  "jobId": '#(id)',"jobTitle": "Software Engg - 2", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    And print response
    And match response.jobTitle == "Software Engg - 2"
    
    @ignore
    Scenario: To create the Job Entry using XML request body formt with embedded expression
    Given path '/normal/webapi/add'
    * def getJobID = function() {return Math.floor((100) * Math.random());}
    * def jobID = getJobID()
    And request <item><jobId>#(jobID)</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience><experience>Subex</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology><technology>Jenkins</technology></technology></project></project></item>
    And headers {Accept : 'application/json', Content-Type: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response.jobId == '#(jobID)'