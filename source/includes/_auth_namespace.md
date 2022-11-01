# Auth

## Multi-factor authentication (MFA)

### MFA challenge

> Endpoint url

```plain
  <%= url_generation('GET', '/auth/mfa/challenge', highlight: false) %>
```

> Sample response:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

<%= url_generation('GET', '/auth/mfa/challenge') %>

This endpoint is used to
This endpoint retrieves all kittens.

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Role-Based-Access-Control system (RBAC)

## Access tokens and refresh tokens
