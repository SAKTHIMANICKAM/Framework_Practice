Feature: To create job description in the test application.

Background: To read the data from the csv file.
* def testdata = read("testData.csv")

  #######DATA DRIVEN PART -1###############
  Scenario Outline: To create job description in the test application <method>
    ## For scenario steps, Given/When/Then/And
    Given print '<url>' #To access the Column values in the steps.
    Then print '<path>'
    When print '<method>'
    And print '<status>'

    #Examples can be used only when we are using Scenario Outline.
    #Data set for Data driven testing
    #The First row has the column headers Karate will treat them as variable.
    Examples: 
      | url                   | path               | method | status |
      | http://localhost:9897 | /normal/webapi/all | get    |    200 |
      | http://localhost:9897 | /normal/webapi/add | post   |    201 |

  ##Data Driven testing for POST end point.
  Scenario Outline: Data Driven for the Job description entry <jobID>
    Given base url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request  {"jobId": '#(jobID)', "jobtitle": '#(JobTitle)', "jobdescription": '#(jobDescription)'}
    And headers {}
    When method post
    Then status <status>

    ## This data set is okay, when u have limited set of data, but when u have more set of data,
    #, this won't help in the scenario outline.
    Examples: 
      | jobID | JobTitle  | jobDescription         | Status |
      |  9890 | Soft engg | To develop andriod app |    201 |
      | id    | Sodtbehe  | To develop             |    201 |
      | False | Software  | To develop             |    201 |
      
      
################## DATA DRIVEN PART - 2 #########################
#in this case, we are going to store the data in external files and use it.(testData.csv- refer)
# we are going the read file and proceed further.
#For that we are creating a varaible to read the file before the scenario outline in BG Section.


Scenario Outline: Data Driven for the Job description entry using csv file- <jobId>
    Given base url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request  {"jobId": '#(jobID)', "jobtitle": '#(JobTitle)', "jobdescription": '#(jobDescription)'}
    #Variables name in the scenario shoud be the same as the column headersin the csv file.
    And headers {}
    When method post
    Then status <status>
    Examples: 
      |testdata|
      # or u can directly read the file here by using below line:
      #  |read("testData.csv")|