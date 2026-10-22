# Color curtains — based on moving_squares

The animation now follows Carl's `moving_squares` sketch: clear to white once, then draw five new random translucent shapes per update at 10 updates per second. Earlier marks remain in the canvas and are gradually covered by later marks. There are no sine-wave fades, moving noise fields, or per-frame background resets.

The original is preserved unchanged in `original/moving_squares.pde`. The Desktop source was not edited.

## What is adapted

- Squares become narrow, full-height rectangles, informed by `cool_lines` and the video.
- Position-dependent RGB colors are adapted toward cyan/blue on the left and lilac/pink on the right.
- The original random opacity range is 0–30 out of 255 (about 12%). Desktop and Max retain it in silent mode; the web defaults to 0–12% and provides wider controls.
- The simulation keeps the original 10 Hz update rate; Processing and web draw at 30 fps with a time accumulator.

This is an adaptation of a related source, not a claim that we found the video's exact original. Random placement means each run differs. Colors take tens of seconds to build up from white.

## Web

Open `web/index.html` in a browser, or serve it with:

```sh
python3 -m http.server 8765 --directory color-curtains/web
```

Visit http://localhost:8765. **Clear canvas** restarts on white; **Pause motion** preserves the current image. Layering speed ranges from 0–10× (0–500 rectangles per second before audio modulation). Separate minimum and maximum width sliders span 0.1–100% of canvas width; opacity sliders span 0–100%. Each new band samples those ranges uniformly. Crossing one endpoint moves its partner to keep a valid range. Restore gentle settings resets these controls without clearing the canvas. Existing marks remain until covered or cleared. Fullscreen exits with Esc. Reduced-motion preferences start the canvas paused.

Choose an audio file and press Play. Bass increases the rate of new layers; volume and treble increase opacity. Response zero restores silent-mode drawing while music keeps playing. Audio stays in the browser. The web folder includes p5.js 1.11.11 and needs no build. A GitHub Pages workflow is prepared; publication happens after Pages is enabled and the files are pushed to `main`. See the repository README for setup and the launch link.

## Processing

Open `processing/ColorCurtains/ColorCurtains.pde` in Processing 4 Java mode and Run. No extra libraries required.

- Space: pause/resume.
- R: clear to white.
- Up/down: layering speed.
- Left/right: width of new bands.
- S: save a frame.

The desktop sketch is silent. The audio-file version is the web implementation.

## Max/MSP/Jitter

Open `max/ColorCurtains.maxpat`, keeping `accumulate.js` beside it. Toggle Start visuals. Click `open` to choose a track, enable `ezdac~`, and toggle Play. Click `reset` to clear the accumulated image.

The Max JavaScript object retains floating-point RGB history and blends new marks into it. A one-row ARGB Jitter matrix is stretched across the video plane, which is equivalent to full-height rectangles. This replaces the earlier stateless shader. It uses stock Max objects and no external packages.

At 10 render frames per second, it adds five bands per frame. Bass adds more bands; volume and highs increase opacity. Unlike the web's elapsed-time accumulator, Max slows if rendering drops frames. The Max analysis uses filtered peaks, while the web uses FFT bands and RMS; responses and edge rasterization may differ.

## Verification

See `VERIFICATION.md` for checks and limits. Live Max playback and browser audio remain unverified. `preview.png` is a source-rendered sample after 60 simulated seconds, not a browser screenshot.
