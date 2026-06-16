package starter.tasks;

import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.waits.WaitUntil;
import starter.interactions.AcceptAlert;
import starter.ui.HeaderNavigation;
import starter.ui.ProductDetailPage;
import starter.ui.ProductList;

import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isVisible;

public class AddProduct implements Task {

    private final String productName;

    public AddProduct(String productName) {
        this.productName = productName;
    }

    public static AddProduct named(String productName) {
        return Tasks.instrumented(AddProduct.class, productName);
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        actor.attemptsTo(
                WaitUntil.the(ProductList.PRODUCT_BY_NAME.of(productName), isVisible()).forNoMoreThan(10).seconds(),
                Click.on(ProductList.PRODUCT_BY_NAME.of(productName)),
                WaitUntil.the(ProductDetailPage.ADD_TO_CART_BUTTON, isVisible()).forNoMoreThan(10).seconds(),
                Click.on(ProductDetailPage.ADD_TO_CART_BUTTON),
                AcceptAlert.accept(),
                Click.on(HeaderNavigation.HOME_LINK)
        );
    }
}
