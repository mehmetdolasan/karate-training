Feature: GET API feature

  Scenario: get user details
    Given url baseUrl+'/public/v1/users'
    And path '6129374'
    When method GET
    Then status 200
    * print response
    * def jsonObject = response
    * def actId = jsonObject.data.id
    * def actName = jsonObject.data.name
    * def actEmail = jsonObject.data.email
    * print actId
    * print actName
    * print actEmail
    * match actId == 6129374
    * match actName == "Ganaka Kaul"
    * match actEmail == "kaul_ganaka@bins.example"


  Scenario: get user details - user not found
    Given url "https://gorest.co/inpublic/v1/users"
    And path "63"
    When method GET
    Then status 404