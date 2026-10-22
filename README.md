# Experiments

Creative coding experiments by Carl Robinson. This project has its own Git history, separate from the portfolio.

## Color curtains

A p5.js animation based on the original Processing `moving_squares` sketch, with accumulating transparent rectangles and optional audio response. Processing and Max/MSP/Jitter versions are included.

[Sketch instructions](color-curtains/README.md)

[Launch animation](https://etherealcereal.github.io/experiments/) — available after the public repository is created and its first Pages deployment succeeds.

## Local preview

From this folder:

```sh
python3 -m http.server 8765 --directory color-curtains/web
```

Open http://localhost:8765. Audio files selected in the browser stay local.

## First publication

GitHub Free supports Pages for public repositories.

1. Create a **public**, empty repository named `experiments` under `EtherealCereal` on GitHub. Do not initialize it with a README, license, or gitignore; this folder already has files.
2. In that repository's Settings → Pages, select **GitHub Actions** as the publishing source. If unavailable before the first push, do this immediately afterward and rerun the workflow.
3. In Terminal:

```sh
cd "/Users/carlrobinson/Documents/ChatGPT/Experiments"
git add .
git diff --cached --stat
git commit -m "Add color curtains animation and Pages publishing"
git remote add origin https://github.com/EtherealCereal/experiments.git
git push -u origin main
```

4. Wait for **Publish color curtains** in the Actions tab to succeed. If needed, run it manually on `main` after enabling Pages.

Only `color-curtains/web` is deployed. Later pushes to `main` that change the web files or workflow publish automatically. The source repository also includes the Processing and Max versions. The local repository is initialized, but nothing has been committed, pushed, or published.

## Third-party code

The bundled p5.js library retains its license header in `color-curtains/web/vendor/p5.min.js`.
