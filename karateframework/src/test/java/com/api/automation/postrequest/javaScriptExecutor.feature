Feature: To execute the Java script executor.


#Skip the function name when implementation is defined in the feature file.
Scenario: Execute java script executor with and without parameter
* def getIntvalue = function() { return 10; }
Then print "Function value ==>" , getIntvalue()
*def getRandomvalue = function() {return Math.floor((100)* Math.random());}
#math, floor and random all are Java script std.,function.
Then print "Function value ==>", getRandomValue()
#Function with Arguments and passing the same in it.
* def getstringValue = function() {return "Hello", + arg1;}
Then print "Function value==>", getstringValue("World")

#Embedded Expression:
#Instead of Hot coding the value in request body especially in POSt request we are using Embedded Exp.
#Ex:
* def jobID = 100;
* def jobTitle = "Manager"
#So, in the request we can rechanging the value by using embedded syntax:
 #: #(jobID)
 #: #(jobTitle)
 
 #{ "jobId": '#(jobID)', "jobTitle": '#(jobTitle)'}
 
 