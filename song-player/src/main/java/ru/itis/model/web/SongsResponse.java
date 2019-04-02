package ru.itis.model.web;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import ru.itis.model.Song;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class SongsResponse {
    private int currentSong;
    private List<Song> songs;
}
