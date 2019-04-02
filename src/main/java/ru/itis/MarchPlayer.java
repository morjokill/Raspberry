package ru.itis;

import com.pi4j.io.gpio.PinState;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.pi4j.wiringpi.Gpio.delay;
import static com.pi4j.wiringpi.Gpio.delayMicroseconds;
import static ru.itis.NoteConstants.*;

public class MarchPlayer implements Runnable {
    private List<Map.Entry<Integer, Integer>> command;

    @Override
    public void run() {
        command = new ArrayList<Map.Entry<Integer, Integer>>();
        command.add(new Command(a, 500));
        command.add(new Command(a, 500));
        command.add(new Command(f, 350));
        command.add(new Command(cH, 150));

        command.add(new Command(a, 500));
        command.add(new Command(f, 350));
        command.add(new Command(cH, 150));
        command.add(new Command(a, 1000));
        command.add(new Command(eH, 500));

        command.add(new Command(eH, 500));
        command.add(new Command(eH, 500));
        command.add(new Command(fH, 350));
        command.add(new Command(cH, 150));
        command.add(new Command(gS, 500));

        command.add(new Command(f, 350));
        command.add(new Command(cH, 150));
        command.add(new Command(a, 1000));
        command.add(new Command(aH, 500));
        command.add(new Command(a, 350));

        command.add(new Command(a, 150));
        command.add(new Command(aH, 500));
        command.add(new Command(gHS, 250));
        command.add(new Command(gH, 250));
        command.add(new Command(fHS, 125));

        command.add(new Command(fH, 125));
        command.add(new Command(fHS, 250));

        command.add(new Command(0, 250));

        command.add(new Command(aS, 250));
        command.add(new Command(dHS, 500));
        command.add(new Command(dH, 250));
        command.add(new Command(cHS, 250));
        command.add(new Command(cH, 125));

        command.add(new Command(b, 125));
        command.add(new Command(cH, 250));

        command.add(new Command(0, 250));

        command.add(new Command(f, 125));
        command.add(new Command(gS, 500));
        command.add(new Command(f, 375));
        command.add(new Command(a, 125));
        command.add(new Command(cH, 500));

        command.add(new Command(a, 375));
        command.add(new Command(cH, 125));
        command.add(new Command(eH, 1000));
        command.add(new Command(aH, 500));
        command.add(new Command(a, 350));

        command.add(new Command(a, 150));
        command.add(new Command(aH, 500));
        command.add(new Command(gHS, 250));
        command.add(new Command(gH, 250));
        command.add(new Command(fHS, 125));

        command.add(new Command(fH, 125));
        command.add(new Command(fHS, 250));

        command.add(new Command(0, 250));

        command.add(new Command(aS, 250));
        command.add(new Command(dHS, 500));
        command.add(new Command(dH, 250));
        command.add(new Command(cHS, 250));
        command.add(new Command(cH, 125));

        command.add(new Command(b, 125));
        command.add(new Command(cH, 250));

        command.add(new Command(0, 250));

        command.add(new Command(f, 250));
        command.add(new Command(gS, 500));
        command.add(new Command(f, 375));
        command.add(new Command(cH, 125));
        command.add(new Command(a, 500));

        command.add(new Command(f, 375));
        command.add(new Command(c, 125));
        command.add(new Command(a, 1000));

        while (true) {
            for (Map.Entry<Integer, Integer> entry : command) {
                if (Main.isPlaying) {

                    if (entry.getKey() == 0) {
                        delay(entry.getValue());
                        continue;
                    }

                    //This is the semiperiod of each note.
                    long beepDelay = (long) (1000000 / entry.getKey());
                    //This is how much time we need to spend on the note.
                    long time = (entry.getValue() * 1000) / (beepDelay * 2);
                    for (int i = 0; i < time; i++) {
                        //1st semiperiod
                        Main.output.setState(PinState.HIGH);
                        delayMicroseconds(beepDelay);
                        //2nd semiperiod
                        Main.output.setState(PinState.LOW);
                        delayMicroseconds(beepDelay);
                    }

                    //Add a little delay to separate the single notes
                    Main.output.setState(PinState.LOW);
                    delay(20);
                }
            }
        }
    }
}
