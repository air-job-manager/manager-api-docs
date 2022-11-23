# Country

## Countries Index

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>
<%= badge('auth_type', 'Pagination', 'Available', 'green') %>
<%= badge('auth_type', 'Ordenation', 'Available', 'green') %>
<%= badge('auth_type', 'Filtering', 'Available', 'green') %>

> Countries index URL:

```plain
  <%= url_generation('GET', '/earth/countries', highlight: false) %>
```

> Sample response body (200):

```json
  {
    "countries": [
      ...
      {
        "id": 10,
        "code": "ARG",
        "name": "Argentina",
        "latitude": -38.416097,
        "longitude": -63.616672,
        "flag_url": "http://blob.download.url/argentina_flag.svg"
      },
      ...
    ],
  }
```

<%= url_generation('GET', '/earth/countries') %>

This endpoint returns all countries registers

### Possible responses

- `200 Success`

## Show Country

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authenticated', 'green') %>

> Show Country URL:

```plain
  <%= url_generation('GET', '/earth/countries/5721', highlight: false) %>
```

> Sample response body (200):

```json
{
  "id": 10,
  "code": "ARG",
  "name": "Argentina",
  "latitude": -38.416097,
  "longitude": -63.616672,
  "flag_url": "http://blob.download.url/argentina_flag.svg"
}
```

<%= url_generation('GET', '/earth/countries/:id') %>

This endpoint returns a country in detail

### Possible responses

- `200 Success`

## Create Country

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Create Country URL:

```plain
  <%= url_generation('POST', '/earth/countries', highlight: false) %>
```

> Sample request body (Multipart Form Data)

```multipart
  code = "BR",
  name = "Brazil"
  latitude = -14.57
  longitude = -51.24
  continent_id = 6
  flag = File (svg or png)
```

> Sample response body (201)

```json
{
  "id": 9,
  "code": "BR",
  "name": "Brazil",
  "latitude": -38.416097,
  "longitude": -63.616672,
  "flag_url": "http://blob.download.url/brazil_flag.svg"
}
```

<%= url_generation('POST', '/earth/countries') %>

This endpoint creates a new country

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
code      | Required, Unique | Country ISO Code |
name      | Required | Country name |
latitude      | Required | Latitude of a point inside country, used for map translation |
longitude     | Required | Longitude of a point inside country, used for map translation |
longitude     | Optional, .svg or .png | File of the country's flag |

### Possible responses

- `201 Created`
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

## Update Country

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Update Country URL:

```plain
  <%= url_generation('PATCH or PUT', '/earth/countries/5721', highlight: false) %>
```

> Sample request body

```multipart
  name = "Brazil, zil, zil"
```

> Sample response body (200)

```json
 {
  "id": 9,
  "code": "BR",
  "name": "Brazil, zil, zil",
  "latitude": -38.416097,
  "longitude": -63.616672,
  "flag_url": "http://blob.download.url/brazil_flag.svg"
}
```

<%= url_generation('PATCH or PUT', '/earth/countries/:id') %>

This endpoint updates a existing country.

### URL parameters

Parameter | Description |
--------- | ----------- |
id        | ID of the Country to be updated |

<aside class="notice">In the request body, you only need to provide the attributes that you want to update the value</aside>

### Possible responses

- `200 Success`
- `404 Not Found`
  - The ID provided in the URL do not match any existing country
- `422 Unprocessable entity`
  - The update is violating any of the country validations. In this case, the property `errors` will contain a array with user-friendly messages

<aside class="notice">The validations are the same valid to the <i>create</i> request</aside>

## Delete Country

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Delete Country URL:

```plain
  <%= url_generation('DELETE', '/earth/countries/5721', highlight: false) %>
```

<%= url_generation('DELETE', '/earth/countries/:id') %>

This endpoint deletes a country

### URL parameters

Parameter | Description |
--------- | ----------- |
id        | ID of the Country to be deleted |

### Possible responses

- `204 No Content`
- `404 Not Found`
  - The ID provided in the URL do not match any existing country

> Sample response body (404) for the Country resource

```json
  {
    "error": "The record does not exist or has been deleted",
    "message": "Couldn't find Earth::Country with 'id'=5721"
  }
```

> Sample response body (422) for the Country resource

```json
  {
    "errors": ["Code can't be blank"]
  }
```
