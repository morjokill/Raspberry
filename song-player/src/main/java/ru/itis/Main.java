package ru.itis;

import com.pi4j.io.gpio.*;
import ru.itis.client.SimpleMqttClient;
import ru.itis.config.Application;
import ru.itis.dao.SongDao;
import ru.itis.dao.SongDaoImpl;
import ru.itis.task.SongPlayer;

public class Main {
    public static SongPlayer songPlayer;
    public static SongDao songDao;
    private static int PORT = 7878;
    public static volatile Boolean isPlaying = false;
    private static GpioController controller;
    public static GpioPinDigitalOutput output;

    public static void main(String[] args) throws Exception {
        initGpio();

        songDao = new SongDaoImpl();

        songPlayer = new SongPlayer(songDao);

        Thread play = new Thread(songPlayer);
        play.start();

        new SimpleMqttClient("tcp://localhost:1883", "TOPIC");

        Application.start(PORT);

        while (true) {
        }
    }

    private static void initGpio() {
        System.out.println("Initializing controller");
        controller = GpioFactory.getInstance();

        System.out.println("Initializing output");
        createOutput(RaspiPin.GPIO_07, "Buzzer");

        System.out.println("Setting shutdown options");
        output.setShutdownOptions(true);
    }

    private static void createOutput(Pin pinNumber, String name) {
        output = controller.provisionDigitalOutputPin(pinNumber, name, PinState.LOW);
    }
}
