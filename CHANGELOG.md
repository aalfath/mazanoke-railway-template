# Changelog

Each entry is one version of this Railway template. Breaking changes come first.

## 1.1.7-1 (2026-11-16)

- README: add the Deploy on Railway button for the published template (`mazanoke`). No change to the app or the image.

## 1.1.7 (2026-11-16)

- First release: Mazanoke v1.1.7 (`ghcr.io/civilblur/mazanoke:v1.1.7`, pinned by digest).
- nginx listens on Railway's `PORT` (IPv4 and IPv6) and answers `/healthz` without a login.
- HTTP basic auth is on by default: `USERNAME` defaults to `mazanoke`, `PASSWORD` is generated at deploy.
