Feature: JSON Schema validation - /normal/webapi/add

Background: To provide the baseurl
Given url 'http://localhost:9897'


#Use Fuzzy matcher to create the schema for the validation purpose.
Scenario: To create Job entry in JSON 
Given url '/normal/webapi/add'
 * def body = read("data/jobEntry.json")
 And request body
 When method post
 Then status 201
 And match response ===
 """
 {
   "jobId": '#number',
   "jobTitle": '#String',
   "jobDescription": '#string',
   "experience": '#[] #string',
   "project": '#[] #object'
 }
 """
 
 Scenario: Scheman Validation for GET end point
 Given url '/normal/webapi/add'
 When method get
 Then status 200
 * def projectSchema = {"projectName": '#string', "technology": '#[] #string'}
 * def mainSchema = {"jobId": '#number', "JobTitle": '#string', "jobDescription": '#string',"experience": '#[] #string', "project": '#[] ##(projectSchema)'}
 And match response ==
 """
 '#[] ##(mainSchema)'
 """