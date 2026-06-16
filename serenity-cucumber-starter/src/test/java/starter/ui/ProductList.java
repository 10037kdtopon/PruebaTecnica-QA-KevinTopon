package starter.ui;

import net.serenitybdd.screenplay.targets.Target;

public class ProductList {
    public static final Target PRODUCT_BY_NAME = Target.the("Product link for {0}")
            .locatedBy("//a[@class='hrefch' and text()='{0}']");
}
