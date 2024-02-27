Feature: Title of your feature
  I want to use this template for my feature file

  Background: Setup the base path
    Given url apiUrl
    And print '*******This is the background******'

  Scenario: To get data in JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    And print response
    And match response ==
      """
      [
      {
      "jobId": 1,
      "jobTitle": "Software Engg",
      "jobDescription": "To develop andriod application",
      "experience": [
        "Google",
        "Apple",
        "Mobile Iron"
      ],
      "project": [
        {
          "projectName": "Movie App",
          "technology": [
            "Kotlin",
            "SQL Lite",
            "Gradle"
          ]
        }
      ]
      }
      ]
      """

  Scenario: To get data in xml format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    And print response
    And match response ==
      """
      <List>
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
        <experience>Google</experience>
        <experience>Apple</experience>
        <experience>Mobile Iron</experience>
      </experience>
      <project>
        <project>
          <projectName>Movie App</projectName>
          <technology>
            <technology>Kotlin</technology>
            <technology>SQL Lite</technology>
            <technology>Gradle</technology>
          </technology>
        </project>
      </project>
      </item>
      </List>
      """

  @debug
  Scenario: To get data in JSON format and validate a specific property
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    And print response
    And match response  contains deep {"jobDescription": "To develop andriod application"}
    And match response  contains deep {"project":[{ "projectName": "Movie App"}]}
    And match header Content-Type == 'application/json'