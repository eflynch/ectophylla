{
    "patcher" :     {
        "fileversion" : 1,
        "appversion" :      {
            "major" : 7,
            "minor" : 0,
            "revision" : 3,
            "architecture" : "x86",
            "modernui" : 1
        }
,
        "rect" : [ 703.0, 79.0, 795.0, 933.0 ],
        "bglocked" : 0,
        "openinpresentation" : 0,
        "default_fontsize" : 12.0,
        "default_fontface" : 0,
        "default_fontname" : "Arial",
        "gridonopen" : 1,
        "gridsize" : [ 15.0, 15.0 ],
        "gridsnaponopen" : 1,
        "objectsnaponopen" : 1,
        "statusbarvisible" : 2,
        "toolbarvisible" : 1,
        "lefttoolbarpinned" : 0,
        "toptoolbarpinned" : 0,
        "righttoolbarpinned" : 0,
        "bottomtoolbarpinned" : 0,
        "toolbars_unpinned_last_save" : 0,
        "tallnewobj" : 0,
        "boxanimatetime" : 200,
        "enablehscroll" : 1,
        "enablevscroll" : 1,
        "devicewidth" : 0.0,
        "description" : "",
        "digest" : "",
        "tags" : "",
        "style" : "",
        "subpatcher_template" : "",
        "boxes" : [             {
                "box" :                 {
                    "id" : "obj-134",
                    "maxclass" : "message",
                    "numinlets" : 2,
                    "numoutlets" : 1,
                    "outlettype" : [ "" ],
                    "patching_rect" : [ 344.75, 311.0, 29.5, 22.0 ],
                    "style" : "",
                    "text" : "10"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-131",
                    "maxclass" : "message",
                    "numinlets" : 2,
                    "numoutlets" : 1,
                    "outlettype" : [ "" ],
                    "patching_rect" : [ 307.0, 311.0, 29.5, 22.0 ],
                    "style" : "",
                    "text" : "0"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-127",
                    "maxclass" : "message",
                    "numinlets" : 2,
                    "numoutlets" : 1,
                    "outlettype" : [ "" ],
                    "patching_rect" : [ 344.75, 368.5, 54.0, 22.0 ],
                    "style" : "",
                    "text" : "$1 1000"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-125",
                    "maxclass" : "newobj",
                    "numinlets" : 2,
                    "numoutlets" : 2,
                    "outlettype" : [ "signal", "bang" ],
                    "patching_rect" : [ 344.75, 413.0, 36.0, 22.0 ],
                    "style" : "",
                    "text" : "line~"
                }

            }
,           {
                "box" :                 {
                    "fontface" : 0,
                    "fontname" : "Arial",
                    "fontsize" : 12.0,
                    "id" : "obj-123",
                    "interval" : 20.0,
                    "maxclass" : "number~",
                    "mode" : 2,
                    "numinlets" : 2,
                    "numoutlets" : 2,
                    "outlettype" : [ "signal", "float" ],
                    "patching_rect" : [ 344.75, 454.0, 56.0, 22.0 ],
                    "sig" : 0.0,
                    "style" : ""
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-116",
                    "maxclass" : "message",
                    "numinlets" : 2,
                    "numoutlets" : 1,
                    "outlettype" : [ "" ],
                    "patching_rect" : [ 381.75, 496.0, 51.0, 22.0 ],
                    "style" : "",
                    "text" : "0. 1. $1"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-110",
                    "linecount" : 18,
                    "maxclass" : "comment",
                    "numinlets" : 1,
                    "numoutlets" : 0,
                    "patching_rect" : [ 588.0, 255.5, 187.0, 248.0 ],
                    "style" : "",
                    "text" : "Main Thing\n--- generates music\n--- renders music\n--- drives the audio thing\n\nDisplay Thing\n--- tells the main thing what is nearby\n--- tells the main thing where the camera is\n--- renders the stuff for the main thing in openGL\n\n\nAudio Thing\n--- just sends messages to the synth (camera location, notes with locations)"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-83",
                    "maxclass" : "ezdac~",
                    "numinlets" : 2,
                    "numoutlets" : 0,
                    "patching_rect" : [ 55.75, 736.0, 45.0, 45.0 ],
                    "style" : ""
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-81",
                    "maxclass" : "newobj",
                    "numinlets" : 8,
                    "numoutlets" : 2,
                    "outlettype" : [ "signal", "signal" ],
                    "patcher" :                     {
                        "fileversion" : 1,
                        "appversion" :                      {
                            "major" : 7,
                            "minor" : 0,
                            "revision" : 3,
                            "architecture" : "x86",
                            "modernui" : 1
                        }
,
                        "rect" : [ 869.0, 174.0, 640.0, 480.0 ],
                        "bglocked" : 0,
                        "openinpresentation" : 0,
                        "default_fontsize" : 12.0,
                        "default_fontface" : 0,
                        "default_fontname" : "Arial",
                        "gridonopen" : 1,
                        "gridsize" : [ 15.0, 15.0 ],
                        "gridsnaponopen" : 1,
                        "objectsnaponopen" : 1,
                        "statusbarvisible" : 2,
                        "toolbarvisible" : 1,
                        "lefttoolbarpinned" : 0,
                        "toptoolbarpinned" : 0,
                        "righttoolbarpinned" : 0,
                        "bottomtoolbarpinned" : 0,
                        "toolbars_unpinned_last_save" : 0,
                        "tallnewobj" : 0,
                        "boxanimatetime" : 200,
                        "enablehscroll" : 1,
                        "enablevscroll" : 1,
                        "devicewidth" : 0.0,
                        "description" : "",
                        "digest" : "",
                        "tags" : "",
                        "style" : "",
                        "subpatcher_template" : "",
                        "boxes" : [                             {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-15",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 396.25, 14.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-14",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "float" ],
                                    "patching_rect" : [ 545.0, 320.0, 43.0, 22.0 ],
                                    "style" : "",
                                    "text" : "hoa.pi"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-13",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "bang" ],
                                    "patching_rect" : [ 545.0, 287.0, 60.0, 22.0 ],
                                    "style" : "",
                                    "text" : "loadbang"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-9",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "float" ],
                                    "patching_rect" : [ 416.0, 324.0, 41.0, 22.0 ],
                                    "style" : "",
                                    "text" : "/ 180."
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-8",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "float" ],
                                    "patching_rect" : [ 416.0, 282.0, 29.5, 22.0 ],
                                    "style" : "",
                                    "text" : "* 1."
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-12",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 213.425598, 407.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-11",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 173.0, 407.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-10",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "", "" ],
                                    "patching_rect" : [ 268.166077, 136.5, 74.0, 22.0 ],
                                    "style" : "",
                                    "text" : "patcherargs"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-7",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patching_rect" : [ 203.0, 118.0, 29.0, 29.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-6",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patching_rect" : [ 188.0, 103.0, 29.0, 29.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-5",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patching_rect" : [ 173.0, 88.0, 29.0, 29.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-4",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patching_rect" : [ 158.0, 73.0, 29.0, 29.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-3",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patching_rect" : [ 143.0, 58.0, 29.0, 29.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-2",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patching_rect" : [ 128.0, 43.0, 29.0, 29.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-1",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patching_rect" : [ 113.0, 28.0, 29.0, 29.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-42",
                                    "maxclass" : "comment",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 433.5, 160.0, 77.0, 20.0 ],
                                    "style" : "",
                                    "text" : "player/angle"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-22",
                                    "maxclass" : "message",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 384.5, 136.5, 47.0, 22.0 ],
                                    "style" : "",
                                    "text" : "$1 100"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-32",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "signal", "bang" ],
                                    "patching_rect" : [ 384.5, 160.0, 36.0, 22.0 ],
                                    "style" : "",
                                    "text" : "line~"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-30",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 3,
                                    "outlettype" : [ "float", "float", "float" ],
                                    "patching_rect" : [ 396.25, 66.0, 69.0, 22.0 ],
                                    "style" : "",
                                    "text" : "unpack f f f"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-27",
                                    "maxclass" : "newobj",
                                    "numinlets" : 8,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "signal", "signal" ],
                                    "patcher" :                                     {
                                        "fileversion" : 1,
                                        "appversion" :                                      {
                                            "major" : 7,
                                            "minor" : 0,
                                            "revision" : 3,
                                            "architecture" : "x86",
                                            "modernui" : 1
                                        }
,
                                        "rect" : [ 184.0, 203.0, 790.0, 617.0 ],
                                        "bglocked" : 0,
                                        "openinpresentation" : 0,
                                        "default_fontsize" : 12.0,
                                        "default_fontface" : 0,
                                        "default_fontname" : "Arial",
                                        "gridonopen" : 1,
                                        "gridsize" : [ 15.0, 15.0 ],
                                        "gridsnaponopen" : 1,
                                        "objectsnaponopen" : 1,
                                        "statusbarvisible" : 2,
                                        "toolbarvisible" : 1,
                                        "lefttoolbarpinned" : 0,
                                        "toptoolbarpinned" : 0,
                                        "righttoolbarpinned" : 0,
                                        "bottomtoolbarpinned" : 0,
                                        "toolbars_unpinned_last_save" : 0,
                                        "tallnewobj" : 0,
                                        "boxanimatetime" : 200,
                                        "enablehscroll" : 1,
                                        "enablevscroll" : 1,
                                        "devicewidth" : 0.0,
                                        "description" : "",
                                        "digest" : "",
                                        "tags" : "",
                                        "style" : "",
                                        "subpatcher_template" : "",
                                        "boxes" : [                                             {
                                                "box" :                                                 {
                                                    "id" : "obj-47",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 7,
                                                    "numoutlets" : 2,
                                                    "outlettype" : [ "signal", "signal" ],
                                                    "patcher" :                                                     {
                                                        "fileversion" : 1,
                                                        "appversion" :                                                      {
                                                            "major" : 7,
                                                            "minor" : 0,
                                                            "revision" : 3,
                                                            "architecture" : "x86",
                                                            "modernui" : 1
                                                        }
,
                                                        "rect" : [ 59.0, 104.0, 640.0, 480.0 ],
                                                        "bglocked" : 0,
                                                        "openinpresentation" : 0,
                                                        "default_fontsize" : 12.0,
                                                        "default_fontface" : 0,
                                                        "default_fontname" : "Arial",
                                                        "gridonopen" : 1,
                                                        "gridsize" : [ 15.0, 15.0 ],
                                                        "gridsnaponopen" : 1,
                                                        "objectsnaponopen" : 1,
                                                        "statusbarvisible" : 2,
                                                        "toolbarvisible" : 1,
                                                        "lefttoolbarpinned" : 0,
                                                        "toptoolbarpinned" : 0,
                                                        "righttoolbarpinned" : 0,
                                                        "bottomtoolbarpinned" : 0,
                                                        "toolbars_unpinned_last_save" : 0,
                                                        "tallnewobj" : 0,
                                                        "boxanimatetime" : 200,
                                                        "enablehscroll" : 1,
                                                        "enablevscroll" : 1,
                                                        "devicewidth" : 0.0,
                                                        "description" : "",
                                                        "digest" : "",
                                                        "tags" : "",
                                                        "style" : "",
                                                        "subpatcher_template" : "",
                                                        "boxes" : [                                                             {
                                                                "box" :                                                                 {
                                                                    "fontface" : 0,
                                                                    "fontname" : "Arial",
                                                                    "fontsize" : 12.0,
                                                                    "id" : "obj-11",
                                                                    "maxclass" : "newobj",
                                                                    "numinlets" : 7,
                                                                    "numoutlets" : 2,
                                                                    "outlettype" : [ "signal", "signal" ],
                                                                    "patching_rect" : [ 50.0, 100.0, 380.0, 22.0 ],
                                                                    "saved_object_attributes" :                                                                     {
                                                                        "angles" : [ 90.0, 270.0 ],
                                                                        "autoconnect" : 0,
                                                                        "channels" : 2,
                                                                        "loudspeakers" : 2,
                                                                        "mode" : "binaural",
                                                                        "pinnaesize" : "large",
                                                                        "restitution" : "panning",
                                                                        "ychannels" : 2,
                                                                        "zchannels" : [ 90.0, 270.0 ]
                                                                    }
,
                                                                    "style" : "",
                                                                    "text" : "hoa.decoder~ 3 @mode binaural @pinnaesize large @autoconnect 0"
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-35",
                                                                    "maxclass" : "inlet",
                                                                    "numinlets" : 0,
                                                                    "numoutlets" : 1,
                                                                    "outlettype" : [ "signal" ],
                                                                    "patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-37",
                                                                    "maxclass" : "inlet",
                                                                    "numinlets" : 0,
                                                                    "numoutlets" : 1,
                                                                    "outlettype" : [ "signal" ],
                                                                    "patching_rect" : [ 90.0, 40.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-38",
                                                                    "maxclass" : "inlet",
                                                                    "numinlets" : 0,
                                                                    "numoutlets" : 1,
                                                                    "outlettype" : [ "signal" ],
                                                                    "patching_rect" : [ 131.0, 40.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-39",
                                                                    "maxclass" : "inlet",
                                                                    "numinlets" : 0,
                                                                    "numoutlets" : 1,
                                                                    "outlettype" : [ "signal" ],
                                                                    "patching_rect" : [ 172.0, 40.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-42",
                                                                    "maxclass" : "inlet",
                                                                    "numinlets" : 0,
                                                                    "numoutlets" : 1,
                                                                    "outlettype" : [ "signal" ],
                                                                    "patching_rect" : [ 213.0, 40.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-43",
                                                                    "maxclass" : "inlet",
                                                                    "numinlets" : 0,
                                                                    "numoutlets" : 1,
                                                                    "outlettype" : [ "signal" ],
                                                                    "patching_rect" : [ 254.0, 40.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-44",
                                                                    "maxclass" : "inlet",
                                                                    "numinlets" : 0,
                                                                    "numoutlets" : 1,
                                                                    "outlettype" : [ "signal" ],
                                                                    "patching_rect" : [ 295.0, 40.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-45",
                                                                    "maxclass" : "outlet",
                                                                    "numinlets" : 1,
                                                                    "numoutlets" : 0,
                                                                    "patching_rect" : [ 55.285767, 269.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
,                                                           {
                                                                "box" :                                                                 {
                                                                    "comment" : "",
                                                                    "id" : "obj-46",
                                                                    "maxclass" : "outlet",
                                                                    "numinlets" : 1,
                                                                    "numoutlets" : 0,
                                                                    "patching_rect" : [ 411.0, 251.0, 30.0, 30.0 ],
                                                                    "style" : ""
                                                                }

                                                            }
 ],
                                                        "lines" : [                                                             {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-45", 0 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-11", 0 ]
                                                                }

                                                            }
,                                                           {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-46", 0 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-11", 1 ]
                                                                }

                                                            }
,                                                           {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-11", 0 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-35", 0 ]
                                                                }

                                                            }
,                                                           {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-11", 1 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-37", 0 ]
                                                                }

                                                            }
,                                                           {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-11", 2 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-38", 0 ]
                                                                }

                                                            }
,                                                           {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-11", 3 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-39", 0 ]
                                                                }

                                                            }
,                                                           {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-11", 4 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-42", 0 ]
                                                                }

                                                            }
,                                                           {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-11", 5 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-43", 0 ]
                                                                }

                                                            }
,                                                           {
                                                                "patchline" :                                                               {
                                                                    "destination" : [ "obj-11", 6 ],
                                                                    "disabled" : 0,
                                                                    "hidden" : 0,
                                                                    "source" : [ "obj-44", 0 ]
                                                                }

                                                            }
 ]
                                                    }
,
                                                    "patching_rect" : [ 145.857086, 318.0, 82.0, 22.0 ],
                                                    "saved_object_attributes" :                                                     {
                                                        "description" : "",
                                                        "digest" : "",
                                                        "globalpatchername" : "",
                                                        "style" : "",
                                                        "tags" : ""
                                                    }
,
                                                    "style" : "",
                                                    "text" : "p binaural"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-36",
                                                    "maxclass" : "comment",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 36.0, 127.0, 115.0, 20.0 ],
                                                    "style" : "",
                                                    "text" : "give a bit of a boost"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-31",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 534.142822, 127.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "*~ 2."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-33",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 471.142822, 127.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "*~ 2."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-34",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 408.142822, 127.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "*~ 2."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-7",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 345.142822, 127.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "*~ 2."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-8",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 282.142853, 127.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "*~ 2."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-6",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 219.142853, 127.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "*~ 2."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-5",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 156.142853, 127.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "*~ 2."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-30",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "" ],
                                                    "patching_rect" : [ 596.142822, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-28",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "signal", "signal", "signal" ],
                                                    "patching_rect" : [ 502.142822, 196.0, 51.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "gate~ 3"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-29",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 534.142822, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-26",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "signal", "signal", "signal" ],
                                                    "patching_rect" : [ 439.142822, 196.0, 51.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "gate~ 3"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-27",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 471.142822, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-24",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "signal", "signal", "signal" ],
                                                    "patching_rect" : [ 376.142822, 196.0, 51.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "gate~ 3"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-25",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 408.142822, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-22",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "signal", "signal", "signal" ],
                                                    "patching_rect" : [ 313.142853, 196.0, 51.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "gate~ 3"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-23",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 345.142822, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-20",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "signal", "signal", "signal" ],
                                                    "patching_rect" : [ 250.142853, 196.0, 51.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "gate~ 3"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-21",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 282.142853, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-18",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "signal", "signal", "signal" ],
                                                    "patching_rect" : [ 187.142853, 196.0, 51.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "gate~ 3"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-19",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 219.142853, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-17",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "signal", "signal", "signal" ],
                                                    "patching_rect" : [ 124.142853, 196.0, 51.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "gate~ 3"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-10",
                                                    "maxclass" : "outlet",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 141.285645, 563.5, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-9",
                                                    "maxclass" : "outlet",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 65.714233, 563.5, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-1",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 156.142853, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
 ],
                                        "lines" : [                                             {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-5", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-1", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-47", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-17", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-47", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-18", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-6", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-19", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-47", 2 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-20", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-8", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-21", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-47", 3 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-22", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-7", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-23", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-47", 4 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-24", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-34", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-25", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-47", 5 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-26", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-33", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-27", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-47", 6 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-28", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-31", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-29", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-17", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-30", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-18", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-30", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-20", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-30", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-22", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-30", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-24", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-30", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-26", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-30", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-28", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-30", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-28", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-31", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-26", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-33", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-24", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-34", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-10", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-47", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-9", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-47", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-17", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-5", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-18", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-6", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-22", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-7", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-20", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-8", 0 ]
                                                }

                                            }
 ]
                                    }
,
                                    "patching_rect" : [ 79.629761, 239.0, 163.795837, 22.0 ],
                                    "saved_object_attributes" :                                     {
                                        "description" : "",
                                        "digest" : "",
                                        "globalpatchername" : "",
                                        "style" : "",
                                        "tags" : ""
                                    }
,
                                    "style" : "",
                                    "text" : "p decode"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-28",
                                    "maxclass" : "newobj",
                                    "numinlets" : 8,
                                    "numoutlets" : 7,
                                    "outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                                    "patching_rect" : [ 80.740479, 172.0, 92.5, 22.0 ],
                                    "style" : "",
                                    "text" : "hoa.rotate~ 3"
                                }

                            }
 ],
                        "lines" : [                             {
                                "patchline" :                               {
                                    "destination" : [ "obj-28", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-1", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 7 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-10", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-14", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-13", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-8", 1 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-14", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-30", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-15", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-28", 1 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-2", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-32", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-22", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-11", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-27", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-12", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-27", 1 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 6 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-28", 6 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 5 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-28", 5 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 4 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-28", 4 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 3 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-28", 3 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 2 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-28", 2 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 1 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-28", 1 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-28", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-28", 2 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-3", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-8", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-30", 2 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-28", 7 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-32", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-28", 3 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-4", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-28", 4 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-5", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-28", 5 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-6", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-28", 6 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-7", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-9", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-8", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-22", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-9", 0 ]
                                }

                            }
 ]
                    }
,
                    "patching_rect" : [ 51.75, 606.0, 189.0, 22.0 ],
                    "saved_object_attributes" :                     {
                        "description" : "",
                        "digest" : "",
                        "globalpatchername" : "",
                        "style" : "",
                        "tags" : ""
                    }
,
                    "style" : "",
                    "text" : "p decoder"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-60",
                    "maxclass" : "message",
                    "numinlets" : 2,
                    "numoutlets" : 1,
                    "outlettype" : [ "" ],
                    "patching_rect" : [ 231.75, 209.0, 249.0, 22.0 ],
                    "style" : "",
                    "text" : "352.41 0.074152 0.583733 -0.808553"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-58",
                    "maxclass" : "message",
                    "numinlets" : 2,
                    "numoutlets" : 1,
                    "outlettype" : [ "" ],
                    "patching_rect" : [ 498.0, 204.0, 182.0, 22.0 ],
                    "style" : "",
                    "text" : "-0.03191 -0.563922 -3.59107"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-56",
                    "maxclass" : "newobj",
                    "numinlets" : 3,
                    "numoutlets" : 3,
                    "outlettype" : [ "", "", "" ],
                    "patching_rect" : [ 231.75, 124.0, 117.0, 22.0 ],
                    "style" : "",
                    "text" : "route rotate position"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-52",
                    "maxclass" : "newobj",
                    "numinlets" : 3,
                    "numoutlets" : 7,
                    "outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                    "patcher" :                     {
                        "fileversion" : 1,
                        "appversion" :                      {
                            "major" : 7,
                            "minor" : 0,
                            "revision" : 3,
                            "architecture" : "x86",
                            "modernui" : 1
                        }
,
                        "rect" : [ 128.0, 120.0, 640.0, 480.0 ],
                        "bglocked" : 0,
                        "openinpresentation" : 0,
                        "default_fontsize" : 12.0,
                        "default_fontface" : 0,
                        "default_fontname" : "Arial",
                        "gridonopen" : 1,
                        "gridsize" : [ 15.0, 15.0 ],
                        "gridsnaponopen" : 1,
                        "objectsnaponopen" : 1,
                        "statusbarvisible" : 2,
                        "toolbarvisible" : 1,
                        "lefttoolbarpinned" : 0,
                        "toptoolbarpinned" : 0,
                        "righttoolbarpinned" : 0,
                        "bottomtoolbarpinned" : 0,
                        "toolbars_unpinned_last_save" : 0,
                        "tallnewobj" : 0,
                        "boxanimatetime" : 200,
                        "enablehscroll" : 1,
                        "enablevscroll" : 1,
                        "devicewidth" : 0.0,
                        "description" : "",
                        "digest" : "",
                        "tags" : "",
                        "style" : "",
                        "subpatcher_template" : "",
                        "boxes" : [                             {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-12",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 302.5, 393.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-11",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 254.5, 393.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-10",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 206.0, 393.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-9",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 162.142822, 393.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-8",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 119.142822, 393.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-7",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 82.142822, 393.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-6",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 50.142822, 393.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-5",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 45.0, 19.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-2",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 260.0, 19.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-1",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 170.0, 19.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-51",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "bang" ],
                                    "patching_rect" : [ 243.5, 189.0, 60.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 633.5, 634.0, 60.0, 22.0 ],
                                    "style" : "",
                                    "text" : "loadbang"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-48",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 174.0, 100.0, 73.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 564.0, 545.0, 73.0, 22.0 ],
                                    "style" : "",
                                    "text" : "prepend init"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-47",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 260.0, 100.0, 104.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 650.0, 545.0, 104.0, 22.0 ],
                                    "style" : "",
                                    "text" : "prepend translate"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-46",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patcher" :                                     {
                                        "fileversion" : 1,
                                        "appversion" :                                      {
                                            "major" : 7,
                                            "minor" : 0,
                                            "revision" : 3,
                                            "architecture" : "x86",
                                            "modernui" : 1
                                        }
,
                                        "rect" : [ 84.0, 129.0, 640.0, 480.0 ],
                                        "bglocked" : 0,
                                        "openinpresentation" : 0,
                                        "default_fontsize" : 12.0,
                                        "default_fontface" : 0,
                                        "default_fontname" : "Arial",
                                        "gridonopen" : 1,
                                        "gridsize" : [ 15.0, 15.0 ],
                                        "gridsnaponopen" : 1,
                                        "objectsnaponopen" : 1,
                                        "statusbarvisible" : 2,
                                        "toolbarvisible" : 1,
                                        "lefttoolbarpinned" : 0,
                                        "toptoolbarpinned" : 0,
                                        "righttoolbarpinned" : 0,
                                        "bottomtoolbarpinned" : 0,
                                        "toolbars_unpinned_last_save" : 0,
                                        "tallnewobj" : 0,
                                        "boxanimatetime" : 200,
                                        "enablehscroll" : 1,
                                        "enablevscroll" : 1,
                                        "devicewidth" : 0.0,
                                        "description" : "",
                                        "digest" : "",
                                        "tags" : "",
                                        "style" : "",
                                        "subpatcher_template" : "",
                                        "boxes" : [                                             {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-14",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "" ],
                                                    "patching_rect" : [ 139.0, 274.0, 63.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "pack f f"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-13",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 2,
                                                    "outlettype" : [ "float", "float" ],
                                                    "patching_rect" : [ 152.5, 122.0, 63.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "unpack f f"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-12",
                                                    "linecount" : 5,
                                                    "maxclass" : "comment",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 233.0, 153.0, 150.0, 74.0 ],
                                                    "style" : "",
                                                    "text" : "This is just a simple abstraction to keep track of a source's location and translate it (typically using player's position)"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-10",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "float" ],
                                                    "patching_rect" : [ 183.0, 232.0, 32.5, 22.0 ],
                                                    "style" : "",
                                                    "text" : "+ 0."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-9",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "float" ],
                                                    "patching_rect" : [ 139.0, 232.0, 32.5, 22.0 ],
                                                    "style" : "",
                                                    "text" : "+ 0."
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-8",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "bang", "bang", "" ],
                                                    "patching_rect" : [ 125.5, 94.0, 46.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "t b b l"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-7",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 2,
                                                    "outlettype" : [ "float", "float" ],
                                                    "patching_rect" : [ 20.0, 94.0, 63.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "unpack f f"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-6",
                                                    "maxclass" : "outlet",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 139.0, 309.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-5",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "float" ],
                                                    "patching_rect" : [ 64.0, 167.0, 32.5, 22.0 ],
                                                    "style" : "",
                                                    "text" : "f 0"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-4",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "float" ],
                                                    "patching_rect" : [ 20.0, 167.0, 32.5, 22.0 ],
                                                    "style" : "",
                                                    "text" : "f 0"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-3",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 3,
                                                    "numoutlets" : 3,
                                                    "outlettype" : [ "", "", "" ],
                                                    "patching_rect" : [ 82.0, 57.0, 106.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "route init translate"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-1",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "" ],
                                                    "patching_rect" : [ 82.0, 14.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
 ],
                                        "lines" : [                                             {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-3", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-1", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-14", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-10", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-10", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-13", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-9", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-13", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-6", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-14", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-7", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-3", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-8", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-3", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-9", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-4", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-10", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-5", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-4", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-7", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-5", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-7", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-13", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-8", 2 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-4", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-8", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-5", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-8", 1 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-14", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-9", 0 ]
                                                }

                                            }
 ]
                                    }
,
                                    "patching_rect" : [ 174.0, 133.0, 62.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 564.0, 578.0, 62.0, 22.0 ],
                                    "saved_object_attributes" :                                     {
                                        "description" : "",
                                        "digest" : "",
                                        "globalpatchername" : "",
                                        "style" : "",
                                        "tags" : ""
                                    }
,
                                    "style" : "",
                                    "text" : "p location"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-43",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "signal", "bang" ],
                                    "patching_rect" : [ 213.0, 324.0, 36.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 603.0, 769.0, 36.0, 22.0 ],
                                    "style" : "",
                                    "text" : "line~"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-42",
                                    "maxclass" : "message",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 213.0, 289.0, 41.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 603.0, 734.0, 41.0, 22.0 ],
                                    "style" : "",
                                    "text" : "$1 20"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-20",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "float" ],
                                    "patching_rect" : [ 243.5, 221.0, 63.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 633.5, 666.0, 63.0, 22.0 ],
                                    "style" : "",
                                    "text" : "hoa.pi 0.5"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-19",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "float" ],
                                    "patching_rect" : [ 217.0, 253.0, 32.5, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 607.0, 698.0, 32.5, 22.0 ],
                                    "style" : "",
                                    "text" : "- 0."
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-3",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "float", "float" ],
                                    "patching_rect" : [ 174.0, 213.0, 62.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 564.0, 658.0, 62.0, 22.0 ],
                                    "style" : "",
                                    "text" : "cartopol"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-22",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patcher" :                                     {
                                        "fileversion" : 1,
                                        "appversion" :                                      {
                                            "major" : 7,
                                            "minor" : 0,
                                            "revision" : 3,
                                            "architecture" : "x86",
                                            "modernui" : 1
                                        }
,
                                        "rect" : [ 313.0, 296.0, 227.0, 237.0 ],
                                        "bglocked" : 0,
                                        "openinpresentation" : 0,
                                        "default_fontsize" : 12.0,
                                        "default_fontface" : 0,
                                        "default_fontname" : "Arial",
                                        "gridonopen" : 1,
                                        "gridsize" : [ 15.0, 15.0 ],
                                        "gridsnaponopen" : 1,
                                        "objectsnaponopen" : 1,
                                        "statusbarvisible" : 2,
                                        "toolbarvisible" : 1,
                                        "lefttoolbarpinned" : 0,
                                        "toptoolbarpinned" : 0,
                                        "righttoolbarpinned" : 0,
                                        "bottomtoolbarpinned" : 0,
                                        "toolbars_unpinned_last_save" : 0,
                                        "tallnewobj" : 0,
                                        "boxanimatetime" : 200,
                                        "enablehscroll" : 1,
                                        "enablevscroll" : 1,
                                        "devicewidth" : 0.0,
                                        "description" : "",
                                        "digest" : "",
                                        "tags" : "",
                                        "style" : "",
                                        "subpatcher_template" : "",
                                        "boxes" : [                                             {
                                                "box" :                                                 {
                                                    "id" : "obj-43",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 2,
                                                    "outlettype" : [ "signal", "bang" ],
                                                    "patching_rect" : [ 106.0, 136.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "line~"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "id" : "obj-42",
                                                    "maxclass" : "message",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "" ],
                                                    "patching_rect" : [ 106.0, 104.0, 41.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "$1 20"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-12",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "" ],
                                                    "patching_rect" : [ 97.0, 55.0, 99.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "expr 1 / (1 + $f1)"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-4",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 54.5, 151.0, 32.5, 22.0 ],
                                                    "style" : "",
                                                    "text" : "*~"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-3",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "float" ],
                                                    "patching_rect" : [ 97.0, 18.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-2",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "" ],
                                                    "patching_rect" : [ 55.0, 18.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-1",
                                                    "maxclass" : "outlet",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 54.5, 190.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
 ],
                                        "lines" : [                                             {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-42", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-12", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-4", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-2", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-12", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-3", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-1", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-4", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-43", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-42", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-4", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-43", 0 ]
                                                }

                                            }
 ]
                                    }
,
                                    "patching_rect" : [ 50.0, 243.0, 69.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 440.0, 688.0, 69.0, 22.0 ],
                                    "saved_object_attributes" :                                     {
                                        "description" : "",
                                        "digest" : "",
                                        "globalpatchername" : "",
                                        "style" : "",
                                        "tags" : ""
                                    }
,
                                    "style" : "",
                                    "text" : "p distancer"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-17",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "signal" ],
                                    "patcher" :                                     {
                                        "fileversion" : 1,
                                        "appversion" :                                      {
                                            "major" : 7,
                                            "minor" : 0,
                                            "revision" : 3,
                                            "architecture" : "x86",
                                            "modernui" : 1
                                        }
,
                                        "rect" : [ 309.0, 141.0, 325.0, 230.0 ],
                                        "bglocked" : 0,
                                        "openinpresentation" : 0,
                                        "default_fontsize" : 12.0,
                                        "default_fontface" : 0,
                                        "default_fontname" : "Arial",
                                        "gridonopen" : 1,
                                        "gridsize" : [ 15.0, 15.0 ],
                                        "gridsnaponopen" : 1,
                                        "objectsnaponopen" : 1,
                                        "statusbarvisible" : 2,
                                        "toolbarvisible" : 1,
                                        "lefttoolbarpinned" : 0,
                                        "toptoolbarpinned" : 0,
                                        "righttoolbarpinned" : 0,
                                        "bottomtoolbarpinned" : 0,
                                        "toolbars_unpinned_last_save" : 0,
                                        "tallnewobj" : 0,
                                        "boxanimatetime" : 200,
                                        "enablehscroll" : 1,
                                        "enablevscroll" : 1,
                                        "devicewidth" : 0.0,
                                        "description" : "",
                                        "digest" : "",
                                        "tags" : "",
                                        "style" : "",
                                        "subpatcher_template" : "",
                                        "boxes" : [                                             {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-14",
                                                    "linecount" : 2,
                                                    "maxclass" : "comment",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 159.0, 90.0, 156.0, 33.0 ],
                                                    "style" : "",
                                                    "text" : "extra smooth so the pitch shift doesn't jitter"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-12",
                                                    "maxclass" : "message",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "" ],
                                                    "patching_rect" : [ 112.0, 78.0, 47.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "$1 100"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-10",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 2,
                                                    "outlettype" : [ "signal", "bang" ],
                                                    "patching_rect" : [ 112.0, 103.0, 36.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "line~"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-8",
                                                    "linecount" : 2,
                                                    "maxclass" : "comment",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 166.0, 45.0, 94.0, 33.0 ],
                                                    "style" : "",
                                                    "text" : "speed of sound\n(m / ms)"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-6",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "float" ],
                                                    "patching_rect" : [ 112.0, 51.5, 47.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "/ 0.244"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-5",
                                                    "maxclass" : "outlet",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 0,
                                                    "patching_rect" : [ 48.0, 184.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-4",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "float" ],
                                                    "patching_rect" : [ 112.0, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "comment" : "",
                                                    "id" : "obj-3",
                                                    "maxclass" : "inlet",
                                                    "numinlets" : 0,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 48.0, 22.0, 25.0, 25.0 ],
                                                    "style" : ""
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-2",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 1,
                                                    "numoutlets" : 2,
                                                    "outlettype" : [ "signal", "float" ],
                                                    "patching_rect" : [ 112.0, 125.0, 79.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "mstosamps~"
                                                }

                                            }
,                                           {
                                                "box" :                                                 {
                                                    "fontname" : "Arial",
                                                    "fontsize" : 12.0,
                                                    "id" : "obj-1",
                                                    "maxclass" : "newobj",
                                                    "numinlets" : 2,
                                                    "numoutlets" : 1,
                                                    "outlettype" : [ "signal" ],
                                                    "patching_rect" : [ 48.0, 153.0, 83.0, 22.0 ],
                                                    "style" : "",
                                                    "text" : "delay~ 10000"
                                                }

                                            }
 ],
                                        "lines" : [                                             {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-5", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-1", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-2", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-10", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-10", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-12", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-1", 1 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-2", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-1", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-3", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-6", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-4", 0 ]
                                                }

                                            }
,                                           {
                                                "patchline" :                                               {
                                                    "destination" : [ "obj-12", 0 ],
                                                    "disabled" : 0,
                                                    "hidden" : 0,
                                                    "source" : [ "obj-6", 0 ]
                                                }

                                            }
 ]
                                    }
,
                                    "patching_rect" : [ 50.142822, 289.0, 61.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 440.142822, 734.0, 61.0, 22.0 ],
                                    "saved_object_attributes" :                                     {
                                        "description" : "",
                                        "digest" : "",
                                        "globalpatchername" : "",
                                        "style" : "",
                                        "tags" : ""
                                    }
,
                                    "style" : "",
                                    "text" : "p doppler"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontface" : 0,
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-14",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 7,
                                    "outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal", "signal" ],
                                    "patching_rect" : [ 50.142822, 341.0, 94.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 440.142822, 786.0, 94.0, 22.0 ],
                                    "style" : "",
                                    "text" : "hoa.encoder~ 3"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-4",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "float", "float" ],
                                    "patching_rect" : [ 174.0, 164.0, 62.0, 22.0 ],
                                    "presentation" : 1,
                                    "presentation_rect" : [ 564.0, 609.0, 62.0, 22.0 ],
                                    "style" : "",
                                    "text" : "unpack f f"
                                }

                            }
 ],
                        "lines" : [                             {
                                "patchline" :                               {
                                    "destination" : [ "obj-48", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-1", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-10", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-14", 4 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-11", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-14", 5 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-12", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-14", 6 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-6", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-14", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-7", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-14", 1 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-8", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-14", 2 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-9", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-14", 3 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-14", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-17", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-42", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-19", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-47", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-2", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-19", 1 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-20", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-17", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-22", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-17", 1 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-3", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-19", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-3", 1 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-22", 1 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-3", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-3", 1 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-4", 1 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-3", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-4", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-43", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-42", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-14", 1 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-43", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-4", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-46", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-46", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-47", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-46", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-48", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-22", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-5", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-20", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-51", 0 ]
                                }

                            }
 ]
                    }
,
                    "patching_rect" : [ 51.75, 527.0, 164.714279, 22.0 ],
                    "saved_object_attributes" :                     {
                        "description" : "",
                        "digest" : "",
                        "globalpatchername" : "",
                        "style" : "",
                        "tags" : ""
                    }
,
                    "style" : "",
                    "text" : "p spatializer"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-13",
                    "maxclass" : "newobj",
                    "numinlets" : 1,
                    "numoutlets" : 1,
                    "outlettype" : [ "" ],
                    "patcher" :                     {
                        "fileversion" : 1,
                        "appversion" :                      {
                            "major" : 7,
                            "minor" : 0,
                            "revision" : 3,
                            "architecture" : "x86",
                            "modernui" : 1
                        }
,
                        "rect" : [ 359.0, 179.0, 640.0, 480.0 ],
                        "bglocked" : 0,
                        "openinpresentation" : 0,
                        "default_fontsize" : 12.0,
                        "default_fontface" : 0,
                        "default_fontname" : "Arial",
                        "gridonopen" : 1,
                        "gridsize" : [ 15.0, 15.0 ],
                        "gridsnaponopen" : 1,
                        "objectsnaponopen" : 1,
                        "statusbarvisible" : 2,
                        "toolbarvisible" : 1,
                        "lefttoolbarpinned" : 0,
                        "toptoolbarpinned" : 0,
                        "righttoolbarpinned" : 0,
                        "bottomtoolbarpinned" : 0,
                        "toolbars_unpinned_last_save" : 0,
                        "tallnewobj" : 0,
                        "boxanimatetime" : 200,
                        "enablehscroll" : 1,
                        "enablevscroll" : 1,
                        "devicewidth" : 0.0,
                        "description" : "",
                        "digest" : "",
                        "tags" : "",
                        "style" : "",
                        "subpatcher_template" : "",
                        "boxes" : [                             {
                                "box" :                                 {
                                    "id" : "obj-27",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 114.0, 244.0, 97.0, 22.0 ],
                                    "style" : "",
                                    "text" : "prepend moveto"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-24",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "", "" ],
                                    "patching_rect" : [ 46.0, 128.0, 49.0, 22.0 ],
                                    "style" : "",
                                    "text" : "zl iter 3"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-23",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "", "bang" ],
                                    "patching_rect" : [ 46.0, 70.0, 30.0, 22.0 ],
                                    "style" : "",
                                    "text" : "t l b"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-22",
                                    "maxclass" : "inlet",
                                    "numinlets" : 0,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 46.0, 28.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-21",
                                    "maxclass" : "message",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 341.0, 133.0, 37.0, 22.0 ],
                                    "style" : "",
                                    "text" : "reset"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-19",
                                    "maxclass" : "newobj",
                                    "numinlets" : 1,
                                    "numoutlets" : 3,
                                    "outlettype" : [ "bang", "", "bang" ],
                                    "patching_rect" : [ 46.0, 193.0, 40.0, 22.0 ],
                                    "style" : "",
                                    "text" : "t b l b"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-10",
                                    "maxclass" : "message",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 46.0, 244.0, 61.0, 22.0 ],
                                    "style" : "",
                                    "text" : "sphere 1."
                                }

                            }
,                           {
                                "box" :                                 {
                                    "id" : "obj-6",
                                    "maxclass" : "message",
                                    "numinlets" : 2,
                                    "numoutlets" : 1,
                                    "outlettype" : [ "" ],
                                    "patching_rect" : [ 250.0, 244.0, 99.0, 22.0 ],
                                    "style" : "",
                                    "text" : "glcolor 1. 1. 0. 1."
                                }

                            }
,                           {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-4",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 50.0, 362.0, 30.0, 30.0 ],
                                    "style" : ""
                                }

                            }
 ],
                        "lines" : [                             {
                                "patchline" :                               {
                                    "destination" : [ "obj-4", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-10", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-10", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-19", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-27", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-19", 1 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-6", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-19", 2 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-4", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-21", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-23", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-22", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-21", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-23", 1 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-24", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-23", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-19", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-24", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-4", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-27", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-4", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-6", 0 ]
                                }

                            }
 ]
                    }
,
                    "patching_rect" : [ 381.75, 541.0, 53.0, 22.0 ],
                    "saved_object_attributes" :                     {
                        "description" : "",
                        "digest" : "",
                        "globalpatchername" : "",
                        "style" : "",
                        "tags" : ""
                    }
,
                    "style" : "",
                    "text" : "p sfears"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-1",
                    "maxclass" : "newobj",
                    "numinlets" : 1,
                    "numoutlets" : 2,
                    "outlettype" : [ "", "" ],
                    "patching_rect" : [ 381.75, 577.0, 223.0, 22.0 ],
                    "style" : "",
                    "text" : "jit.gl.sketch skch-ctx @lighting_enable 1"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-55",
                    "maxclass" : "comment",
                    "numinlets" : 1,
                    "numoutlets" : 0,
                    "patching_rect" : [ 17.75, 13.0, 150.0, 20.0 ],
                    "style" : "",
                    "text" : "Draw OpenGL:"
                }

            }
,           {
                "box" :                 {
                    "fontname" : "Arial",
                    "fontsize" : 13.0,
                    "id" : "obj-12",
                    "maxclass" : "message",
                    "numinlets" : 2,
                    "numoutlets" : 1,
                    "outlettype" : [ "" ],
                    "patching_rect" : [ 17.75, 221.5, 88.0, 23.0 ],
                    "style" : "",
                    "text" : "fullscreen $1"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-5",
                    "maxclass" : "toggle",
                    "numinlets" : 1,
                    "numoutlets" : 1,
                    "outlettype" : [ "int" ],
                    "parameter_enable" : 0,
                    "patching_rect" : [ 17.75, 191.5, 24.0, 24.0 ],
                    "style" : ""
                }

            }
,           {
                "box" :                 {
                    "fontname" : "Arial",
                    "fontsize" : 13.0,
                    "id" : "obj-6",
                    "maxclass" : "newobj",
                    "numinlets" : 0,
                    "numoutlets" : 1,
                    "outlettype" : [ "bang" ],
                    "patcher" :                     {
                        "fileversion" : 1,
                        "appversion" :                      {
                            "major" : 7,
                            "minor" : 0,
                            "revision" : 3,
                            "architecture" : "x86",
                            "modernui" : 1
                        }
,
                        "rect" : [ 25.0, 69.0, 640.0, 480.0 ],
                        "bglocked" : 0,
                        "openinpresentation" : 0,
                        "default_fontsize" : 12.0,
                        "default_fontface" : 0,
                        "default_fontname" : "Arial",
                        "gridonopen" : 1,
                        "gridsize" : [ 15.0, 15.0 ],
                        "gridsnaponopen" : 1,
                        "objectsnaponopen" : 1,
                        "statusbarvisible" : 2,
                        "toolbarvisible" : 1,
                        "lefttoolbarpinned" : 0,
                        "toptoolbarpinned" : 0,
                        "righttoolbarpinned" : 0,
                        "bottomtoolbarpinned" : 0,
                        "toolbars_unpinned_last_save" : 0,
                        "tallnewobj" : 0,
                        "boxanimatetime" : 200,
                        "enablehscroll" : 1,
                        "enablevscroll" : 1,
                        "devicewidth" : 0.0,
                        "description" : "",
                        "digest" : "",
                        "tags" : "",
                        "style" : "",
                        "subpatcher_template" : "",
                        "boxes" : [                             {
                                "box" :                                 {
                                    "comment" : "",
                                    "id" : "obj-8",
                                    "maxclass" : "outlet",
                                    "numinlets" : 1,
                                    "numoutlets" : 0,
                                    "patching_rect" : [ 284.0, 224.0, 25.0, 25.0 ],
                                    "style" : ""
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-2",
                                    "maxclass" : "newobj",
                                    "numinlets" : 2,
                                    "numoutlets" : 2,
                                    "outlettype" : [ "bang", "" ],
                                    "patching_rect" : [ 284.0, 137.0, 43.0, 20.0 ],
                                    "style" : "",
                                    "text" : "sel 27"
                                }

                            }
,                           {
                                "box" :                                 {
                                    "fontname" : "Arial",
                                    "fontsize" : 12.0,
                                    "id" : "obj-1",
                                    "maxclass" : "newobj",
                                    "numinlets" : 0,
                                    "numoutlets" : 4,
                                    "outlettype" : [ "int", "int", "int", "int" ],
                                    "patching_rect" : [ 284.0, 110.0, 59.5, 20.0 ],
                                    "style" : "",
                                    "text" : "key"
                                }

                            }
 ],
                        "lines" : [                             {
                                "patchline" :                               {
                                    "destination" : [ "obj-2", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-1", 0 ]
                                }

                            }
,                           {
                                "patchline" :                               {
                                    "destination" : [ "obj-8", 0 ],
                                    "disabled" : 0,
                                    "hidden" : 0,
                                    "source" : [ "obj-2", 0 ]
                                }

                            }
 ],
                        "bgfillcolor_type" : "gradient",
                        "bgfillcolor_color1" : [ 0.435294, 0.462745, 0.498039, 1.0 ],
                        "bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
                        "bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
                        "bgfillcolor_angle" : 270.0,
                        "bgfillcolor_proportion" : 0.39
                    }
,
                    "patching_rect" : [ 17.75, 161.5, 43.0, 23.0 ],
                    "saved_object_attributes" :                     {
                        "description" : "",
                        "digest" : "",
                        "globalpatchername" : "",
                        "style" : "",
                        "tags" : ""
                    }
,
                    "style" : "",
                    "text" : "p esc"
                }

            }
,           {
                "box" :                 {
                    "fontface" : 0,
                    "fontname" : "Arial",
                    "fontsize" : 13.0,
                    "id" : "obj-26",
                    "maxclass" : "newobj",
                    "numinlets" : 1,
                    "numoutlets" : 2,
                    "outlettype" : [ "", "" ],
                    "patching_rect" : [ 211.75, 74.5, 264.0, 23.0 ],
                    "style" : "",
                    "text" : "jit.gl.handle skch-ctx @visible 1 @tracking 1"
                }

            }
,           {
                "box" :                 {
                    "fontname" : "Arial",
                    "fontsize" : 13.0,
                    "id" : "obj-11",
                    "maxclass" : "newobj",
                    "numinlets" : 1,
                    "numoutlets" : 2,
                    "outlettype" : [ "bang", "" ],
                    "patching_rect" : [ 17.75, 251.5, 121.0, 23.0 ],
                    "style" : "",
                    "text" : "jit.window skch-ctx"
                }

            }
,           {
                "box" :                 {
                    "fontname" : "Arial",
                    "fontsize" : 13.0,
                    "id" : "obj-10",
                    "maxclass" : "newobj",
                    "numinlets" : 1,
                    "numoutlets" : 2,
                    "outlettype" : [ "bang", "" ],
                    "patching_rect" : [ 17.75, 134.5, 129.0, 23.0 ],
                    "style" : "",
                    "text" : "jit.gl.render skch-ctx"
                }

            }
,           {
                "box" :                 {
                    "fontname" : "Arial",
                    "fontsize" : 13.0,
                    "id" : "obj-9",
                    "maxclass" : "newobj",
                    "numinlets" : 1,
                    "numoutlets" : 2,
                    "outlettype" : [ "bang", "erase" ],
                    "patching_rect" : [ 17.75, 101.5, 63.0, 23.0 ],
                    "style" : "",
                    "text" : "t b erase"
                }

            }
,           {
                "box" :                 {
                    "fontname" : "Arial",
                    "fontsize" : 13.0,
                    "id" : "obj-8",
                    "maxclass" : "newobj",
                    "numinlets" : 2,
                    "numoutlets" : 1,
                    "outlettype" : [ "bang" ],
                    "patching_rect" : [ 17.75, 74.5, 71.0, 23.0 ],
                    "style" : "",
                    "text" : "qmetro 33"
                }

            }
,           {
                "box" :                 {
                    "id" : "obj-7",
                    "maxclass" : "toggle",
                    "numinlets" : 1,
                    "numoutlets" : 1,
                    "outlettype" : [ "int" ],
                    "parameter_enable" : 0,
                    "patching_rect" : [ 17.75, 46.5, 24.0, 24.0 ],
                    "style" : ""
                }

            }
 ],
        "lines" : [             {
                "patchline" :               {
                    "destination" : [ "obj-13", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-116", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-11", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-12", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-116", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-123", 1 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-123", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-125", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-125", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-127", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-1", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-13", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-127", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-131", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-127", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-134", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-10", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-26", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-56", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-26", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-12", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-5", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-81", 6 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-52", 6 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-81", 5 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-52", 5 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-81", 4 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-52", 4 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-81", 3 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-52", 3 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-81", 2 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-52", 2 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-81", 1 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-52", 1 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-81", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-52", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-58", 1 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-56", 1 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-60", 1 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-56", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-5", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-6", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-8", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-7", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-9", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-8", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-83", 1 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-81", 1 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-83", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-81", 0 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-10", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-9", 1 ]
                }

            }
,           {
                "patchline" :               {
                    "destination" : [ "obj-10", 0 ],
                    "disabled" : 0,
                    "hidden" : 0,
                    "source" : [ "obj-9", 0 ]
                }

            }
 ],
        "dependency_cache" : [          {
                "name" : "hoa.encoder~.mxo",
                "type" : "iLaX"
            }
,           {
                "name" : "hoa.pi.mxo",
                "type" : "iLaX"
            }
,           {
                "name" : "hoa.rotate~.mxo",
                "type" : "iLaX"
            }
,           {
                "name" : "hoa.decoder~.mxo",
                "type" : "iLaX"
            }
 ],
        "embedsnapshot" : 0
    }

}
