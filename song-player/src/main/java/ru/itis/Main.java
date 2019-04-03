package ru.itis;

import com.pi4j.io.gpio.*;
import ru.itis.client.SimpleMqttClient;
import ru.itis.config.Application;
import ru.itis.dao.SongDao;
import ru.itis.dao.SongDaoImpl;
import ru.itis.task.SongPlayer;

/**
 * Main class for raspberry input output
 * Playing imperial march on input signal
 */
public class Main {
    public static SongPlayer songPlayer;
    public static SongDao songDao;
    private static int PORT = 7878;
    public static volatile Boolean isPlaying = false;
    private static GpioController controller;
    public static GpioPinDigitalOutput output;

    /**
     * Start method
     *
     * @param args Input arguments from console
     */
    public static void main(String[] args) throws Exception {
        initGpio();

        songDao = new SongDaoImpl();

        songPlayer = new SongPlayer(songDao);

        songPlayer.setCurrentSong(1);

        Thread play = new Thread(songPlayer);
        play.start();

        new SimpleMqttClient("tcp://localhost:1883", "TOPIC");

        Application.start(PORT);

        while (true) {
        }
    }

    /**
     * Initialization of controller and input output
     * Setting shutdown options
     */
    private static void initGpio() {
        System.out.println("Initializing controller");
        controller = GpioFactory.getInstance();

        System.out.println("Initializing output");
        createOutput(RaspiPin.GPIO_07, "Buzzer");

        System.out.println("Setting shutdown options");
        output.setShutdownOptions(true);
    }

    /**
     * Create output realization for controller
     *
     * @param pinNumber pin number
     * @param name      output realization name
     */
    private static void createOutput(Pin pinNumber, String name) {
        output = controller.provisionDigitalOutputPin(pinNumber, name, PinState.LOW);
    }
}
