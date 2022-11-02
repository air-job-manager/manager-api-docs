# Users

## Account endpoints

### Sign Up

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

### Password change

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

### Delete account

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
