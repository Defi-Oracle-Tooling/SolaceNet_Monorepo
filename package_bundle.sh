#!/bin/bash

echo "📦 Zipping bundle..."
zip -r bundle.zip docs infra index.html README.md LICENSE.md generate_bundle.sh package_bundle.sh SolaceNet_Monorepo.code-workspace .vscode
echo "✅ bundle.zip created successfully!"
