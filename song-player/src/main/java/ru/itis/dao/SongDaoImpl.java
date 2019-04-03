package ru.itis.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import ru.itis.config.DaoConfig;
import ru.itis.model.Note;
import ru.itis.model.Song;
import ru.itis.model.Sound;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class SongDaoImpl implements SongDao {
    private JdbcTemplate jdbcTemplate;

    private static final String SQL_GET_ALL_SONGS = "SELECT song.id as song_id, song.name as song_name, note.name as note_name,  " +
            "note.duration as note_duration, sound.delay as sound_delay " +
            "FROM song INNER JOIN sound on song.id = sound.song_id INNER JOIN note on sound.note = note.name;";

    public SongDaoImpl() {
        this.jdbcTemplate = new JdbcTemplate(DaoConfig.getDataSource());
    }

    @Override
    public List<Song> getSongs() {
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(SQL_GET_ALL_SONGS);

        return mapRowsIntoSongs(rows);
    }

    private List<Song> mapRowsIntoSongs(List<Map<String, Object>> rows) {
        Map<Integer, Song> songs = new HashMap<>();
        for (Map<String, Object> row : rows) {
            Note note = new Note((String) row.get("note_name"), (Integer) row.get("note_duration"));
            Sound sound = new Sound(note, (Integer) row.get("sound_delay"));
            Integer songId = (Integer) row.get("song_id");
            Song song = songs.get(songId);
            if (null == song) {
                String songName = (String) row.get("song_name");
                song = new Song(songId, songName, new LinkedList<>());
                songs.put(songId, song);
            }
            song.getSounds().add(sound);
        }
        return new LinkedList<>(songs.values());
    }

    @Override
    public void saveSong(Song song) {

    }

    @Override
    public void deleteSong(int songId) {

    }

    public static void main(String[] args) {
        SongDao songDao = new SongDaoImpl();
        System.out.println(songDao.getSongs());
    }
}
