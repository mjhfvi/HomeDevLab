
# IGW Module

## Overview

The Internet Gateway (IGW) resource does not need to be built or managed separately.
Our infrastructure design includes the IGW as part of the VPC module, which automatically provisions and configures the IGW when a VPC is created.

## What You Need to Know

- **No separate IGW deployment needed:** The VPC module handles IGW creation and attachment.
- **Simplified management:** All networking resources, including IGW, are managed through the VPC module for consistency and reliability.
- **Best Practice:** Always use the VPC module for any networking requirements that involve IGW.

## Why?

This approach reduces complexity, avoids duplication, and ensures that all dependencies are managed in one place.
It also aligns with our infrastructure-as-code standards and makes troubleshooting easier for the SRE team.

---
If you have questions or need to customize IGW behavior, please refer to the VPC module documentation or contact the infrastructure team.
