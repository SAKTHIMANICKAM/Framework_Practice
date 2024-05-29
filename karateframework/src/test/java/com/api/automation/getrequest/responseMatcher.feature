Feature: To validate the GET End point
  To validate the get end point response.
  
  Background: Setup the base url
  Given url 'http://localhost:9897'
  
  Scenario: To get the data in JSON Format.
  And path '/normal/webapi/all'
  And header Accept = 'application/json'
  When method get
  Then status 200
  And print response
  
    Scenario: To get the data in XML Format.
  And path '/normal/webapi/all'
  And header Accept = 'application/json'
  When method get
  Then status 200
  And print response
  
##Match Keyword. Used to add the validation on response.

Scenario:  To get the data in JSON format and matches the response.
  And path 'normal/webapi/all'
  And header Accept = 'application/json'
  When method get
  Then status 200
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

  Scenario:  To get the data in JSON format and matches the specific response.
  And path 'normal/webapi/all'
  And header Accept = 'application/json'
  When method get
  Then status 200
  And print response
  And match response contains deep {"jobDescription": "To develop andriod application"}
  And match response contains deep {"project":[{"projectName": "Movie App"}]}
  #contains - Match a value in complex nested payloads.
  
  
  #Validation of property in JSON Array.
  #Use index to get the value from JSON Array. The index starts from "0"
