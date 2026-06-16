@smoke @user @e2e @lifecycle
Feature: PetStore API - Ciclo de vida completo del usuario (E2E)
  Ejercicio QA Junior: flujo secuencial Create -> Read -> Update -> Read -> Delete
  Documentacion API: https://petstore.swagger.io/

  Background:
    * url baseUrl
    * def userData = call read('classpath:api/helpers/generate-user.js')
    * def createPayload = userData.createPayload
    * karate.log('=== INICIO E2E | Username de prueba:', userData.username, '===')

  Scenario: Flujo CRUD completo de usuario en PetStore
    # ------------------------------------------------------------------
    # PASO 1: CREAR USUARIO
    # Endpoint: POST /user
    # Entrada:  JSON con username, firstName, lastName, email, password, phone, userStatus
    # Salida:   { "code": 200, "type": "unknown", "message": "<id_generado>" }
    # ------------------------------------------------------------------
    Given path 'user'
    And request createPayload
    When method post
    Then status 200
    And match response contains { code: '#number', type: '#string', message: '#string' }
    And match response.code == 200
    * karate.log('[PASO 1 OK] Usuario creado:', userData.username, '| ID:', response.message)

    # ------------------------------------------------------------------
    # PASO 2: BUSCAR USUARIO CREADO
    # Endpoint: GET /user/{username}
    # Entrada:  username en path
    # Salida:   objeto User completo
    # ------------------------------------------------------------------
    Given path 'user', userData.username
    When method get
    Then status 200
    And match response contains { id: '#number', username: '#string', email: '#string' }
    And match response.username == userData.username
    And match response.email == userData.email
    And match response.firstName == userData.firstName
    And match response.lastName == userData.lastName
    * def userId = response.id
    * karate.log('[PASO 2 OK] Usuario encontrado. ID asignado:', userId)

    # ------------------------------------------------------------------
    # PASO 3: ACTUALIZAR NOMBRE Y CORREO
    # Endpoint: PUT /user/{username}
    # Entrada:  JSON con firstName, lastName y email modificados + id del servidor
    # Salida:   { "code": 200, "type": "unknown", "message": "<id>" }
    # ------------------------------------------------------------------
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
    And match response.code == 200
    * karate.log('[PASO 3 OK] Nombre y email actualizados')

    # ------------------------------------------------------------------
    # PASO 4: BUSCAR USUARIO ACTUALIZADO
    # Endpoint: GET /user/{username}
    # Entrada:  mismo username
    # Salida:   User con datos actualizados
    # ------------------------------------------------------------------
    Given path 'user', userData.username
    When method get
    Then status 200
    And match response.firstName == userData.updatedFirstName
    And match response.lastName == userData.updatedLastName
    And match response.email == userData.updatedEmail
    And match response.username == userData.username
    * karate.log('[PASO 4 OK] Usuario actualizado verificado:', response)

    # ------------------------------------------------------------------
    # PASO 5: ELIMINAR USUARIO
    # Endpoint: DELETE /user/{username}
    # Entrada:  username en path
    # Salida:   { "code": 200, "type": "unknown", "message": "<id o username>" }
    # ------------------------------------------------------------------
    Given path 'user', userData.username
    When method delete
    Then status 200
    And match response.code == 200
    * karate.log('[PASO 5 OK] Usuario eliminado')

    # Verificacion adicional: usuario inexistente retorna 404
    Given path 'user', userData.username
    When method get
    Then status 404
    * karate.log('[E2E COMPLETO] Ciclo CRUD finalizado exitosamente')
