package ru.itis.task;

import com.pi4j.io.gpio.PinState;
import ru.itis.Main;
import ru.itis.dao.SongDao;
import ru.itis.model.Note;
import ru.itis.model.Song;
import ru.itis.model.Sound;

import java.util.List;

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
        System.out.println("Running song player thread");
        while (true) {
            Song localSong = getCurrentSong();
            if (localSong == currentSong && localSong != null) {
                for (Sound sound : localSong.getSounds()) {
                    System.out.println("This sound: " + sound);
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
    }

    private void playSound(Sound sound) {
        System.out.println("Playing sound: " + sound);

        Note note = sound.getNote();
        int soundDelay = sound.getDelay();
        if (note.getName().equals(DELAY)) {
            delay(soundDelay);
            return;
        }

        //Semiperiod of each note.
        long beepDelay = (long) (1000000 / note.getDuration());
        //Time needed to spend on the note.
        long time = (soundDelay * 1000) / (beepDelay * 2);
        for (int i = 0; i < time; i++) {
            //1st semiperiod
            Main.output.setState(PinState.HIGH);
            delayMicroseconds(beepDelay);
            //2nd semiperiod
            Main.output.setState(PinState.LOW);
            delayMicroseconds(beepDelay);
        }

        //Delay to separate the single sounds
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
        List<Song> songsFromDb = songDao.getSongs();
        Song songFromDb = songsFromDb.get(songId - 1);
        if (null != songFromDb) {
            System.out.println("Song from database: " + songFromDb.getName());
            setCurrentSong(songFromDb);
        } else {
            System.out.println("Song from database is NULL");
        }
    }
}
