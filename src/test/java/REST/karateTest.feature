@plan-de-pruebas
Feature: plan de pruebas api REST

  @casoGET
    #ejemplo caso get si funciona
  Scenario Outline: caso de prueba <nombreCaso>
    Given url 'https://reqres.in/api/users/<ID>'
    When header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    When method GET
    Then status <estadoHTTP>
    Examples:
      | nombreCaso        | ID | estadoHTTP |
      | caso id 1         | 1  | 200        |
      | caso id 2         | 2  | 200        |
      | caso id 3         | 3  | 200        |
      | caso id not Found | 50 | 404        |

  @casoPost
    #ejemplo caso post si funciona
  Scenario Outline: casos de prueba <nombreCaso2>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": <Vname>,"<job>": <Vjob>}
    And method POST
    Then status 201
    Examples:
      | nombreCaso2    | name | Vname    | job | Vjob  |
      | name vacio     | name |          | job | "QA"  |
      | name nulo      | name | null     | job | "QA"  |
      | name 3 letras  | name | "sol"    | job | "QA"  |
      | sin campo name |      |          | job | "QA"  |
      | job vacio      | name | "jeremy" | job | ""    |
      | job nulo       | name | "jeremy" | job | null  |
      | job 3 letras   | name | "jeremy" | job | "QAs" |
      | sin campo job  | name | "jeremy" |     | ""    |

  #ejemplo caso post cambiando request si funciona
  Scenario: caso de prueba tipo POST numero 2
    Given url 'https://reqres.in/api/users'
    When request
    """
    {
    "name": "jeremy",
    "job": "QA"
}
    """
    And method POST
    Then status 201