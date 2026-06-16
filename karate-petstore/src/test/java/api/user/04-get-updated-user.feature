@smoke @user @verify
Feature: PetStore API - Verificar usuario actualizado
  Como tester de QA
  Quiero confirmar que los cambios persistieron
  Para validar la consistencia del endpoint GET /user/{username}

  Background:
    * url baseUrl
    * def userData = call read('classpath:api/helpers/generate-user.js')
    * def createPayload = userData.createPayload

  Scenario: Buscar el usuario actualizado y validar cambios
    # Precondicion: crear y actualizar usuario
    Given path 'user'
    And request createPayload
    When method post
    Then status 200

    Given path 'user', userData.username
    When method get
    Then status 200
    * def userId = response.id

    * def updatePayload =
    """
    {
      "id": #(userId),
      "username": "#(userData.username)",
      "firstName": "#(userData.updatedFirstName)",
      "lastName": "#(userData.updatedLastName)",
      "email": "#(userData.updatedEmail)",
      "password": "#(userData.password)",
      "phone": "#(userData.phone)",
      "userStatus": #(userData.userStatus)
    }
    """
    Given path 'user', userData.username
    And request updatePayload
    When method put
    Then status 200

    # ENTRADA: GET /user/{username} despues de la actualizacion
    Given path 'user', userData.username
    When method get
    Then status 200
    And match response.username == userData.username
    And match response.firstName == userData.updatedFirstName
    And match response.lastName == userData.updatedLastName
    And match response.email == userData.updatedEmail
    * karate.log('SALIDA - Cambios confirmados en GET:', response)
