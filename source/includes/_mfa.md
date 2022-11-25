# Multi-factor authentication (MFA)

## MFA challenge

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Anonymous', 'blue') %>

> MFA challenge URL:

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

> Sample response body (200):

```json
{
  "status": "Operation completed with success",
  "message": "Session created with success"
}
```

> Sample response body (401):

```json
{
  "status": "Error during operation",
  "error": "Provided multi-factor authentication session not initiated"
}
```

> Sample response body (401):

```json
{
  "status": "Error during operation",
  "error": "Incorrect TOTP code"
}
```

<%= url_generation('POST', '/auth/mfa/challenge') %>

This endpoint is used to sign in a `User` that has MFA enabled, this should be called after the sign in endpoint.

### Body parameters

Parameter | Description |
--------- | ----------- |
totp_code | String with the 6-digit TOTP (Time-based One Time Password) displayed on the Authenticator App |
session   | UUID string that identify the challenge session started in the Sign In endpoint |

### Possible responses

- `200 Success`

  - `User` has initiated a MFA session and his TOTP code matches

<aside class="notice">
  Authentication tokens are provided in the response headers. See table below:
</aside>

### Response headers

Header | Description |
--------- | ----------- |
Access-Token | JWT Access Token |
Refresh-Token   | Token to get a new `Access-Token` |
Expire-At   | UNIX Epoch when your `Access-Token` will expire |

- `401 Unauthorized`

  - Occurs if the `User` either typed the wrong TOTP code or if MFA session UUID doesn't exists.

## Revalidate MFA challenge

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Revalidate MFA challenge URL:

```plain
  <%= url_generation('POST', '/auth/mfa/rechallenge', highlight: false) %>
```

> Sample request body:

```json
  {
    "mfa": {
      "totp_code": "540694"
    }
  }
```

> Sample response body (200):

```json
{
  "status": "Operation completed with success",
  "message": "TOTP code correct"
}
```

> Sample response body (401):

```json
{
  "status": "Error during operation",
  "error": "Incorrect TOTP code"
}
```

<%= url_generation('POST', '/auth/mfa/rechallenge') %>

This endpoint is used to revalidate the MFA of a `User` already authenticated, useful, for example, before showing or update sensible information.

### Body parameters

Parameter | Description |
--------- | ----------- |
totp_code | String with the 6-digit TOTP (Time-based One Time Password) displayed on the Authenticator App |

### Possible responses

- `200 Success`

  - `User` has typed the correct TOTP code.
  
- `401 Unauthorized`

  - `User` has typed an incorrect TOTP code.

## Retrieve backup codes

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Retrieve backup codes URL:

```plain
  <%= url_generation('GET', '/auth/mfa/backup', highlight: false) %>
```

> Sample response body (200):

```json
{
  "mfa_enabled": true,
  "backup_codes": [203145, 398125, 587516, 084274, 457890, 587293, 872419, 865926, 289174, 567278]
}
```

<%= url_generation('GET', '/auth/mfa/backup') %>

This endpoint generates and returns the codes to the `User`. Any of the codes can be used to recover his account, in case his has no access to the previously setup Authenticator App.

### Possible responses

- `200 Success`

Property  | Description |
--------- | ----------- |
mfa_enabled | Boolean indicating if MFA is enabled (status == enabled) |
backup_codes  | Array containing 10 HOTP (HMAC One Time Password) codes |

<aside class="notice">If you call this endpoint without having MFA enabled, you'll receive <i>backup_codes</i> as an empty array</aside>

## MFA backup challenge

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Anonymous', 'blue') %>

> MFA backup challenge URL:

```plain
  <%= url_generation('POST', '/auth/mfa/recovery', highlight: false) %>
```

> Sample request body:

```json
  {
    "mfa": {
      "hotp_code": "540694",
      "session": "26a00990-2f57-4973-bd9c-93092ae4a39b"
    }
  }
```

> Sample response body (200):

```json
{
  "status": "Operation completed with success",
  "message": "You've logged in using the backup method. Your multi-factor authentication will be disabled and you'll be required to do a new setup"
}
```

> Sample response body (401):

```json
{
  "status": "Error during operation",
  "error": "Provided multi-factor authentication session not initiated"
}
```

> Sample response body (401):

```json
{
  "status": "Error during operation",
  "error": "Incorrect HOTP code"
}
```

<%= url_generation('POST', '/auth/mfa/recovery') %>

This endpoint is used to recover the MFA access when the `User` has no longer access to his Authentication App. Any of the backup codes can be used.

### Body parameters

Parameter | Description |
--------- | ----------- |
hotp_code | String with the 6-digit HOTP (HMAC One Time Password) backup code provided to the user |
session   | UUID string that identify the challenge session started in the Sign In endpoint |

### Possible responses

- `200 Success`

  - `User` has initiated a MFA session and his HOTP code matches

<aside class="notice">
  Authentication tokens are provided in the response headers. See table below:
</aside>

### Response headers

Header | Description |
--------- | ----------- |
Access-Token | JWT Access Token |
Refresh-Token   | Token to get a new `Access-Token` |
Expire-At   | UNIX Epoch when your `Access-Token` will expire |

<aside class="warning">
  When you sign in using the recovery method, your MFA setup will be disabled and erased, forcing you to setup a new device if you want to continue using the MFA feature.
</aside>

- `401 Unauthorized`

  - Occurs if the `User` either typed the wrong HOTP code or if MFA session UUID doesn't exists.

## Enable MFA

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Enable MFA URL:

```plain
  <%= url_generation('POST', '/auth/mfa/create', highlight: false) %>
```

> Sample request body:

```json
  {
    "mfa": {
      "totp_code": "540694"
    }
  }
```

> Sample response body (201):

```json
{
  "mfa_enabled": true,
  "message": "Device synced successfully. On your next login, the OTP code will be required."
}
```

> Sample response body (422):

```json
{
  "mfa_enabled": false,
  "error": "Incorrect code. Try to scan the QRCode again."
}
```

<%= url_generation('POST', '/auth/mfa/create') %>

This endpoint is used to validate that the `User` completed the MFA setup process, either by scanning the QRCode or typing the secret in the Authenticator App.

### Body parameters

Parameter | Description |
--------- | ----------- |
totp_code | String with the 6-digit TOTP (Time-based One Time Password) code displayed in the Authenticator App |

### Possible responses

- `201 Created`
  - MFA is now enabled and a challenge will be required in the next login. See MFA challenge endpoint.

Property  | Description |
--------- | ----------- |
mfa_enabled | Boolean indicating if MFA is enabled (status == enabled) |
message  | User-friendly message |

- `422 Unprocessable entity`
  - Provided TOTP code do not match with secret and the MFA remains in its previous state.

Property  | Description |
--------- | ----------- |
mfa_enabled | Boolean indicating if MFA is enabled (status == enabled) |
error  | User-friendly error message |

## Disable MFA

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Disable MFA URL:

```plain
  <%= url_generation('DELETE', '/auth/mfa/destroy', highlight: false) %>
```

> Sample response body (200):

```json
  {
    "mfa_enabled": false,
    "message": "Multi-factor authentication disabled successfully"
  }
```

<%= url_generation('DELETE', '/auth/mfa/destroy') %>

This endpoint disables the MFA for the authenticated `User` and erases his secret.

### Possible responses

- `200 Success`

Property | Description |
--------- | ----------- |
mfa_enabled | Boolean indicating if MFA is enabled (status == enabled) |
message  | User-friendly message |

## MFA details

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> MFA details URL:

```plain
  <%= url_generation('GET', '/auth/mfa/show', highlight: false) %>
```

> Sample response body (200):

```json
  {
    "mfa_enabled": false,
    "mfa_status": "mfa_disabled",
    "secret": "QQ5BNL6W4LGQEURFIHMN57ZD6KYMYTYV",
    "provisioning_uri": "otpauth://totp/Air%20Job%20Manager:hugo.fonseca%40airjobmanager.com?secret=QQ5BNL6W4LGQEURFIHMN57ZD6KYMYTYV&issuer=Air%20Job%20Manager"
  }
```

<%= url_generation('GET', '/auth/mfa/show') %>

This endpoint generates a secret and returns it to the setup of an Authenticator App.

### Possible responses

- `200 Success`

Property | Description |
--------- | ----------- |
mfa_enabled | Boolean indicating if MFA is enabled (status == enabled) |
mfa_status  | String indicating current MFA status. Possible statuses: ['mfa_enabled', 'mfa_disabled', 'mfa_force_reset'] |
secret      | Secret to be used in the Authenticator App |
provisioning_uri      | URI to generate the otpauth QRCode |

<aside class="notice">The secret will rotate until the MFA changes to the <i>enabled</i> state. See the Enable MFA endpoint above</aside>

- `422 Unprocessable entity`

  - Occurs if the `User` has not yet confirmed his e-mail address. MFA setup can only change if the e-mail has been confirmed.
