@graphQLTEST

Feature: plan de pruebas asociado a query graphQL


  #query graphQL si funciona lectura archivo txt
  Scenario Outline: caso de prueba body calls <nombreCaso>

    Given url 'https://rickandmortyapi.com/graphql'
    When def query = read ('testGRAPH.txt')
    And replace query.num = <num>
    And request {query : '#(query)'}
    And method POST
    Then status 200
    Examples:
      | nombreCaso   | num |
      | caso normal  | 2  |
      | genero id 13 | 13 |
      | genero id 3  | 3  |
      | genero id 40 | 40 |
      | genero id 10 | 10 |
