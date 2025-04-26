# Release Management Process

This document describes the process for creating, tagging, and publishing releases for the SolaceNet Monorepo.

---

## 📦 Release Preparation

1. Ensure all code changes are merged into the `main` branch.
2. Update version numbers if necessary inside the relevant service documentation.
3. Confirm that the following are fully updated:
   - `/docs/architecture/*.drawio`
   - `/docs/microservices/*/*.openapi.yaml`
   - `/index.html`
   - `/README.md`
   - `/SECURITY.md`
   - `/CONTRIBUTING.md`

---

## 🚀 How to Create a Release

### 1. Create a New Release Branch

```bash
git checkout main
git pull
git checkout -b release/vX.Y.Z
```

### 2. Test the Release

Run all tests to ensure the release is stable:

```bash
npm test
```

### 3. Tag the Release

Create a new tag for the release:

```bash
git tag -a vX.Y.Z -m "Release vX.Y.Z"
git push origin vX.Y.Z
```

### 4. Publish the Release

Push the release branch to the repository:

```bash
git push origin release/vX.Y.Z
```

Create a new release in the GitHub repository, including release notes and a changelog.
