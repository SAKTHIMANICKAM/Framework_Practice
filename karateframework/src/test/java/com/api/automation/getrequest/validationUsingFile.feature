Feature: Validate response using external file
  
  
  Background: Setup the base url
  Given url 'http://localhost:9897'
  
  #First, we are creating a JSON file which contains a response.
  #read<file_location >- API to read the data from file.
  
  Scenario:  To get the data in JSON format and Validate from file.
  And path 'normal/webapi/all'
  And header Accept = 'application/json'
  When method get
  Then status 200
  # Creating a variable to store the data from external file.
  # ../ - represnt the parent directory.
  * def actualResponse = read("/karateframework/src/test/java/com/automation/api/JsonResponse.json")
  And match response === actualResponse
  And print "File -->" , actualResponse
 
 