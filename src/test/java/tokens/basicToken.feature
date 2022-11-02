Feature: test basic token

Scenario: basic autentication test
Given url 'https://postman-echo.com/basic-auth'
When header Authorization = call read('tokenB.js') {username:'postman', password:'password'}
And method GET
Then status 200