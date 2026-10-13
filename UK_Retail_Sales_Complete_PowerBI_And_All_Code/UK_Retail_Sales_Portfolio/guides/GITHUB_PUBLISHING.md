# Publish Project 1 to GitHub

1. Extract this ZIP. Verify `README.md`, `data/`, `sql/`, `excel/`, `python/`, `powerbi/`, `tableau/`, and `website/` are present.
2. Open https://github.com/new, sign in, enter repository name `uk-retail-sales-analytics`, set **Public**, and create an empty repository (do not initialise a second README).
3. On the new repository choose **uploading an existing file** or **Add file > Upload files**. Drag the extracted *contents*, not the outer folder or ZIP. Preserve folder paths. GitHub's browser uploader has per-file and count limits; if it refuses a bulk upload, use GitHub Desktop (see below).
4. Enter commit message `Add UK retail sales analytics portfolio` and commit to `main`.
5. Check README renders correctly and all links work. Add native dashboard files from your PC under `powerbi/` and `tableau/`, plus authentic screenshots in `visuals/`.
6. To publish the interactive portfolio site, go to repository **Settings > Pages**. GitHub Pages supports publishing from a branch root or `/docs` folder. Copy `website/index.html` to `docs/index.html` and publish from `main` `/docs`. Because it runs as a standalone page, adjust the relative links in its Explore section to published repository URLs. Alternatively keep the website as a local file, which works offline.
7. Add links to your live repo, website and any Tableau Public or Power BI report to README and LinkedIn.

**GitHub Desktop fallback:** download https://desktop.github.com/, create a local repository using the extracted folder and publish to GitHub. This is easier for nested files and avoids browser file-count limits.

**Privacy:** use synthetic data only; don't upload credentials, private client datasets or personally identifying information.

**Current status:** This package does **not** publish the GitHub repository automatically. Publishing requires signing in to your GitHub account. The ChatGPT GitHub connection may help with repository actions once connected.
