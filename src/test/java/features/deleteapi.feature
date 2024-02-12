Feature: Delete user using delete api

  Background:
    * url "https://gorest.co.in"

    * def random_string =
    """
      function(s) {
        var text = "";
        var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        for(var i=0; i<s; i++) {
          text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
        }
          return text

      }
    """

    * def randomString = random_string(10)
    * print randomString

    * def requestPayload =
    """
    {
        "name": "Tom",
        "gender": "male",
        "status": "active"
    }
    """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Delete a user with given user id
    #1. create a user using POST CALL
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer '+tokenID
    When method POST
    Then status 201
    And match $.data.id == '#present'

    #fetch the user id
    * def userId = $.data.id
    * print userId

    #2. delete the same user
    Given path '/public/v1/users/' + userId
    And request requestPayload
    And header Authorization = 'Bearer '+tokenID
    When method DELETE
    Then status 204

    #3. get the same user
    Given path '/public/v1/users/' + userId
    When method GET
    Then status 404
    Then match $.data.message == 'Resource not found'

