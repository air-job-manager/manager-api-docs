# State

## States Index

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>
<%= badge('auth_type', 'Pagination', 'Available', 'green') %>
<%= badge('auth_type', 'Ordenation', 'Available', 'green') %>
<%= badge('auth_type', 'Filtering', 'Available', 'green') %>

> States index URL:

```plain
  <%= url_generation('GET', '/earth/states', highlight: false) %>
```

> Sample response body (200):

```json
  {
    "states": [
      ...
      {
        "id": 10,
        "code": "BA",
        "name": "Bahia",
        "country_id": 43
      },
      ...
    ],
  }
```

<%= url_generation('GET', '/earth/states') %>

This endpoint returns all states registers

### Available filters

- `name`
- `country`

### Possible responses

- `200 Success`

## Show State

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Show State URL:

```plain
  <%= url_generation('GET', '/earth/states/5721', highlight: false) %>
```

> Sample response body (200):

```json
{
  "id": 10,
  "code": "BA",
  "name": "Bahia",
  "country_id": 43
}
```

<%= url_generation('GET', '/earth/states/:id') %>

This endpoint returns a state in detail

### Possible responses

- `200 Success`

## Create State

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Create State URL:

```plain
  <%= url_generation('POST', '/earth/states', highlight: false) %>
```

> Sample request body

```json
{
  "code": "BA",
  "name": "Bahia",
  "country_id": 78
}
```

> Sample response body (201)

```json
{
  "id": 9,
  "code": "BA",
  "name": "Bahia",
  "country_id": 78
}
```

<%= url_generation('POST', '/earth/states') %>

This endpoint creates a new state

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
code      | Required, Unique | State ISO Code |
name      | Required | State name |
country_id | Required | ID of the Country of this state |

### Possible responses

- `201 Created`
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

## Update State

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Update State URL:

```plain
  <%= url_generation('PATCH or PUT', '/earth/states/5721', highlight: false) %>
```

> Sample request body

```json
{
  "name": "Brazil, zil, zil"
}
```

> Sample response body (200)

```json
{
  "id": 9,
  "code": "BA",
  "name": "Brazil, zil, zil",
  "country_id": 78
}
```

<%= url_generation('PATCH or PUT', '/earth/states/:id') %>

This endpoint updates a existing state.

### URL parameters

Parameter | Description |
--------- | ----------- |
id        | ID of the State to be updated |

<aside class="notice">In the request body, you only need to provide the attributes that you want to update the value</aside>

### Possible responses

- `200 Success`
- `404 Not Found`
  - The ID provided in the URL do not match any existing state
- `422 Unprocessable entity`
  - The update is violating any of the state validations. In this case, the property `errors` will contain a array with user-friendly messages

<aside class="notice">The validations are the same valid to the <i>create</i> request</aside>

## Delete State

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Delete State URL:

```plain
  <%= url_generation('DELETE', '/earth/states/5721', highlight: false) %>
```

<%= url_generation('DELETE', '/earth/states/:id') %>

This endpoint deletes a state

### URL parameters

Parameter | Description |
--------- | ----------- |
id        | ID of the State to be deleted |

### Possible responses

- `204 No Content`
- `404 Not Found`
  - The ID provided in the URL do not match any existing state

> Sample response body (404) for the State resource

```json
  {
    "error": "The record does not exist or has been deleted",
    "message": "Couldn't find Earth::State with 'id'=5721"
  }
```

> Sample response body (422) for the State resource

```json
  {
    "errors": ["Code can't be blank"]
  }
```
