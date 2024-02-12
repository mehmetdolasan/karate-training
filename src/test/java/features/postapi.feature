Feature: Create user using post api

  Background:
    * url "https://gorest.co.in"
    * def requestPayload =
    """
    {
        "name": "Tom",
        "email": "tom12@gmail.com",
        "gender": "male",
        "status": "active"
    }
    """

    Scenario: Create a user with given data
      Given path '/public/v1/users'
      And request requestPayload
      And header Authorization = 'Bearer '+tokenID
      When method post
      Then status 201
      And match $.data.id == '#present'
      And match $.data.name == '#present'
      And match $.data.email == 'tom12@gmail.com'
