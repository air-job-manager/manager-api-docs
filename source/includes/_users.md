# Users

## Sign Up

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Anonymous', 'blue') %>

> Sign Up URL:

```plain
  <%= url_generation('POST', '/users/create', highlight: false) %>
```

> Sample request body:

```json
  {
    "registration": {
      "name": "Your Complete Name",
      "email": "your.email@airjobmanager.com",
      "password": "foobar1234",
      "password_confirmation": "foobar1234"
    }
  }
```

> Sample response body (200):

```json
  {
    "status": "Operation completed with success",
    "message": "Registration completed with success"
  }
```

> Sample response body (422):

```json
{
  "errors": ["Name can't be blank"]
}
```

<%= url_generation('POST', '/users/create') %>

This endpoint is used to sign up a `User` in the platform.

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
name      | Must be at least 5 characters | String with `User`'s   name |
email     | Unique to your account| String with `User`'s e-mail |
password  | Must be at least 8 characters | String with the desired password |
password_confirmation | Must match with the field `password` | String repeating the desired password |

### Possible responses

- `200 Success`

  - `User` sign up complete and you'll be already authenticated.

<aside class="notice">
  Authentication tokens are provided in the response headers. See table below:
</aside>

### Response headers

Header | Description |
--------- | ----------- |
Access-Token | JWT Access Token |
Refresh-Token   | Token to get a new `Access-Token` |
Expire-At   | UNIX Epoch when your `Access-Token` will expire |

- `422 Unprocessable entity`

  - Occurs if the `User` violates any of the validations in the body parameters. In this case, the `errors` property will contain a array of user-friendly messages.

## Password change

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Password change URL:

```plain
  <%= url_generation('PATCH', '/users/password/change', highlight: false) %>
```

> Sample request body:

```json
  {
    "password": "foobar1234",
    "password_confirmation": "foobar1234"
  }
```

> Sample response body (200):

```json
  {
    "status": "Operation completed with success",
    "message": "Password changed successfully"
  }
```

> Sample response body (422):

```json
{
  "errors": ["Password confirmation doesn't match Password"]
}
```

<%= url_generation('PATCH', '/users/password/change') %>

This endpoint is used to change the `User`'s password when authenticated. In this case, the `User` still have access to his account.

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
password  | Must be at least 8 characters | String with the desired password |
password_confirmation | Must match with the field `password` | String repeating the desired password |

### Possible responses

- `200 Success`

  - `User` password change completed.

<aside class="warning">
  When the password changes, you won't be able to use all the tokens previously emitted. This route will return new authentication tokens in the headers.
  In you were signed in other devices, your account won't be able to do any action without a new sign in.
</aside>

<aside class="notice">
  Authentication tokens are provided in the response headers. See table below:
</aside>

### Response headers

Header | Description |
--------- | ----------- |
Access-Token | JWT Access Token |
Refresh-Token   | Token to get a new `Access-Token` |
Expire-At   | UNIX Epoch when your `Access-Token` will expire |

- `422 Unprocessable entity`

  - Occurs if the `User` violates any of the validations in the body parameters. In this case, the `errors` property will contain a array of user-friendly messages.

## Request password reset e-mail

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Anonymous', 'blue') %>

> Request password reset e-mail URL:

```plain
  <%= url_generation('GET', '/users/password/send_email?email=hugo.fonseca%40airjobmanager.com', highlight: false) %>
```

<%= url_generation('GET', '/users/password/send_email') %>

This endpoint is used to request a new e-mail with a token to reset the user's account password.

### Query params

Query | Description |
--------- | ----------- |
E-mail | String with the e-mail to receive the password reset token |

### Possible responses

- `204 No Content`

  - This endpoint `ALWAYS` returns status code `204 - No Content`, but the e-mail will be sent only if the e-mail matches to an account. This is done this way so a external attacker can not list which e-mail are present in our databases.

## Reset password

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Anonymous', 'blue') %>

> Reset password URL:

```plain
  <%= url_generation('POST', '/users/password/send_email', highlight: false) %>
```

> Sample request body:

```json
  {
    "email": "your.email@airjobmanager.com",
    "token": "3a23d6af-a13e-444d-a51d-d1058b45bf5b",
    "password": "averystrongpassword",
    "password_confirmation": "averystrongpassword"
  }
```

> Sample response body (422):

```json
  {
    "status": "Error during operation",
    "error": "Invalid password reset"
  }
```

> Sample response body (422):

```json
  {
    "errors": [
      "Password confirmation doesn't match Password"
    ]
  }
```

<%= url_generation('POST', '/users/password/send_email') %>

This endpoint is used to reset the user's account password providing the token received in the e-mail.

### Body parameters

Parameter | Description |
--------- | ----------- |
email     | String with account's e-mail |
token     | String with token received in the e-mail |
password     | String with new account's password |
password_confirmation     | String with matching with password parameter |

### Possible responses

- `204 No Content`

  - Account password has been reset successfully

- `422 Unprocessable entity`

  - Provided token is incorrect `OR` password does not match. In both cases, no changes are made to the account.

## Delete account

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Delete account URL:

```plain
  <%= url_generation('DELETE', '/users/delete', highlight: false) %>
```

> Sample response body (200):

```json
  {
    "status": "Operation completed with success",
    "message": "Account deleted with success"
  }
```

<%= url_generation('DELETE', '/users/delete') %>

This endpoint deletes the `User` account and all it's associated data.

### Possible responses

- `200 Success`

<aside class="warning">This action is irreversible! All your account data will be lost.</aside>
