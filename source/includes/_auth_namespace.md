# Auth

## Authentication endpoints

### Sign in

### Sign out

### Refresh access token

## Multi-factor authentication (MFA) endpoints

### MFA challenge

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Anonymous', 'blue') %>

> Endpoint URL:

```plain
  <%= url_generation('POST', '/auth/mfa/challenge', highlight: false) %>
```

> Sample request body:

```json
  {
    "mfa": {
      "totp_code": "540694",
      "session": "26a00990-2f57-4973-bd9c-93092ae4a39b"
    }
  }
```

> Sample response body (200 OK):

```json
{
  "status": "",
  "message": ""
}
```

<%= url_generation('POST', '/auth/mfa/challenge') %>

This endpoint is used to sign in a `User` that has MFA enabled, this should be called after the sign in endpoint.

### Body Parameters

Parameter | Description |
--------- | ----------- |
totp_code | String with the 6-digit TOTP (Time-based One Time Password) displayed on the Authenticator App |
session   | UUID string that identify the challenge session started in the Sign In endpoint |

<aside class="notice">
  Authentication tokens are provided in the response headers. See table below:
</aside>

### Response Headers

Header | Description |
--------- | ----------- |
Access-Token | JWT Access Token |
Refresh-Token   | Token to get a new `Access-Token` |
Expire-At   | UNIX Epoch when your `Access-Token` will expire |

### Revalidate MFA challenge

### MFA backup challenge

### Retrieve backup codes

### Enable MFA

### Disable MFA

### MFA details

## Role-Based-Access-Control system (RBAC) endpoints

### Get all claims

### Get all roles

### Create claim

### Delete claim

### Create role

### Delete role

### Claim assignment

### Claim unassignment

### Role assignment

### Role unassignment

More to come...
