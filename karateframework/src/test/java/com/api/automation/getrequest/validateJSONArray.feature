
Background: Set up the Background url
Given base url 'http://localhost:9897'


Scenario:  To get the data in JSON format and matches the specific response.
  And path 'normal/webapi/all'
  And header Accept = 'application/json'
  When method get
  Then status 200
  And match response.[0].jobid == 1
  And match response.[0].experience[1]== 'Apple'
  And match response.[0].project[0].projectName == 'MovieApp'
  And match response.[0].project[0].technology[2] == 'Gradle'
  #Validate Size of an Array:
  And match response.[0].experience == '#[3]'
  And match response.[0].project[0].technology == '#[3]'
  
  #Using wild card char(Asserting all the values in JSON array)
  And match response.[0].experience[*] == ['Google','Apple','Mobile Iron']
  And match response.[0].project[0].technology[*] == ["Kotlin", "SQL lite", "Gradle"]
  
  #2nd approach of using Wild card:
  #Use contains keyword to get the specific results/ specific order:
  And match response.[0].experince[*] contains ["Apple","Mobile Iron"] 
  And match response.[0].project[0].technology[*] contains ["Kotlin","Gradle"]
  And match response.[*].jobid contains 1
 #Validation of property in JSON Array.
  #Use index to get the value from JSON Array. The index starts from "0"
  
  #So ,using Index value is not recommended, whenever index changes code also needs to be changed.
  #For that we are going to use Wildcard Characters.
  #Avoid using Index value and use[*]wild card instead.
  # [*] - This expression will give all the value present in the array including the order.
  
  
  ##Fuzzy Matcher.
  Scenario:  To get the data in JSON format and validate using Fuzzy matcher.
  And path 'normal/webapi/all'
  And header Accept = 'application/json'
  When method get
  Then status 200
  And match response.[0].jobid == '#present'
  And match response.[0].experience[1]== '#notnull'
  And match response.[0].project[0].projectName == '#ignore'
  And match response.[0].project[0].technology == '#array'
  And match response.[0].jobTitle == '#string'
  And match response.[0].jobid == '#number'
  
  #Complex Fuzzy Matcher.
  #? EXPR - Javascript expression which either returns true or false.
  #-  "_" --> this is called as "self" variable.
  And match response.[0].jobId == '#? _ >= 1'
  And match response.[0].jobTitle == '#string? _.length >= 1'
  
  ## To validate the array:
  And match response.[0].experience == '#[]'
  And match response.[0].experience == '#[3]'
  #Make sure it is array of string
  And match response.[0].experience == '#[3] #string'
  And match response.[0].experience == '#[] #string? _.length>=2'
  
  