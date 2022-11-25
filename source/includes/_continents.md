# Continent

## Continents Index
<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>
<%= badge('auth_type', 'Pagination', 'Available', 'green') %>
<%= badge('auth_type', 'Ordenation', 'Available', 'green') %>
<%= badge('auth_type', 'Filtering', 'Available', 'green') %>

> Continents index URL:

```plain
  <%= url_generation('GET', '/earth/continents', highlight: false) %>
```

> Sample response body (200):

```json
  {
    "continents": [
      ...
      {
        "id": 6,
        "name": "South America",
        "countries": [
          ...
          {
            "id": 10,
            "name": "Argentina",
            "latitude": -38.416097,
            "longitude": -63.616672,
            "flag_url": "http://blob.download.url/argentina_flag.svg"
          },
          ...
        ],
      }
      ...
    ]
  }
```

<%= url_generation('GET', '/earth/continents') %>

This endpoint returns all continents registers

### Possible responses

- `200 Success`

## Create Continent

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Create Continent URL:

```plain
  <%= url_generation('POST', '/earth/continents', highlight: false) %>
```

> Sample request body

```json
  {
    "continent": { 
      "code": "EU",
      "name": "Europe"
    }
  }
```

> Sample response body (201)

```json
  {
    "id": 6,
    "code": "EU",
    "name": "Europe",
    "countries": [],
  }
```

<%= url_generation('POST', '/earth/continents') %>

This endpoint creates a new continent

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
code      | Required, Unique | Continent ISO Code |
name      | Required | Continent name |

### Possible responses

- `201 Created`
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

## Update Continent

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Update Continent URL:

```plain
  <%= url_generation('PATCH or PUT', '/earth/continents/5721', highlight: false) %>
```

> Sample request body

```json
  {
    "continent": { 
      "name": "Euro"
    }
  }
```

> Sample response body (200)

```json
  {
    "id": 6,
    "code": "EU",
    "name": "Euro",
    "countries": [],
  }
```

<%= url_generation('PATCH or PUT', '/earth/continents/:id') %>

This endpoint updates a existing continent.

### URL parameters

Parameter | Description |
--------- | ----------- |
id        | ID of the Continent to be updated |

<aside class="notice">In the request body, you only need to provide the attributes that you want to update the value</aside>

### Possible responses

- `200 Success`
- `404 Not Found`
  - The ID provided in the URL do not match any existing continent
- `422 Unprocessable entity`
  - The update is violating any of the continent validations. In this case, the property `errors` will contain a array with user-friendly messages

<aside class="notice">The validations are the same valid to the <i>create</i> request</aside>

## Delete Continent

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Delete Continent URL:

```plain
  <%= url_generation('DELETE', '/earth/continents/5721', highlight: false) %>
```

<%= url_generation('DELETE', '/earth/continents/:id') %>

This endpoint deletes a continent

### URL parameters

Parameter | Description |
--------- | ----------- |
id        | ID of the Continent to be deleted |

### Possible responses

- `204 No Content`
- `404 Not Found`
  - The ID provided in the URL do not match any existing continent

> Sample response body (404) for the Continent resource

```json
  {
    "error": "The record does not exist or has been deleted",
    "message": "Couldn't find Earth::Continent with 'id'=5721"
  }
```

> Sample response body (422) for the Continent resource

```json
  {
    "errors": ["Code can't be blank"]
  }
```
