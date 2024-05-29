Feature: To use the JSON Path expression

Background: To run the base url
Given url 'http://localhost:9897'
And print '==========Background Keyword=================='

Scenario: To get the value of the property usinh JSON path expression
Given path '/normal/webapi/all'
When method get
Then status 200
And print response
# Using the Jobid property, try to get other property value using jsonpath Expression.
#Karate.jsonPath(doc, jsonPathExpression)
* def jobTitle = Karate.jsonPath(response, "$[?(@.jobId ==1)].jobTitle")
* def jobDescription = Karate.jsonPath(response, "$[?(@.jobId ==1)].jobDescription")
* def experience = Karate.jsonPath(response, "$[?(@.jobId ==1)].experience")
#Or u can write it by using index value $[0].jobTitle.
