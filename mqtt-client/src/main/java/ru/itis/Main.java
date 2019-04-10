package ru.itis;

import com.pi4j.io.gpio.*;
import com.pi4j.io.gpio.event.GpioPinListenerDigital;
import org.eclipse.paho.client.mqttv3.MqttException;
import ru.itis.client.MqttPublisher;

public class Main {
    private static GpioController controller;
    private static GpioPinDigitalInput input;
    private static MqttPublisher publisher;

    public static void main(String[] args) throws MqttException {
        initGpio();
        addInputListener();

        publisher = new MqttPublisher("tcp://localhost:1883", "TOPIC");
        while (true) {
        }
    }

    private static void addInputListener() {
        System.out.println("Adding listener for claps");
        input.addListener((GpioPinListenerDigital) event -> {
            try {
                if (event.getState().isHigh()) {
                    System.out.println("*Clap*.");
                    System.out.println(" --> GPIO PIN STATE CHANGE: " + event.getPin() + " = "
                            + event.getState());
                    publisher.publishMsg(new byte[]{1});
                }
            } catch (Exception e) {
                System.out.println("Input is broken: " + e + " Will try again until it works");
            }
        });
        System.out.println("Added listener for claps. You can clap now");
    }

    private static void initGpio() {
        System.out.println("Initializing controller");
        controller = GpioFactory.getInstance();

        System.out.println("Initializing input");
        createInput(RaspiPin.GPIO_00, "Microphone");

        System.out.println("Setting shutdown options");
        input.setShutdownOptions(true);
    }

    private static void createInput(Pin pinNumber, String name) {
        input = controller.provisionDigitalInputPin(pinNumber, name, PinPullResistance.PULL_DOWN);
    }
}
