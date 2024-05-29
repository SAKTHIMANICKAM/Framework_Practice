Feature: To upload the file using karate framework

Background: To run the base url
Given url 'http:/localhost/9897'

Scenario: To upload in the test application
Given path 'normal/webapi/upload'
#multipart file keywords are coming from the Karateframework.
# Use mutlipart file for building mutlipart named (form) field requests.
#Location of file, name of the file, content-type header value.
And multipart file file = {read: 'FileToUpload.txt', filename:'FileToUpload.txt', Content-type: 'multipart/formdata'}
When method post
Then status 200
And print response