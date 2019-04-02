package ru.itis;

import java.util.Map;

public class Command implements Map.Entry {
    private int note;
    private int duration;


    public Command(int note, int duration) {
        this.note = note;
        this.duration = duration;
    }

    @Override
    public Object getKey() {
        return note;
    }

    @Override
    public Object getValue() {
        return duration;
    }

    @Override
    public Object setValue(Object o) {
        this.duration = (Integer) o;
        return this;
    }
}
