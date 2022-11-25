# Authentication

## Sign in

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Anonymous', 'blue') %>

> Sign in URL:

```plain
  <%= url_generation('POST', '/auth/login', highlight: false) %>
```

> Sample request body:

```json
  {
    "email": "your.account@airjobmanager.com",
    "password": "your_very_strong_password"
  }
```

> Sample response body (200):

```json
{
  "status": "Operation completed with success",
  "message": "Session created with success"
}
```

> Sample response body (200):

```json
{
  "session": "26a00990-2f57-4973-bd9c-93092ae4a39b"
}
```

> Sample response body (401):

```json
{
  "status": "Error during operation",
  "error": "User and/or password incorrect"
}
```

<%= url_generation('POST', '/auth/login') %>

This endpoint is used to sign in a `User`.

### Body parameters

Parameter | Description |
--------- | ----------- |
email     | String with `User` e-mail |
password  | String with the `User` password |

### Possible responses

- `200 Success`

  - `User` has typed correct credentials. This scenario can lead to two responses:
  - If the `User` do have the MFA enabled, this endpoint will generate a MFA session for use in the MFA challenge or MFA backup challenge endpoints.
  - If the `User` doesn't have MFA enabled, the sign in is complete and you already have the necessary tokens.

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

  - Occurs if the `User` either typed the wrong email or password.

## Sign out

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Sign out URL:

```plain
  <%= url_generation('DELETE', '/auth/logout', highlight: false) %>
```

> Sample response body (200):

```json
{
  "status": "Operation completed with success",
  "message": "Session ended with success"
}
```

<%= url_generation('DELETE', '/auth/logout') %>

This endpoint is used to sign out a `User`, after this is completed, any requests using the same access token will be unauthorized.

### Possible responses

- `200 Success`
  - Successful sign out and access token is marked as unusable.

## Refresh access token

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Refresh access token URL:

```plain
  <%= url_generation('POST', '/auth/refresh', highlight: false) %>
```

> Sample response body (200):

```json
{
  "status": "Operation completed with success",
  "message": "Access token successfully refreshed"
}
```

> Sample response body (401):

```json
{
  "status": "Error during operation",
  "error": "Refresh token invalid"
}
```

> Sample response body (401):

```json
{
  "status": "Error during operation",
  "error": "Refresh token was not included in request headers"
}
```

<%= url_generation('POST', '/auth/refresh') %>

This endpoint is used to get a new access token using the refresh token received in the authentication response.
This action can be performed any time before the expiration the refresh token, in other words, it doesn't matter if the access token is already expired or not.

### Request headers

Header | Description |
--------- | ----------- |
Refresh-Token | Token to get a new `Access-Token`. Stored from one of the sign in requests |

### Possible responses

- `200 Success`
  - Access token was successfully refreshed. Any future requests must use the new token.
  - A new Refresh-Token is provided. Any future token refreshing must use the new token.

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
  - Refresh token is invalid or the header was not provided in the request

## Request account confirmation e-mail

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Request account confirmation e-mail URL:

```plain
  <%= url_generation('GET', '/auth/email/send_confirm', highlight: false) %>
```

<%= url_generation('GET', '/auth/email/send_confirm') %>

This endpoint is used to request a new e-mail with a token to confirm the user's account.

### Possible responses

- `204 No Content`

  - A e-mail was send, if the `User` account is not confirmed

## Account Confirmation

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Anonymous', 'blue') %>

> Account Confirmation URL:

```plain
  <%= url_generation('POST', '/auth/email/confirm', highlight: false) %>
```

> Sample request body:

```json
  {
    "email": "your.email@airjobmanager.com",
    "token": "3a23d6af-a13e-444d-a51d-d1058b45bf5b"
  }
```

<%= url_generation('POST', '/auth/email/confirm') %>

This endpoint is used to confirm the user's account providing the token received in the e-mail.

### Body parameters

Parameter | Description |
--------- | ----------- |
email     | String with account's e-mail |
token     | String with token received in the e-mail |

### Possible responses

- `204 No Content`

  - Account has been confirmed

- `422 Unprocessable entity`

  - Provided token is incorrect, no changes made to account.
