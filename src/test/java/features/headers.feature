Feature: GET API headers feature

  Scenario: pass the user request with headers

    Given header User-Agent = 'PostmanRuntime/7.36.1'
    And header Accept = '*/*'
    And header Content-Type = 'application/json; charset=utf-8'
    And header Accept-Encoding = 'gzip,deflate'
    And header Connection = 'keep-alive'
    And header Authorization = 'Bearer 493468bb0bc527c34cd0d76b55c1aeb1e62348d698e86681ff2d884168421d17'
    
    Given url baseUrl+'/public/v1/users'
    And path '6129365'
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers_Part2

    * def request_headers = {User-Agent: 'PostmanRuntime/7.36.1', Accept: '*/*', Content-Type: 'application/json; charset=utf-8', Accept-Encoding: 'gzip,deflate', Connection: 'keep-alive', Authorization: 'Bearer 493468bb0bc527c34cd0d76b55c1aeb1e62348d698e86681ff2d884168421d17' }
    
    Given headers request_headers
    Given url baseUrl+'/public/v1/users'
    And path '6129365'
    When method GET
    Then status 200
    * print response

  Scenario: pass the user request with headers_Part3

    * configure headers = {User-Agent: 'PostmanRuntime/7.36.1', Accept: '*/*', Content-Type: 'application/json; charset=utf-8', Accept-Encoding: 'gzip,deflate', Connection: 'keep-alive', Authorization: 'Bearer 493468bb0bc527c34cd0d76b55c1aeb1e62348d698e86681ff2d884168421d17' }

    Given url baseUrl+'/public/v1/users'
    And path '6129365'
    When method GET
    Then status 200
    * print response