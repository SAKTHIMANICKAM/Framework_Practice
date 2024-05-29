Feature: Variables creation in Karate Framework.

Background: Create and Intialize Variables
 * def app_name = "Google"
 * def page_load_timeout = 20

#def - keyword is coming from karate framework. And it is used to create a variable.
# <Gherkin keyword> <def> <variable_name> = <value>
# * <def> <variable_name> = <value>

 #Gherkin Keyword - Given/When/then/And
 
 #When constant value keeps on repeating replace it with a variable.
 
 Scenario: To create a variable:
 # Use varaible for repeating value
 # Storing the data from a external file
 # Using a variable in matcher expression.
 #Passing the data from one feature file to another feature file.
 
 #While creating the variable we no need to specify the type, the variable type will be automatically
 #inferred using the value type be automatically determine.
 #During variable creation, the Gherkin Keyword is optional,
 #You can use "*" character instead of the Gherkin Keyword.
 
 Given def var_int = 10
 And def var_string = 'Karate'
 Then print "Int_variable ==>", var_int
 And print "String_varible ==>", var_string
 * def var_int_2 = var_int+10
 And print "Int_varaible_2 ==>", var_int_2
 
 Scenario: Accessing the variable from previous scenario,. So it is not possible, scope is limited.
 Given print "Previous scenarios ==>" , var_int
 And print "Previous scenarios ==>", var_string
 And print "Previous scenarios ==> ", var_int_2
 
 
