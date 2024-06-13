Feature: To test the end point of the application.

  Background: To setup the  Base path:
    Given url 'http://localhost:9897'
    And print '====================='

  Scenario: To get all the data from application in JSON format.
    #Given url 'http://localhost:9897/normal/webapi/all'
    #url- keyword is used to define the end point url.
    And path '/normal/webapi/all'
    When method get
    Then status 200

  #Status - used for HTTP status code comparison.
  Scenario: To get all the data from application in JSON format using path variable
    #Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    #Basepath + Context path
    #url- keyword is used to define the end point url.
    When method get
    Then status 200

  #Status - used for HTTP status code comparison.
  ##HTTP Headers - Response and request:
  Scenario: To get all the data from application in XML format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200

  ##HTTP Headers - Response and request:
  Scenario: To get all the data from application in JSON format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    
    
    ### Complex JSON Array:
    Scenario: To read the complex json array and print the response.
    * def jsonObject =
    """
    {
    "menu": 
    {
     "id": "file",
    "value": "File",
     "popup": 
     {
      "menuitem": 
      [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
     ]
  }
}}
    
    """
    
  And print jsonObject
  And print jsonObject.menu
  And print jsonObject.menu.id
  And print jsonObject.menu.popup
  And print jsonObject.menu.popup.menuitem[0]
