package ru.itis;

import com.pi4j.io.gpio.*;
import com.pi4j.io.gpio.event.GpioPinDigitalStateChangeEvent;
import com.pi4j.io.gpio.event.GpioPinListenerDigital;

import static com.pi4j.wiringpi.Gpio.delay;
import static com.pi4j.wiringpi.Gpio.delayMicroseconds;
import static ru.itis.NoteConstants.*;

public class Main {
    private static volatile Boolean isPlaying = false;

    public static void main(String[] args) throws InterruptedException {
        System.out.println("Initializing controller");
        final GpioController controller = GpioFactory.getInstance();

        System.out.println("Initializing input");
        GpioPinDigitalInput input = controller.provisionDigitalInputPin(RaspiPin.GPIO_00,             // PIN NUMBER
                "Microphone",                   // PIN FRIENDLY NAME (optional)
                PinPullResistance.PULL_DOWN); // PIN RESISTANCE (optional)

        System.out.println("Initializing output");
        final GpioPinDigitalOutput output = controller.provisionDigitalOutputPin(RaspiPin.GPIO_07,   // PIN NUMBER
                "Buzzer",           // PIN FRIENDLY NAME (optional)
                PinState.LOW);      // PIN STARTUP STATE (optional)

        output.setShutdownOptions(true);
        input.setShutdownOptions(true);

        System.out.println("Adding listener for claps");
        input.addListener(new GpioPinListenerDigital() {
            public void handleGpioPinDigitalStateChangeEvent(GpioPinDigitalStateChangeEvent event) {
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
                            play(output);
                        }
                    }
                }
            }
        });

        System.out.println("Added listener for claps. Nursil can clap now");

        while (true) {
            Thread.sleep(10000);
        }
    }

    private static void beep(int note, int duration, GpioPinDigitalOutput output) throws Exception {
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
                throw new Exception("Stop playing");
            }
        }
    }

    private static void play(GpioPinDigitalOutput output) {
        System.out.println("In play method. isPlaying: " + isPlaying);
        try {
            beep(a, 500, output);
            beep(a, 500, output);
            beep(f, 350, output);
            beep(cH, 150, output);

            beep(a, 500, output);
            beep(f, 350, output);
            beep(cH, 150, output);
            beep(a, 1000, output);
            beep(eH, 500, output);

            beep(eH, 500, output);
            beep(eH, 500, output);
            beep(fH, 350, output);
            beep(cH, 150, output);
            beep(gS, 500, output);

            beep(f, 350, output);
            beep(cH, 150, output);
            beep(a, 1000, output);
            beep(aH, 500, output);
            beep(a, 350, output);

            beep(a, 150, output);
            beep(aH, 500, output);
            beep(gHS, 250, output);
            beep(gH, 250, output);
            beep(fHS, 125, output);

            beep(fH, 125, output);
            beep(fHS, 250, output);

            delay(250);

            beep(aS, 250, output);
            beep(dHS, 500, output);
            beep(dH, 250, output);
            beep(cHS, 250, output);
            beep(cH, 125, output);

            beep(b, 125, output);
            beep(cH, 250, output);

            delay(250);

            beep(f, 125, output);
            beep(gS, 500, output);
            beep(f, 375, output);
            beep(a, 125, output);
            beep(cH, 500, output);

            beep(a, 375, output);
            beep(cH, 125, output);
            beep(eH, 1000, output);
            beep(aH, 500, output);
            beep(a, 350, output);

            beep(a, 150, output);
            beep(aH, 500, output);
            beep(gHS, 250, output);
            beep(gH, 250, output);
            beep(fHS, 125, output);

            beep(fH, 125, output);
            beep(fHS, 250, output);

            delay(250);

            beep(aS, 250, output);
            beep(dHS, 500, output);
            beep(dH, 250, output);
            beep(cHS, 250, output);
            beep(cH, 125, output);

            beep(b, 125, output);
            beep(cH, 250, output);

            delay(250);

            beep(f, 250, output);
            beep(gS, 500, output);
            beep(f, 375, output);
            beep(cH, 125, output);
            beep(a, 500, output);

            beep(f, 375, output);
            beep(c, 125, output);
            beep(a, 1000, output);
        } catch (Exception e) {
            System.out.println("Caught the exception. Nursil clapped again. isPlaying: " + isPlaying);
            System.out.println("Stopping playing: " + e);
        }
    }
}
