#!/bin/bash

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Creating SolaceNet Bundle Structure...${NC}"

mkdir -p docs/architecture
mkdir -p docs/microservices
mkdir -p infra

# Create microservices folders
services=(
  auth-service user-service payment-service order-service inventory-service
  notification-service gateway-service analytics-service admin-service audit-service file-service
)

for service in "${services[@]}"
do
  mkdir -p docs/microservices/$service
  mkdir -p infra/$service

  cat <<EOF > docs/microservices/$service/masterplan.md
# ${service^} Microservice Master Plan

## Overview
Brief description of what this service does.

## Inputs and Outputs
- Inputs:
- Outputs:

## API Contracts
(Reference OpenAPI YAML if available)

## Database Models
(Link to ERD diagram if applicable)

## Business Logic
Main processes and workflows.

## Dependencies
- Internal services
- External APIs

## Security
Authentication, authorization, encryption.

## Scaling Plan
Horizontal/vertical scaling strategies.

## Monitoring and Alerts
Metrics, dashboards, alarms.

## Failure Recovery
Retry logic, circuit breakers.

## DevOps Strategy
CI/CD pipelines, infrastructure setup.

## Future Enhancements
Planned upgrades and expansion.
EOF

  cat <<EOF > docs/microservices/$service/openapi.yaml
openapi: 3.0.1
info:
  title: ${service^} API
  version: 1.0.0
paths:
  /${service//-/_}:
    get:
      summary: List all entries
      responses:
        '200':
          description: Successful
        '400':
          description: Bad Request
        '401':
          description: Unauthorized
        '404':
          description: Not Found
        '500':
          description: Internal Error
EOF

  touch docs/microservices/$service/erd.drawio

  cat <<EOF > infra/$service/build.yaml
name: Build ${service^}

on:
  push:
    paths:
      - 'docs/microservices/$service/**'
      - 'infra/$service/**'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
    - name: Build
      run: npm install && npm run build
EOF

  touch infra/$service/test.yaml
  touch infra/$service/deploy-dev.yaml

  echo -e "${GREEN}Created microservice: $service${NC}"
done

# Architecture diagrams
touch docs/architecture/global_architecture.drawio
touch docs/architecture/network_topology.drawio
touch docs/architecture/deployment_topology.drawio
touch docs/architecture/microservices_flowmap.drawio

# Strategy Documents
docs=("authentication_strategy.md" "disaster_recovery.md" "observability_framework.md" "security_master_plan.md" "communication_strategy.md" "compliance_notes.md" "roadmap.md" "error_handling_framework.md" "test_strategy.md")

for doc in "${docs[@]}"
do
  cat <<EOF > docs/$doc
# ${doc//_/ } Document

## Overview
Placeholder for $doc.

## Details
To be expanded.
EOF
done

# Root files
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SolaceNet Microservices Portal</title>
</head>
<body>
    <h1>SolaceNet Microservices Documentation</h1>
    <ul>
        <li><a href="docs/architecture/global_architecture.drawio">Global Architecture Map</a></li>
        <li><a href="docs/architecture/network_topology.drawio">Network Topology Map</a></li>
        <li><a href="docs/architecture/deployment_topology.drawio">Deployment Topology</a></li>
        <li><a href="docs/architecture/microservices_flowmap.drawio">Microservices Flowchart</a></li>
    </ul>
    <h2>System Documents</h2>
    <ul>
        <li><a href="docs/authentication_strategy.md">Authentication Strategy</a></li>
        <li><a href="docs/disaster_recovery.md">Disaster Recovery</a></li>
        <li><a href="docs/observability_framework.md">Observability</a></li>
        <li><a href="docs/security_master_plan.md">Security Plan</a></li>
    </ul>
</body>
</html>
EOF

cat <<EOF > README.md
# SolaceNet Microservices Documentation

This repository contains the full technical design, architecture diagrams, service specs, and CI/CD flows for SolaceNet.

## Structure
- /docs/architecture - Draw.io architecture maps
- /docs/microservices - Service plans, APIs, ERDs
- /infra/ - CI/CD GitHub Action templates

## Packaging
To zip for archive:
\`\`\`
zip -r bundle.zip .
\`\`\`
EOF

cat <<EOF > .gitignore
*.bak
*.tmp
node_modules/
bundle.zip
.env
EOF


# VS Code workspace file
cat <<EOF > SolaceNet_Monorepo.code-workspace
{
  "folders": [
    {
      "path": "."
    }
  ],
  "settings": {
    "files.exclude": {
      "**/.git": true,
      "**/.DS_Store": true,
      "**/node_modules": true
    }
  }
}
EOF

echo -e "${GREEN}✅ SolaceNet Bundle structure fully generated and populated!${NC}"