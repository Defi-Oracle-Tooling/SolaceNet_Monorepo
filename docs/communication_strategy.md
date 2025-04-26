# communication strategy.md Document

## Overview

This document describes the inter-service communication strategies employed in the SolaceNet Monorepo.

## Details

- **Synchronous Communication**: RESTful APIs are used for real-time data exchange between services.
- **Asynchronous Communication**: RabbitMQ is used for message queuing and event-driven architecture.
- **Error Handling**: Circuit breakers and retries are implemented to handle communication failures.

## Implementation

- All services expose RESTful APIs documented in OpenAPI specifications.
- RabbitMQ topics are used for broadcasting events to multiple subscribers.
- Dead-letter queues are configured for failed messages.
