Feature: To create Job entry in the application.
 # Use POST normal/webapi/add to create job entry in the application:
 
 Background: To intialize the base url
 Given url 'http://localhost:9897'
 
 Scenrio: To create Job entry in JSON Format
 Given path '/normal/webapi/add'
 And request 
 And headers {Accept: 'application/json', Content-Type: 'application/json'}
 #headers = keyword is used for attaching one or more header.
 When method post
 Then status 201
 And match response.jobTitle == ""
 #When u are getting the response in JSON Array then u should use Index
 #Here we are getting the response as JOSN OBject so directly we validating using "." dot operator.
 
 Scenario: To create job entry using JSON request body,.
 Given url '/normal/webapi/add'
 * def body = read("data/jobEntry.json")
 And request body
 When method post
 Then status 201
 And print response