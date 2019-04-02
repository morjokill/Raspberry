package ru.itis.exception;

/**
 * Throw this exception when you need to interrupt play() method
 */
public class StopPlayingException extends Exception {
    public StopPlayingException(String message) {
        super(message);
    }

    public StopPlayingException(String message, Throwable cause) {
        super(message, cause);
    }
}
