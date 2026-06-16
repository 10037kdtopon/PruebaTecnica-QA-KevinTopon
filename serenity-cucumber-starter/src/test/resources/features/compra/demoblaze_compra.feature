Feature: Compra en Demoblaze

  Scenario: Compra exitosa de dos productos

    Given que el usuario abre Demoblaze
    When agrega dos productos al carrito
    And visualiza el carrito
    And completa el formulario de compra
    Then la compra se realiza exitosamente