package ru.itis.client;

import org.eclipse.paho.client.mqttv3.IMqttClient;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import ru.itis.Main;

import java.util.UUID;

public class SimpleMqttClient {
    private static final String PUBLISHER_ID = UUID.randomUUID().toString();
    private String address;
    private String topic;
    private IMqttClient client;

    public SimpleMqttClient(String address, String topic) throws MqttException {
        this.address = address;
        this.topic = topic;
        initClient();
    }

    private void initClient() throws MqttException {
        this.client = new MqttClient(address, PUBLISHER_ID);
        connectToMqtt();
        executeReceiveTask();
    }

    private void connectToMqtt() throws MqttException {
        MqttConnectOptions options = new MqttConnectOptions();
        options.setCleanSession(true);
        options.setAutomaticReconnect(true);
        options.setConnectionTimeout(10);
        client.connect(options);
    }

    private void executeReceiveTask() throws MqttException {
        client.subscribe(topic, (topic, msg) -> {
            System.out.println("Message came: " + msg);
            Main.isPlaying = !Main.isPlaying;
            System.out.println("Is song playing now:" + Main.isPlaying);
        });
    }
}
