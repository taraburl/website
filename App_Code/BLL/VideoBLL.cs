﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class VideoBLL
{
    public VideoBLL()
    {

    }
    public static List<Video> SelectTop5()
    {
        VideoDSTableAdapters.tbl_videoTableAdapter adapter
            = new VideoDSTableAdapters.tbl_videoTableAdapter();
        VideoDS.tbl_videoDataTable table = adapter.SelectTop5();
        List<Video> listVideo = new List<Video>();
        foreach (VideoDS.tbl_videoRow row in table)
        {
            listVideo.Add(RowToDto(row));
        }
        return listVideo;
    }
    public static List<Video> SelectTop1()
    {
        VideoDSTableAdapters.tbl_videoTableAdapter adapter
            = new VideoDSTableAdapters.tbl_videoTableAdapter();
        VideoDS.tbl_videoDataTable table = adapter.SelectTop1();
        List<Video> listVideo = new List<Video>();
        foreach (VideoDS.tbl_videoRow row in table)
        {
            listVideo.Add(RowToDto(row));
        }
        return listVideo;
    }
    public static List<Video> SelectByModulo(string modulo)
    {
        VideoDSTableAdapters.tbl_videoTableAdapter adapter
            = new VideoDSTableAdapters.tbl_videoTableAdapter();
        VideoDS.tbl_videoDataTable table = adapter.selectByModulo(modulo);
        List<Video> listVideo = new List<Video>();
        foreach (VideoDS.tbl_videoRow row in table)
        {
            listVideo.Add(RowToDto(row));
        }
        return listVideo;
    }
    public static Video InsertWithReturn(string url, string descripcion, string modulo)
    {
        VideoDSTableAdapters.tbl_videoTableAdapter adapter
            = new VideoDSTableAdapters.tbl_videoTableAdapter();
        VideoDS.tbl_videoDataTable table = adapter.InsertWithReturn(url, descripcion, modulo, 0);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static Video SelectById(int id)
    {
        VideoDSTableAdapters.tbl_videoTableAdapter adapter
            = new VideoDSTableAdapters.tbl_videoTableAdapter();
        VideoDS.tbl_videoDataTable table = adapter.selectById(id);
        if (table.Rows.Count == 0)
        {
            return null;
        }
        return RowToDto(table[0]);
    }
    public static void Update(string url, string descripcion, string modulo, int id)
    {
        VideoDSTableAdapters.tbl_videoTableAdapter adapter
            = new VideoDSTableAdapters.tbl_videoTableAdapter();
        adapter.updateById(url, modulo, descripcion, 0, id, id);
    }
    public static void Delete(int id)
    {
        VideoDSTableAdapters.tbl_videoTableAdapter adapter
            = new VideoDSTableAdapters.tbl_videoTableAdapter();
        adapter.deleteRow(id);
    }
    private static Video RowToDto(VideoDS.tbl_videoRow row)
    {
        Video objVideo = new Video();
        objVideo.IdVideo = row.id;
        objVideo.URL = row.url;
        objVideo.Descripcion = row.descripcion;
        objVideo.Modulo = row.modulo;
        objVideo.Eliminado = row.eliminado;
        return objVideo;
    }
}