Feature: To create jon entry in the test application.
Helper file for POST - /normal/webapi/add

Background: Create and Intialize the base url
Given url 'http://localhost:9897'

#This is the feature, which will get re-used by other feature file.
Scenario: To update Job entry for existing job in JSON Format.
Given path '/normal/webapi/add'
#* def getRandomValue = function() {return Math.floor((100) * Math.random());}
#* def id = getRandomValue()
And request {}
And headers {}
When method post
And status 201


#Syntax for calling one feature file to another feature file.
#<Gherkin Keyword> <call> <read(<location of file>)>
# Call keyword is coming from Karate Framework.
Given call read("../createJobEntry.feature")

########IMPORTANT############

#In the called feature file, always have one scenario.
#If you have multiple scenarios.
#The recommended approach is to combine them in a single scenario.