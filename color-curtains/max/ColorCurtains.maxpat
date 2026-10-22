{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "rect": [
      50,
      50,
      1050,
      620
    ],
    "default_fontsize": 12,
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "patching_rect": [
            30,
            20,
            690,
            22
          ],
          "text": "COLOR CURTAINS \u2014 accumulating layers, based on moving_squares"
        }
      },
      {
        "box": {
          "id": "instructions",
          "maxclass": "comment",
          "patching_rect": [
            30,
            48,
            710,
            22
          ],
          "text": "1. Start visuals.  2. Open a track.  3. Enable audio and start playback."
        }
      },
      {
        "box": {
          "id": "start",
          "maxclass": "toggle",
          "patching_rect": [
            30,
            90,
            24,
            22
          ]
        }
      },
      {
        "box": {
          "id": "startlabel",
          "maxclass": "comment",
          "patching_rect": [
            65,
            90,
            180,
            22
          ],
          "text": "Start / pause visuals"
        }
      },
      {
        "box": {
          "id": "world",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            130,
            420,
            22
          ],
          "text": "jit.world curtains @size 960 560 @fps 10 @floating 1 @enable 0"
        }
      },
      {
        "box": {
          "id": "plane",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            345,
            310,
            22
          ],
          "text": "jit.gl.videoplane curtains @transform_reset 2"
        }
      },
      {
        "box": {
          "id": "dense",
          "maxclass": "flonum",
          "patching_rect": [
            30,
            400,
            70,
            22
          ],
          "minimum": 0.5,
          "maximum": 2.0
        }
      },
      {
        "box": {
          "id": "denseload",
          "maxclass": "newobj",
          "patching_rect": [
            130,
            400,
            90,
            22
          ],
          "text": "loadmess 1."
        }
      },
      {
        "box": {
          "id": "density",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            435,
            165,
            22
          ],
          "text": "prepend density"
        }
      },
      {
        "box": {
          "id": "denselabel",
          "maxclass": "comment",
          "patching_rect": [
            240,
            400,
            200,
            22
          ],
          "text": "Band density (0.5\u20132)"
        }
      },
      {
        "box": {
          "id": "open",
          "maxclass": "message",
          "patching_rect": [
            580,
            90,
            55,
            22
          ],
          "text": "open"
        }
      },
      {
        "box": {
          "id": "play",
          "maxclass": "toggle",
          "patching_rect": [
            660,
            90,
            24,
            22
          ]
        }
      },
      {
        "box": {
          "id": "playlabel",
          "maxclass": "comment",
          "patching_rect": [
            700,
            90,
            180,
            22
          ],
          "text": "Play / stop track"
        }
      },
      {
        "box": {
          "id": "sf",
          "maxclass": "newobj",
          "patching_rect": [
            580,
            130,
            150,
            22
          ],
          "text": "sfplay~ 2 @loop 1"
        }
      },
      {
        "box": {
          "id": "sum",
          "maxclass": "newobj",
          "patching_rect": [
            580,
            175,
            50,
            22
          ],
          "text": "+~"
        }
      },
      {
        "box": {
          "id": "mono",
          "maxclass": "newobj",
          "patching_rect": [
            580,
            210,
            70,
            22
          ],
          "text": "*~ 0.5"
        }
      },
      {
        "box": {
          "id": "dac",
          "maxclass": "newobj",
          "patching_rect": [
            900,
            175,
            55,
            22
          ],
          "text": "ezdac~"
        }
      },
      {
        "box": {
          "id": "daclabel",
          "maxclass": "comment",
          "patching_rect": [
            875,
            215,
            130,
            22
          ],
          "text": "Enable audio"
        }
      },
      {
        "box": {
          "id": "low",
          "maxclass": "newobj",
          "patching_rect": [
            580,
            260,
            110,
            22
          ],
          "text": "lores~ 180 0."
        }
      },
      {
        "box": {
          "id": "hi",
          "maxclass": "newobj",
          "patching_rect": [
            880,
            260,
            100,
            22
          ],
          "text": "hip~ 3000"
        }
      },
      {
        "box": {
          "id": "basspeak",
          "maxclass": "newobj",
          "patching_rect": [
            580,
            305,
            110,
            22
          ],
          "text": "peakamp~ 50"
        }
      },
      {
        "box": {
          "id": "bassgain",
          "maxclass": "newobj",
          "patching_rect": [
            580,
            345,
            65,
            22
          ],
          "text": "* 5."
        }
      },
      {
        "box": {
          "id": "bassclip",
          "maxclass": "newobj",
          "patching_rect": [
            580,
            380,
            85,
            22
          ],
          "text": "clip 0. 1."
        }
      },
      {
        "box": {
          "id": "basssmooth",
          "maxclass": "newobj",
          "patching_rect": [
            580,
            415,
            100,
            22
          ],
          "text": "slide 5. 12."
        }
      },
      {
        "box": {
          "id": "levelpeak",
          "maxclass": "newobj",
          "patching_rect": [
            730,
            305,
            110,
            22
          ],
          "text": "peakamp~ 50"
        }
      },
      {
        "box": {
          "id": "levelgain",
          "maxclass": "newobj",
          "patching_rect": [
            730,
            345,
            65,
            22
          ],
          "text": "* 3."
        }
      },
      {
        "box": {
          "id": "levelclip",
          "maxclass": "newobj",
          "patching_rect": [
            730,
            380,
            85,
            22
          ],
          "text": "clip 0. 1."
        }
      },
      {
        "box": {
          "id": "levelsmooth",
          "maxclass": "newobj",
          "patching_rect": [
            730,
            415,
            100,
            22
          ],
          "text": "slide 5. 12."
        }
      },
      {
        "box": {
          "id": "levelparam",
          "maxclass": "newobj",
          "patching_rect": [
            730,
            460,
            145,
            22
          ],
          "text": "prepend level"
        }
      },
      {
        "box": {
          "id": "highpeak",
          "maxclass": "newobj",
          "patching_rect": [
            880,
            305,
            110,
            22
          ],
          "text": "peakamp~ 50"
        }
      },
      {
        "box": {
          "id": "highgain",
          "maxclass": "newobj",
          "patching_rect": [
            880,
            345,
            65,
            22
          ],
          "text": "* 6."
        }
      },
      {
        "box": {
          "id": "highclip",
          "maxclass": "newobj",
          "patching_rect": [
            880,
            380,
            85,
            22
          ],
          "text": "clip 0. 1."
        }
      },
      {
        "box": {
          "id": "highsmooth",
          "maxclass": "newobj",
          "patching_rect": [
            880,
            415,
            100,
            22
          ],
          "text": "slide 5. 12."
        }
      },
      {
        "box": {
          "id": "highparam",
          "maxclass": "newobj",
          "patching_rect": [
            880,
            460,
            145,
            22
          ],
          "text": "prepend high"
        }
      },
      {
        "box": {
          "id": "notes",
          "maxclass": "comment",
          "patching_rect": [
            30,
            515,
            940,
            22
          ],
          "text": "Bass \u2192 more layers \u2022 volume / highs \u2192 opacity. Keep accumulate.js beside this patch."
        }
      },
      {
        "box": {
          "id": "note2",
          "maxclass": "comment",
          "patching_rect": [
            30,
            545,
            950,
            22
          ],
          "text": "Starts white. Colors build up over time; reset clears accumulated layers."
        }
      },
      {
        "box": {
          "id": "accumulate",
          "maxclass": "newobj",
          "text": "js accumulate.js",
          "patching_rect": [
            30,
            220,
            160,
            22
          ]
        }
      },
      {
        "box": {
          "id": "reset",
          "maxclass": "message",
          "text": "reset",
          "patching_rect": [
            200,
            220,
            60,
            22
          ]
        }
      },
      {
        "box": {
          "id": "texture",
          "maxclass": "newobj",
          "text": "jit.gl.texture curtains @filter nearest",
          "patching_rect": [
            30,
            300,
            300,
            22
          ]
        }
      },
      {
        "box": {
          "id": "bassparam",
          "maxclass": "newobj",
          "text": "prepend bass",
          "patching_rect": [
            580,
            460,
            140,
            22
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "start",
            0
          ],
          "destination": [
            "world",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "denseload",
            0
          ],
          "destination": [
            "dense",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dense",
            0
          ],
          "destination": [
            "density",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "open",
            0
          ],
          "destination": [
            "sf",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play",
            0
          ],
          "destination": [
            "sf",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sf",
            0
          ],
          "destination": [
            "sum",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sf",
            1
          ],
          "destination": [
            "sum",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sum",
            0
          ],
          "destination": [
            "mono",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sf",
            0
          ],
          "destination": [
            "dac",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sf",
            1
          ],
          "destination": [
            "dac",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mono",
            0
          ],
          "destination": [
            "low",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mono",
            0
          ],
          "destination": [
            "hi",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "low",
            0
          ],
          "destination": [
            "basspeak",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "basspeak",
            0
          ],
          "destination": [
            "bassgain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "bassgain",
            0
          ],
          "destination": [
            "bassclip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "bassclip",
            0
          ],
          "destination": [
            "basssmooth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mono",
            0
          ],
          "destination": [
            "levelpeak",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "levelpeak",
            0
          ],
          "destination": [
            "levelgain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "levelgain",
            0
          ],
          "destination": [
            "levelclip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "levelclip",
            0
          ],
          "destination": [
            "levelsmooth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "levelsmooth",
            0
          ],
          "destination": [
            "levelparam",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "hi",
            0
          ],
          "destination": [
            "highpeak",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "highpeak",
            0
          ],
          "destination": [
            "highgain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "highgain",
            0
          ],
          "destination": [
            "highclip",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "highclip",
            0
          ],
          "destination": [
            "highsmooth",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "highsmooth",
            0
          ],
          "destination": [
            "highparam",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "world",
            1
          ],
          "destination": [
            "accumulate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reset",
            0
          ],
          "destination": [
            "accumulate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "accumulate",
            0
          ],
          "destination": [
            "texture",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "texture",
            0
          ],
          "destination": [
            "plane",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "density",
            0
          ],
          "destination": [
            "accumulate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "levelparam",
            0
          ],
          "destination": [
            "accumulate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "highparam",
            0
          ],
          "destination": [
            "accumulate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "bassparam",
            0
          ],
          "destination": [
            "accumulate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "basssmooth",
            0
          ],
          "destination": [
            "bassparam",
            0
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "accumulate.js",
        "bootpath": ".",
        "patcherrelativepath": ".",
        "type": "TEXT",
        "implicit": 1
      }
    ]
  }
}
