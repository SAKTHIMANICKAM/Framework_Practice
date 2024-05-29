Feature: Update the Job entry using PUT request

Background: Initialze the base url
 Given baseurl 'http://localhost:9897'
 
 Scenario: To update the Job entry for exisyting job in JSON Format
 #create a new Job Entry
 #Update the Job Entry using PUT request
 #Using Jsonpath verify the updation of details in Job Entry
 And path 'normal/webapi/add'
 And request {}
 And headers {}
 When method post
 Then status 201