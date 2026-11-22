# Operator website

Buildless static HTML, CSS and JavaScript for https://operator.cybernetks.be.

## Preview

Run `python3 -m http.server 8080` from this directory, then open http://localhost:8080.
No install or build step is required.

## Publish

1. Push this repository to `Cybernetks/operator-website` on `main`.
2. In repository **Settings → Pages**, select **GitHub Actions** as the source.
3. Set the custom domain to `operator.cybernetks.be`.
4. At the DNS provider for `cybernetks.be`, add a CNAME record named `operator` pointing to `cybernetks.github.io` (no repository name or URL scheme).
5. Once the DNS check and certificate are ready, enable **Enforce HTTPS**.

The workflow publishes only the public website files. The CNAME file records the custom domain. Existing DNS for cybernetks.be should remain unchanged.

## Content maintenance

Support and privacy pages reproduce the app repository's `docs/app-store/support.md` and `docs/app-store/privacy-policy.md` (policy effective August 11, 2026). Keep these aligned when app behaviour changes. Theme preference is stored locally in the visitor's browser; no analytics, cookies, external fonts or third-party scripts are included.

The app and App Store currently link to `https://cybernetks.be/projects/operator/support/` and `https://cybernetks.be/projects/operator/privacy/`. Keep those pages working. Once this site is live, update app/App Store URLs deliberately, and redirect the older addresses where the Cybernetks hosting supports it. GitHub Pages does not provide configurable server-side redirects.

Assets are copied from the Operator app's approved brand source and launch screenshots. Screenshot content remains in its captured light appearance when the site uses dark mode.

## Search and missing pages

All public content is rendered in HTML without requiring JavaScript. Each page has a unique title, description and HTTPS canonical URL. The sitemap lists the homepage, support and privacy pages. Open Graph metadata and PNG icons support sharing previews. Homepage JSON-LD describes the website and app; no ratings or reviews are invented, so Google software-app rich results are not promised.

`404.html` uses root-relative links so assets and navigation work at arbitrary missing paths. It is marked `noindex`, has no canonical to the homepage, and is omitted from the sitemap. GitHub Pages serves it with HTTP 404. The custom deployment workflow includes it as well as branch-based publishing.

After launch, add the site to Google Search Console and submit `https://operator.cybernetks.be/sitemap.xml` to monitor indexing. This requires access to the site owner's Google account. Search ranking and indexing are not guaranteed by metadata alone.
