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
