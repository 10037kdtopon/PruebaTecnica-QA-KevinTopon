package starter.ui;

import net.serenitybdd.screenplay.targets.Target;

public class ProductDetailPage {
    public static final Target ADD_TO_CART_BUTTON = Target.the("Add to cart button")
            .locatedBy("//a[text()='Add to cart']");
}
