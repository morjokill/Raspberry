package ru.itis.controller;

import ru.itis.Main;
import ru.itis.dao.SongDao;
import ru.itis.model.Song;
import ru.itis.model.web.SongsResponse;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;

@Path("/")
@Produces("application/json; charset=utf-8")
public class SongController {
    private SongDao songDao;

    public SongController(SongDao songDao) {
        this.songDao = songDao;
    }

    @GET
    @Path("/")
    public String hi() {
        return "Русские вперед!";
    }

    @GET
    @Path("/songs")
    public Response getSongs() {
        int currentSongId;
        Song currentSong = Main.songPlayer.getCurrentSong();
        if (null != currentSong) {
            currentSongId = currentSong.getId();
        } else {
            currentSongId = 0;
        }
        return Response.status(200).entity(new SongsResponse(currentSongId, songDao.getSongs())).build();
    }

    @POST
    @Path("/post")
    public Response changeCurrentSong(int currentSongId) {
        System.out.println("CurrentSongId from post: " + currentSongId);
        Main.songPlayer.setCurrentSong(currentSongId);
        return Response.status(200).entity(currentSongId).build();
    }
}
