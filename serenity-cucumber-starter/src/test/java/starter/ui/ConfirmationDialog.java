package starter.ui;

import net.serenitybdd.screenplay.targets.Target;

public class ConfirmationDialog {
    public static final Target CONFIRMATION_HEADER = Target.the("Confirmation header 'Thank you for your purchase!'")
            .locatedBy("//h2[text()='Thank you for your purchase!']");

    public static final Target OK_BUTTON = Target.the("OK confirmation button")
            .locatedBy("//button[contains(@class,'confirm') and text()='OK']");
}
