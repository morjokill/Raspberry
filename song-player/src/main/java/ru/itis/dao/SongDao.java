package ru.itis.dao;

import ru.itis.model.Song;

import java.util.List;

public interface SongDao {
    List<Song> getSongs();

    void saveSong(Song song);

    void deleteSong(int songId);

    Song getSongById(int songId);
}
