# Verification — accumulation revision, 2026-10-20

Passed:

- Authored web and Max JavaScript lint.
- Web sketch exercised with mocked p5/DOM APIs: 50 marks per simulated second at default speed, only one initial clear, paused drawing, manual clear, and no drawing at zero speed.
- Max JavaScript exercised with a mocked JitterMatrix host: retained state changes over successive updates, bounded pixel values, and reset to white.
- Max patch JSON and connection references.
- Preserved original is byte-identical to the Desktop moving_squares sketch.
- Processing preprocessing followed by direct javac compilation against the installed Processing 4.5.2 core library. The Commander launcher still reports its existing resource-path issue; the generated Java compiles directly.
- Inspected preview.png, rendered from the actual Max accumulation logic after 600 updates (60 seconds), without a live Max host.

Not verified:

- Live Max graphics/DSP, Processing window rendering, or browser audio/fullscreen/accessibility behavior. Mock tests do not verify native host integration.
- Exact visual equivalence with the supplied video. This adapts a related original sketch; the exact original remains unidentified.

The earlier portfolio production build was blocked by a Turbopack worker-port permission error. No Next.js source or dependencies changed in this revision; that unrelated build was not repeated. Nothing was published or committed.

## Expanded web controls

Authored JavaScript lint passed. Mock-host checks passed for range bounds, crossed endpoint synchronization, zero opacity, 10× draw rate, persistent canvas, and restoring defaults. The preview server returned HTTP 200. Live interaction with the new controls remains unverified. Processing and Max controls were not changed in this web-focused revision.
