
Feature: Authentication Smoke Test 

@Smoke1
Scenario: Generate token with Valid username and password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response
* print response.token

@Smoke1
Scenario: Generate token with invalide username and valid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor1","password": "tek_supervisor"}
When method post
Then status 404
And print response
And assert response.errorMessage == "USER_NOT_FOUND"
