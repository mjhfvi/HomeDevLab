# Vaultwarden Service Documentation

## Overview

**Vaultwarden** is an unofficial, open-source password manager server written in Rust that implements the Bitwarden-compatible API. It serves as our enterprise password vault solution with SSO integration via Azure AD.

- **Version**: 1.34.3 (Alpine)
- **Chart**: vaultwarden/vaultwarden (0.34.4)
- **Namespace**: `infra`
- **Repository**: <https://github.com/dani-garcia/vaultwarden>

## Access Information

| Environment | URL | Access |
|-------------|-----|--------|
| **Internal** | <https://wallet.internal.cloud.com> | Traefik Ingress |

## Authentication

### SSO Configuration (Azure AD)

Vaultwarden is configured with **Azure AD Single Sign-On (SSO)** using the **Password Vault** application.

| Setting | Value |
| --------- | ------- |
| **Azure Application** | Password Vault |
| **Authority** | <https://login.microsoftonline.com/111111-11-11-11-111111/v2.0> |
| **SSO Enabled** | Yes |
| **SSO Only** | Yes (no local account logins) |
| **Domain Whitelist** | app.com |

**Configuration File**: [vaultwarden-configuration.yaml](./vaultwarden-configuration.yaml)

#### SSO Environment Variables

- `SSO_CLIENT_ID`: Azure application ID
- `SSO_CLIENT_SECRET`: Stored in Azure Key Vault
- `SSO_ALLOW_UNKNOWN_EMAIL_VERIFICATION`: true
- `SIGNUPS_DOMAIN_WHITELIST`: app.com

## Infrastructure Components

### Database

**PostgreSQL on Amazon RDS**

| Property | Value |
| ---------- | ------- |
| **Host** | op-01-postgresql.us-east-1.rds.amazonaws.com |
| **Port** | 5432 |
| **Database Name** | vaultwarden |
| **Region** | us-east-1 |

**Credentials**: Managed via Kubernetes Secret `vaultwarden-database-authorization`

- Secret Key: `db_username` (base64 encoded: `adminuser`)
- Secret Key: `db_password` (base64 encoded)

**Configuration File**: [vaultwarden-database-authorization.yaml](./vaultwarden-database-authorization.yaml)

### SMTP Email Service

**Amazon SES (Simple Email Service)**

| Property | Value |
| ---------- | ------- |
| **Host** | email-smtp.us-east-1.amazonaws.com |
| **Port** | 587 |
| **From Address** | <vaultwarden-wallet@app.com> |
| **TLS** | Enabled |

**Credentials**: Managed via secret reference in Helm values

**Update 'From Address' in AWS IAM, update the 'AmazonSesSendingAccess' Policy**:
[ses-smtp-user.github-actions](https://us-east-1.console.aws.amazon.com/iam/home#/users/details/ses-smtp-user.github-actions?section=permissions)

- Username: `SMTP_USERNAME_SECRET`
- Password: `SMTP_PASSWORD_SECRET`

**Configuration File**: [vaultwarden-smtp-user-password.yaml](./vaultwarden-smtp-user-password.yaml)

### Ingress

**Traefik Ingress Controller**

| Property | Value |
| ---------- | ------- |
| **Ingress Class** | traefik |
| **TLS Secret** | vaultwarden-tls |
| **Entry Point** | websecure |
| **TLS Certificate** | Microsoft Azure Federated SSO Certificate |

**Configuration Files**:

- [Ingressroute.yaml](./Ingressroute.yaml) - Traefik custom route
- [vaultwarden-ingress-tls.yaml](./vaultwarden-ingress-tls.yaml) - TLS certificate

## Deployment

### Prerequisites

- Kubernetes cluster (v1.12.0 or higher)
- Helm installed
- Access to vaultwarden Helm repository: `https://guerzon.github.io/vaultwarden`
- PostgreSQL RDS instance
- SES SMTP credentials
- Azure AD SSO application configured

### Deployment Steps

1. **Update dependencies**:

   ```bash
   helmfile deps
   ```

2. **Validate configuration** (requires Vault access if using secrets driver):

   ```bash
   helmfile template
   ```

3. **Deploy to cluster**:

   ```bash
   helmfile sync
   ```

4. **Apply incremental changes only**:

   ```bash
   helmfile apply
   ```

**Configuration File**: [helmfile.yaml](./helmfile.yaml)

### Helm Values

Custom values are defined in [values.yaml](./values.yaml) and configured via helmfile. Key sections:

- **Image**: Docker image registry, repository, tag, and pull policy
- **Database**: PostgreSQL connection and credentials
- **SMTP**: Email service configuration
- **SSO**: Azure AD authentication settings
- **Ingress**: Traefik routing and TLS

## Secrets Management

All sensitive data is stored as Kubernetes Secrets in the `infra` namespace:

| Secret Name | Purpose | Files |
| ------------- | --------- | ------- |
| `vaultwarden-database-authorization` | RDS credentials | [vaultwarden-database-authorization.yaml](./vaultwarden-database-authorization.yaml) |
| `vaultwarden-smtp-user-password` | SES SMTP credentials | [vaultwarden-smtp-user-password.yaml](./vaultwarden-smtp-user-password.yaml) |
| `vaultwarden-admin-token` | Admin panel access token | [vaultwarden-admin-token.yaml](./vaultwarden-admin-token.yaml) |
| `vaultwarden-tls` | TLS certificate and key | [vaultwarden-ingress-tls.yaml](./vaultwarden-ingress-tls.yaml) |

### Secure Handling

- All secrets are **base64 encoded** in YAML manifests
- Use Kubernetes Secret encryption at rest
- Rotate credentials regularly via Key Vault
- Never commit plaintext passwords to Git
- Use `vaultwarden-configuration` ConfigMap for non-sensitive settings

**Configuration File**: [vaultwarden-configuration.yaml](./vaultwarden-configuration.yaml)

## Configuration Files

### Helm Configuration

- **helmfile.yaml** - Helmfile manifest defining the release and values
- **values.yaml** - Comprehensive Helm chart values template

### Kubernetes Manifests

- **Chert.yaml** - Helm Chart metadata (v0.34.4)
- **Ingressroute.yaml** - Traefik IngressRoute for AWS OP-01 cluster
- **vaultwarden-configuration.yaml** - ConfigMap for SSO and domain settings
- **vaultwarden-database-authorization.yaml** - Secret for RDS credentials
- **vaultwarden-smtp-user-password.yaml** - Secret for SES SMTP credentials
- **vaultwarden-admin-token.yaml** - Secret for admin panel token
- **vaultwarden-ingress-tls.yaml** - Secret for TLS certificate

## Common Administrative Tasks

### View Pod Status

```bash
kubectl get pods -n infra -l app.kubernetes.io/name=vaultwarden
kubectl describe pod <pod-name> -n infra
```

### View Logs

```bash
kubectl logs -n infra -l app.kubernetes.io/name=vaultwarden -f
```

### Access Admin Panel

The admin panel is disabled by default for security. To enable:

1. Set `ADMIN_TOKEN` in secret `vaultwarden-admin-token`
2. Uncomment the admin token configuration in helmfile.yaml
3. Redeploy: `helmfile sync`
4. Access: <https://wallet.internal.cloud.com/admin/>

### Database Maintenance

**PostgreSQL Connection**:

```bash
psql -h op-01-postgresql.us-east-1.rds.amazonaws.com -U adminuser -d vaultwarden
```

**Backup**:

```bash
pg_dump -h op-01-postgresql.us-east-1.rds.amazonaws.com -U adminuser -d vaultwarden > vaultwarden-backup.sql
```

**Restore**:

```bash
psql -h op-01-postgresql.us-east-1.rds.amazonaws.com -U adminuser -d vaultwarden < vaultwarden-backup.sql
```

### Update Configuration

Edit the appropriate YAML file and redeploy:

```bash
# ConfigMap updates (non-sensitive)
vim vaultwarden-configuration.yaml
kubectl apply -f vaultwarden-configuration.yaml

# Secret updates (sensitive)
vim vaultwarden-smtp-user-password.yaml
kubectl apply -f vaultwarden-smtp-user-password.yaml

# Or use helmfile:
helmfile apply
```

### Scale Replicas

Edit `values.yaml` or override in helmfile.yaml, then:

```bash
helmfile sync
```

### Restart Pods

```bash
kubectl rollout restart deployment/vaultwarden -n infra
```

## Monitoring and Logging

### Health Check

```bash
curl -k https://wallet.internal.cloud.com
```

### Pod Metrics

```bash
kubectl top pod <pod-name> -n infra
```

### Event Logs

```bash
kubectl get events -n infra --sort-by='.lastTimestamp'
```

## Troubleshooting

### Issue: SSO Login Failing

**Symptoms**: Azure AD login returns error or redirects incorrectly

**Troubleshooting Steps**:

1. Verify SSO_CLIENT_ID matches Azure app registration
2. Check SSO_AUTHORITY URL is correct
3. Confirm SIGNUPS_DOMAIN_WHITELIST matches user email domain
4. Verify Azure app has redirect URI: `https://wallet.internal.cloud.com/identity/connect/oidc-callback`
5. Check pod logs: `kubectl logs -n infra -l app.kubernetes.io/name=vaultwarden`

### Issue: Database Connection Error

**Symptoms**: Pod fails to start with "could not connect to database"

**Troubleshooting Steps**:

1. Verify RDS endpoint is accessible:

   ```bash
   nslookup op-01-postgresql.us-east-1.rds.amazonaws.com
   ```

2. Check database credentials in secret: `kubectl get secret vaultwarden-database-authorization -n infra -o yaml`
3. Verify security group rules allow port 5432 from Kubernetes cluster
4. Test connection from pod:

   ```bash
   kubectl exec -it <pod-name> -n infra -- psql -h op-01-postgresql.us-east-1.rds.amazonaws.com -U adminuser -d vaultwarden
   ```

### Issue: SMTP Email Not Sending

**Symptoms**: Password reset emails or invitations not received

**Troubleshooting Steps**:

1. Verify SMTP credentials in secret: `kubectl get secret vaultwarden-smtp-user-password -n infra -o yaml`
2. Check pod logs for SMTP errors: `kubectl logs -n infra -l app.kubernetes.io/name=vaultwarden | grep -i smtp`
3. Verify SES is in production access mode (not sandbox)
4. Confirm sending address `vaultwarden-wallet@app.com` is verified in SES
5. Check SES sending quotas

### Issue: TLS Certificate Expired

**Symptoms**: Browser shows "certificate expired" or "invalid certificate"

**Troubleshooting Steps**:

1. Check certificate expiration: `kubectl get secret vaultwarden-tls -n infra -o jsonpath='{.data.tls\.crt}' | base64 -d | openssl x509 -text -noout | grep -A2 "Validity"`
2. Renew certificate and update secret: `vaultwarden-ingress-tls.yaml`
3. Redeploy: `kubectl apply -f vaultwarden-ingress-tls.yaml`

### General Debugging

Enable debug logging in `values.yaml`:

```yaml
logging:
  logLevel: "debug"  # Options: info, debug, error, trace
```

## Security Considerations

- **SSO Only Mode**: Local account creation is disabled; all access must be via Azure AD
- **Domain Whitelist**: Only app.com email addresses can register
- **Certificate Pinning**: Use Azure Federated SSO certificate for TLS
- **Credential Rotation**: Rotate SMTP and database credentials quarterly
- **Admin Token**: Keep admin panel disabled except when needed for administrative tasks
- **Secret Encryption**: Enable Kubernetes Secret encryption at rest in cluster
- **Network Policies**: Restrict inbound traffic to Traefik ingress only
- **Backup Strategy**: Regularly backup PostgreSQL to encrypted storage

## Related Documentation

- **Vaultwarden Official**: <https://github.com/dani-garcia/vaultwarden>
- **Helm Chart**: <https://github.com/guerzon/vaultwarden> (<https://guerzon.github.io/vaultwarden>)
- **Bitwarden CLI Documentation**: <https://bitwarden.com/help/cli/>
- **Kubernetes Documentation**: <https://kubernetes.io/docs/>
- **Traefik Ingress**: <https://doc.traefik.io/>

## Support and Escalation

### Reporting Issues

1. Check logs and troubleshooting section above
2. Gather diagnostics:

   ```bash
   kubectl describe pod <pod-name> -n infra
   kubectl logs <pod-name> -n infra > logs.txt
   kubectl get events -n infra > events.txt
   ```

3. Document issue with reproduction steps
4. Escalate to DevOps team lead if unable to resolve

### Emergency Access (Admin Token)

In case of emergency requiring admin panel access:

1. Contact DevOps team lead
2. Provide business justification
3. Token location: Excel password file (see vaultwarden-admin-token.yaml)
4. Access immediately expires after 24 hours
5. Log all administrative actions

## Change Log and Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.34.3 | 2026-02-12 | Current production version |

---

**Last Updated**: February 12, 2026
**Maintained By**: DevOps Team
**Classification**: Internal Use Only
