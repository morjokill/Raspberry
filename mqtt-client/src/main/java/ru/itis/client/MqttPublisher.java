package ru.itis.client;

import org.eclipse.paho.client.mqttv3.*;

import java.util.UUID;

public class MqttPublisher {
    private static final String PUBLISHER_ID = UUID.randomUUID().toString();
    private String address;
    private String topic;
    private IMqttClient client;

    public MqttPublisher(String address, String topic) throws MqttException {
        this.address = address;
        this.topic = topic;
        initClient();
    }

    private void initClient() throws MqttException {
        this.client = new MqttClient(address, PUBLISHER_ID);
        connectToMqtt();
    }

    private void connectToMqtt() throws MqttException {
        MqttConnectOptions options = new MqttConnectOptions();
        options.setAutomaticReconnect(true);
        options.setCleanSession(true);
        options.setConnectionTimeout(10);
        client.connect(options);
    }

    public void publishMsg(byte[] payloadToPublish) throws Exception {
        if (!client.isConnected()) {
            throw new Exception("Client is not connected");
        }
        MqttMessage msg = new MqttMessage(payloadToPublish);
        msg.setQos(0);
        msg.setRetained(true);
        client.publish(topic, msg);
    }

    public static void main(String[] args) throws Exception {
        MqttPublisher publisher = new MqttPublisher("tcp://localhost:1883", "TOPIC");
        publisher.publishMsg(new byte[]{35, 23, 89, 23});
    }
}
