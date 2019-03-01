package ru.itis;

import com.pi4j.io.gpio.*;
import com.pi4j.io.gpio.event.GpioPinDigitalStateChangeEvent;
import com.pi4j.io.gpio.event.GpioPinListenerDigital;

public class Main {
    public static void main(String[] args) {
        final GpioController controller = GpioFactory.getInstance();

        GpioPinDigitalInput input = controller.provisionDigitalInputPin(RaspiPin.GPIO_00,             // PIN NUMBER
                "Microphone",                   // PIN FRIENDLY NAME (optional)
                PinPullResistance.PULL_DOWN); // PIN RESISTANCE (optional)

        final GpioPinDigitalOutput output = controller.provisionDigitalOutputPin(RaspiPin.GPIO_07,   // PIN NUMBER
                "Buzzer",           // PIN FRIENDLY NAME (optional)
                PinState.LOW);      // PIN STARTUP STATE (optional)

        input.addListener(new GpioPinListenerDigital() {
            public void handleGpioPinDigitalStateChangeEvent(GpioPinDigitalStateChangeEvent event) {
                System.out.println(" --> GPIO PIN STATE CHANGE: " + event.getPin() + " = "
                        + event.getState());
                output.pulse(1000);
            }
        });

        output.setShutdownOptions(true, PinState.LOW, PinPullResistance.OFF);
        input.setShutdownOptions(true, PinState.LOW, PinPullResistance.OFF);
    }
}
