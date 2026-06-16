package starter.ui;

import net.serenitybdd.screenplay.targets.Target;

public class CartPage {
    public static final Target PLACE_ORDER_BUTTON = Target.the("Place Order button")
            .locatedBy("//button[text()='Place Order']");

    public static final Target PRODUCT_IN_CART = Target.the("Product '{0}' in cart table")
            .locatedBy("//tbody[@id='tbodyid']//td[2][text()='{0}']");
}
