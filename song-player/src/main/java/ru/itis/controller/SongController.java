package ru.itis.controller;

import ru.itis.Main;
import ru.itis.dao.SongDao;
import ru.itis.model.web.SongsResponse;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
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
        return Response.status(200).entity(new SongsResponse(Main.songPlayer.getCurrentSong().getId(), songDao.getSongs())).build();
    }

    @POST
    @Path("/songs")
    public Response changeCurrentSong(int currentSongId) {
        Main.songPlayer.setCurrentSong(currentSongId);
        return Response.status(200).entity(currentSongId).build();
    }
}
