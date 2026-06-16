package starter.stepdefinitions;

import io.cucumber.java.en.*;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.actors.OnStage;
import net.serenitybdd.screenplay.ensure.Ensure;
import net.serenitybdd.screenplay.waits.WaitUntil;
import starter.navigation.NavigateTo;
import starter.tasks.AddProduct;
import starter.tasks.CompletePurchase;
import starter.ui.CartPage;
import starter.ui.ConfirmationDialog;
import starter.ui.HeaderNavigation;

import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isVisible;

public class DemoblazeStepDefinitions {

    @Given("que el usuario abre Demoblaze")
    public void abrirDemoblaze() {
        OnStage.theActorCalled("Usuario").wasAbleTo(NavigateTo.theHomePage());
    }

    @When("agrega dos productos al carrito")
    public void agregarProductos() {
        OnStage.theActorInTheSpotlight().attemptsTo(
                AddProduct.named("Samsung galaxy s6"),
                AddProduct.named("Nokia lumia 1520")
        );
    }

    @And("visualiza el carrito")
    public void visualizarCarrito() {
        OnStage.theActorInTheSpotlight().attemptsTo(
                Click.on(HeaderNavigation.CART_LINK),
                WaitUntil.the(CartPage.PRODUCT_IN_CART.of("Samsung galaxy s6"), isVisible()).forNoMoreThan(10).seconds(),
                WaitUntil.the(CartPage.PRODUCT_IN_CART.of("Nokia lumia 1520"), isVisible()).forNoMoreThan(10).seconds(),
                Ensure.that(CartPage.PRODUCT_IN_CART.of("Samsung galaxy s6")).isDisplayed(),
                Ensure.that(CartPage.PRODUCT_IN_CART.of("Nokia lumia 1520")).isDisplayed()
        );
    }

    @And("completa el formulario de compra")
    public void completarFormulario() {
        OnStage.theActorInTheSpotlight().attemptsTo(
                CompletePurchase.withDetails()
                        .name("Juan Perez")
                        .country("Ecuador")
                        .city("Quito")
                        .card("1234567890123456")
                        .month("12")
                        .year("2026")
                        .build()
        );
    }

    @Then("la compra se realiza exitosamente")
    public void compraExitosa() {
        OnStage.theActorInTheSpotlight().attemptsTo(
                WaitUntil.the(ConfirmationDialog.CONFIRMATION_HEADER, isVisible()).forNoMoreThan(10).seconds(),
                Ensure.that(ConfirmationDialog.CONFIRMATION_HEADER).isDisplayed(),
                Click.on(ConfirmationDialog.OK_BUTTON)
        );
    }
}