package starter.ui;

import net.serenitybdd.screenplay.targets.Target;

public class HeaderNavigation {
    public static final Target HOME_LINK = Target.the("Home link")
            .locatedBy("//a[contains(text(),'Home')]");
            
    public static final Target CART_LINK = Target.the("Cart link")
            .locatedBy("id:cartur");
}
