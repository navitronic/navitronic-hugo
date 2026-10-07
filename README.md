# navitronic-hugo

The Navitronic blog, migrated from Jekyll to [Hugo](https://gohugo.io/).

## Develop

Hugo 0.167.0 or newer is recommended.

```sh
make serve
```

Open <http://localhost:1313/navitronic-hugo/>.

## Build

```sh
make build
```

The generated site is written to `public/`.

## Publish

Pushes to `main` build and deploy the site to GitHub Pages through
`.github/workflows/hugo.yml`.
