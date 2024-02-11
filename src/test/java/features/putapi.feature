Feature: Update a user with put api
  Background:
    * url "https://gorest.co.in"
    * def requestPayload =
    """
    {
      "status": "inactive"
    }
    """

  Scenario: Update a user with put api
    Given path '/public/v1/users/6267354'
    And request requestPayload
    And header Authorization = 'Bearer '+tokenID
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Tom'
    And match $.data.email == 'ZhbtxHEuWf@gmail.com'
    And match $.data.status == 'inactive'
