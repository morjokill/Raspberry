package ru.itis;

import com.pi4j.io.gpio.*;
import com.pi4j.io.gpio.event.GpioPinDigitalStateChangeEvent;
import com.pi4j.io.gpio.event.GpioPinListenerDigital;

import static com.pi4j.wiringpi.Gpio.delay;
import static com.pi4j.wiringpi.Gpio.delayMicroseconds;
import static ru.itis.NoteConstants.*;

/**
 * Main class for raspberry input output
 * Playing imperial march on input signal
 */
public class Main {
    private static volatile Boolean isPlaying = false;
    private static GpioController controller;
    private static GpioPinDigitalInput input;
    private static GpioPinDigitalOutput output;

    /**
     * Start method
     * @param args Input arguments from console
     */
    public static void main(String[] args) {
        initGpio();

        addInputListener();

        try {
            while (true) {
                Thread.sleep(10000);
            }
        } catch (InterruptedException ie) {
            System.out.println("Main thread interrupted: " + ie + " Exiting the program");
            System.exit(0);
        }
    }

    /**
     * Add input listener for microphone. Starting play method on signal
     */
    private static void addInputListener() {
        System.out.println("Adding listener for claps");
        input.addListener(new GpioPinListenerDigital() {
            public void handleGpioPinDigitalStateChangeEvent(GpioPinDigitalStateChangeEvent event) {
                try {
                    if (event.getState().isHigh()) {
                        synchronized (isPlaying) {
                            System.out.println("Nursil clapped. Flag isPlaying is: " + isPlaying);
                            System.out.println(" --> GPIO PIN STATE CHANGE: " + event.getPin() + " = "
                                    + event.getState());

                            if (isPlaying) {
                                isPlaying = false;
                                System.out.println("Making flag false");
                            } else {
                                System.out.println("Making flag true");
                                isPlaying = true;
                                System.out.println("Starting to play march");
                                play();
                            }
                        }
                    }
                } catch (Exception e) {
                    System.out.println("Input is broken: " + e + " Will try again until it works");
                }
            }
        });
        System.out.println("Added listener for claps. Nursil can clap now");
    }

    /**
     * Initialization of controller and input output
     * Setting shutdown options
     */
    private static void initGpio() {
        System.out.println("Initializing controller");
        controller = GpioFactory.getInstance();

        System.out.println("Initializing input");
        createInput(RaspiPin.GPIO_00, "Microphone");

        System.out.println("Initializing output");
        createOutput(RaspiPin.GPIO_07, "Buzzer");

        System.out.println("Setting shutdown options");
        output.setShutdownOptions(true);
        input.setShutdownOptions(true);
    }

    /**
     * Create input realization for controller
     * @param pinNumber pin number
     * @param name input realization name
     */
    private static void createInput(Pin pinNumber, String name) {
        input = controller.provisionDigitalInputPin(pinNumber, name, PinPullResistance.PULL_DOWN);
    }

    /**
     * Create output realization for controller
     * @param pinNumber pin number
     * @param name output realization name
     */
    private static void createOutput(Pin pinNumber, String name) {
        output = controller.provisionDigitalOutputPin(pinNumber, name, PinState.LOW);
    }

    /**
     * Send signal with a certain duration to output
     * @param note note value
     * @param duration duration of each note
     * @throws Exception Could throw StopPlayingException when need to interrupt play() method
     * Could throw general Exception when output is broken
     */
    private static void beep(int note, int duration) throws Exception {
        synchronized (isPlaying) {
            System.out.println("Little beep. Note: " + note + " duration: " + duration + " isPlaying: " + isPlaying);
            if (isPlaying) {
                //This is the semiperiod of each note.
                long beepDelay = (long) (1000000 / note);
                //This is how much time we need to spend on the note.
                long time = (duration * 1000) / (beepDelay * 2);
                for (int i = 0; i < time; i++) {
                    //1st semiperiod
                    output.setState(PinState.HIGH);
                    delayMicroseconds(beepDelay);
                    //2nd semiperiod
                    output.setState(PinState.LOW);
                    delayMicroseconds(beepDelay);
                }

                //Add a little delay to separate the single notes
                output.setState(PinState.LOW);
                delay(20);
            } else {
                System.out.println("isPlaying is false. Stop playing");
                throw new StopPlayingException("Stop playing");
            }
        }
    }

    /**
     * Play imperial march
     */
    private static void play() {
        System.out.println("In play method. isPlaying: " + isPlaying);
        try {
            beep(a, 500);
            beep(a, 500);
            beep(f, 350);
            beep(cH, 150);

            beep(a, 500);
            beep(f, 350);
            beep(cH, 150);
            beep(a, 1000);
            beep(eH, 500);

            beep(eH, 500);
            beep(eH, 500);
            beep(fH, 350);
            beep(cH, 150);
            beep(gS, 500);

            beep(f, 350);
            beep(cH, 150);
            beep(a, 1000);
            beep(aH, 500);
            beep(a, 350);

            beep(a, 150);
            beep(aH, 500);
            beep(gHS, 250);
            beep(gH, 250);
            beep(fHS, 125);

            beep(fH, 125);
            beep(fHS, 250);

            delay(250);

            beep(aS, 250);
            beep(dHS, 500);
            beep(dH, 250);
            beep(cHS, 250);
            beep(cH, 125);

            beep(b, 125);
            beep(cH, 250);

            delay(250);

            beep(f, 125);
            beep(gS, 500);
            beep(f, 375);
            beep(a, 125);
            beep(cH, 500);

            beep(a, 375);
            beep(cH, 125);
            beep(eH, 1000);
            beep(aH, 500);
            beep(a, 350);

            beep(a, 150);
            beep(aH, 500);
            beep(gHS, 250);
            beep(gH, 250);
            beep(fHS, 125);

            beep(fH, 125);
            beep(fHS, 250);

            delay(250);

            beep(aS, 250);
            beep(dHS, 500);
            beep(dH, 250);
            beep(cHS, 250);
            beep(cH, 125);

            beep(b, 125);
            beep(cH, 250);

            delay(250);

            beep(f, 250);
            beep(gS, 500);
            beep(f, 375);
            beep(cH, 125);
            beep(a, 500);

            beep(f, 375);
            beep(c, 125);
            beep(a, 1000);
        } catch (StopPlayingException spe) {
            System.out.println("Caught the exception. Nursil clapped again. isPlaying: " + isPlaying);
            System.out.println("Stopping playing: " + spe);
        } catch (Exception e) {
            System.out.println("Caught the exception: " + e);
        }
    }
}
