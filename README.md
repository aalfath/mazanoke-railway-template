[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/mazanoke?utm_medium=integration&utm_source=button&utm_campaign=mazanoke)

# Mazanoke on Railway

Railway template for [Mazanoke](https://github.com/civilblur/mazanoke), a self-hosted image optimizer that runs in your browser. Images are compressed and converted on the visitor's own device and never reach the server.

This repo deploys **Mazanoke v1.1.7** from the official image `ghcr.io/civilblur/mazanoke:v1.1.7`, pinned by digest in the `Dockerfile`.

## What it deploys

One service, built from this repo's `Dockerfile`:

- the official Mazanoke image (nginx serving the static app);
- `railway-start.sh`, which moves nginx onto Railway's `PORT`, adds an open `/healthz` health check path, and then runs upstream's basic-auth setup.

There's no database and no volume: Mazanoke keeps nothing on the server. Settings live in each visitor's browser.

## Variables

| Variable | Default | What it does |
|---|---|---|
| `USERNAME` | `mazanoke` | Login name for HTTP basic auth |
| `PASSWORD` | generated (`${{secret(24)}}`) | Login password. Find it in the service's Variables tab. Delete `USERNAME` or `PASSWORD` and redeploy to make the instance public with no login |
| `PORT` | `8080` | Port nginx listens on; the public domain points at it |

The login protects the app page. Static files (scripts, icons, the web app manifest) and `/healthz` stay open, as they do upstream.

## Updates

The upstream version is pinned in the `Dockerfile`. When a new Mazanoke release comes out, this repo bumps the pin and adds an entry to `CHANGELOG.md`. Railway then shows an "update available" notice on projects deployed from this template, and you choose when to apply it. Read `CHANGELOG.md` before you apply an update.

## License

Mazanoke is GPL-3.0, by [civilblur](https://github.com/civilblur). This repo only adds the Railway wrapper.
