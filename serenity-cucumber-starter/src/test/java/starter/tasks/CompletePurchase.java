package starter.tasks;

import net.serenitybdd.screenplay.Actor;
import net.serenitybdd.screenplay.Task;
import net.serenitybdd.screenplay.Tasks;
import net.serenitybdd.screenplay.actions.Click;
import net.serenitybdd.screenplay.actions.Enter;
import net.serenitybdd.screenplay.waits.WaitUntil;
import starter.ui.CartPage;
import starter.ui.PlaceOrderModal;

import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isVisible;

public class CompletePurchase implements Task {

    private final String name;
    private final String country;
    private final String city;
    private final String card;
    private final String month;
    private final String year;

    public CompletePurchase(String name, String country, String city, String card, String month, String year) {
        this.name = name;
        this.country = country;
        this.city = city;
        this.card = card;
        this.month = month;
        this.year = year;
    }

    public static CompletePurchaseBuilder withDetails() {
        return new CompletePurchaseBuilder();
    }

    @Override
    public <T extends Actor> void performAs(T actor) {
        actor.attemptsTo(
                Click.on(CartPage.PLACE_ORDER_BUTTON),
                WaitUntil.the(PlaceOrderModal.NAME_FIELD, isVisible()).forNoMoreThan(10).seconds(),
                Enter.theValue(name).into(PlaceOrderModal.NAME_FIELD),
                Enter.theValue(country).into(PlaceOrderModal.COUNTRY_FIELD),
                Enter.theValue(city).into(PlaceOrderModal.CITY_FIELD),
                Enter.theValue(card).into(PlaceOrderModal.CARD_FIELD),
                Enter.theValue(month).into(PlaceOrderModal.MONTH_FIELD),
                Enter.theValue(year).into(PlaceOrderModal.YEAR_FIELD),
                Click.on(PlaceOrderModal.PURCHASE_BUTTON)
        );
    }

    public static class CompletePurchaseBuilder {
        private String name = "Juan Perez";
        private String country = "Ecuador";
        private String city = "Quito";
        private String card = "1234567890123456";
        private String month = "12";
        private String year = "2026";

        public CompletePurchaseBuilder name(String name) {
            this.name = name;
            return this;
        }

        public CompletePurchaseBuilder country(String country) {
            this.country = country;
            return this;
        }

        public CompletePurchaseBuilder city(String city) {
            this.city = city;
            return this;
        }

        public CompletePurchaseBuilder card(String card) {
            this.card = card;
            return this;
        }

        public CompletePurchaseBuilder month(String month) {
            this.month = month;
            return this;
        }

        public CompletePurchaseBuilder year(String year) {
            this.year = year;
            return this;
        }

        public CompletePurchase build() {
            return Tasks.instrumented(CompletePurchase.class, name, country, city, card, month, year);
        }
    }
}
