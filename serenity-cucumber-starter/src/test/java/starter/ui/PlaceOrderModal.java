package starter.ui;

import net.serenitybdd.screenplay.targets.Target;

public class PlaceOrderModal {
    public static final Target NAME_FIELD = Target.the("Name input field")
            .locatedBy("id:name");

    public static final Target COUNTRY_FIELD = Target.the("Country input field")
            .locatedBy("id:country");

    public static final Target CITY_FIELD = Target.the("City input field")
            .locatedBy("id:city");

    public static final Target CARD_FIELD = Target.the("Credit Card input field")
            .locatedBy("id:card");

    public static final Target MONTH_FIELD = Target.the("Month input field")
            .locatedBy("id:month");

    public static final Target YEAR_FIELD = Target.the("Year input field")
            .locatedBy("id:year");

    public static final Target PURCHASE_BUTTON = Target.the("Purchase button")
            .locatedBy("//button[text()='Purchase']");
}
