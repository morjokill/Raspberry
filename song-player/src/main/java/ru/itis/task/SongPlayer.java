package ru.itis.task;

import com.pi4j.io.gpio.PinState;
import ru.itis.Main;
import ru.itis.dao.SongDao;
import ru.itis.model.Note;
import ru.itis.model.Song;
import ru.itis.model.Sound;

import static com.pi4j.wiringpi.Gpio.delay;
import static com.pi4j.wiringpi.Gpio.delayMicroseconds;

public class SongPlayer implements Runnable {
    public static final String DELAY = "DELAY";
    private volatile Song currentSong;
    private SongDao songDao;

    public SongPlayer(SongDao songDao) {
        this.songDao = songDao;
    }

    @Override
    public void run() {
        while (true) {
            Song localSong = getCurrentSong();
            for (Sound sound : localSong.getSounds()) {
                if (localSong.equals(getCurrentSong())) {
                    while (!Main.isPlaying) {
                        //wait for play
                    }
                    playSound(sound);
                } else {
                    break;
                }
            }
        }
    }

    private void playSound(Sound sound) {
        //This is delay note.
        Note note = sound.getNote();
        int soundDelay = sound.getDelay();
        if (note.getName().equals(DELAY)) {
            delay(soundDelay);
            return;
        }

        //This is the semiperiod of each note.
        long beepDelay = (long) (1000000 / note.getDuration());
        //This is how much time we need to spend on the note.
        long time = (soundDelay * 1000) / (beepDelay * 2);
        for (int i = 0; i < time; i++) {
            //1st semiperiod
            Main.output.setState(PinState.HIGH);
            delayMicroseconds(beepDelay);
            //2nd semiperiod
            Main.output.setState(PinState.LOW);
            delayMicroseconds(beepDelay);
        }

        //Add a little delay to separate the single sounds
        Main.output.setState(PinState.LOW);
        delay(20);
    }

    public Song getCurrentSong() {
        return currentSong;
    }

    private synchronized void setCurrentSong(Song currentSong) {
        this.currentSong = currentSong;
    }

    public void setCurrentSong(int songId) {
        setCurrentSong(songDao.getSongById(songId));
    }
}
