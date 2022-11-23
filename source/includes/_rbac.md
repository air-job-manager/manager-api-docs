# Role-Based-Access-Control system (RBAC)

## Claims Index
<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>
<%= badge('auth_type', 'Pagination', 'Available', 'green') %>
<%= badge('auth_type', 'Ordenation', 'Unavailable', 'red') %>
<%= badge('auth_type', 'Filtering', 'Unavailable', 'red') %>

> Claims index URL:

```plain
  <%= url_generation('GET', '/auth/claims', highlight: false) %>
```

> Sample response body (200):

```json
{
 "claims": [
    ...
    {
      "id": 1,
      "name": "schedule#manage",
      "description": "Allow user to manage the aircraft schedule",
      "assignable": false
    },
    ...
  ]
}
```

<%= url_generation('GET', '/auth/claims') %>

This endpoint returns all claims registers

### Possible responses

- `200 Success`

## Roles Index
<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>
<%= badge('auth_type', 'Pagination', 'Available', 'green') %>
<%= badge('auth_type', 'Ordenation', 'Unavailable', 'red') %>
<%= badge('auth_type', 'Filtering', 'Unavailable', 'red') %>

> Roles index URL:

```plain
  <%= url_generation('GET', '/auth/roles', highlight: false) %>
```

> Sample response body (200):

```json
{
 "roles": [
    ...
    {
      "id": 1,
      "name": "System Admin",
      "description": "Can do anything. Part of the Air Job Manager engineering team",
      "assignable": false,
      "claims": [
        ...
        {
          "id": 1,
          "name": "schedule#manage",
          "description": "Allow user to manage the aircraft schedule",
          "assignable": false
        },
        ...
      ],
    }
    ...
  ]
}
```

<%= url_generation('GET', '/auth/roles') %>

This endpoint returns all roles registers

### Possible responses

- `200 Success`

## Create claim

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Create Claim URL:

```plain
  <%= url_generation('POST', '/auth/claim', highlight: false) %>
```

> Sample request body

```json
  {
    "claim": {
      "name": "Sample",
      "assignable": true
    }
  }
```

> Sample response body (201)

```json
  {
    "claim": {
      "id": 4,
      "name": "Sample",
      "description": null,
      "assignable": true
    }
  }
```

<%= url_generation('POST', '/auth/claim') %>

This endpoint creates a new claim

### Body parameters

Parameter | Validations | Default | Description |
--------- | ----------- | ------- | ----------- |
name        | Required, Unique | None | Claim name |
description | None | None | Optional user-friendly text description |
assignable  | ---- | False | Determines which groupment may receive this claim |

### Possible responses

- `201 Created`
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

## Delete claim

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Delete Claim URL:

```plain
  <%= url_generation('DELETE', '/auth/claim/5721', highlight: false) %>
```

<%= url_generation('DELETE', '/auth/claim/:id') %>

This endpoint deletes a claim

### URL parameters

Parameter | Description |
--------- | ----------- |
id        | ID of the Claim to be deleted |

### Possible responses

- `204 No Content`
- `404 Not Found`
  - The ID provided in the URL do not match any existing claim

## Create role

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Create Claim URL:

```plain
  <%= url_generation('POST', '/auth/role', highlight: false) %>
```

> Sample request body

```json
  {
    "role": {
      "name": "Admin",
      "description": "Can do everything"
    }
  }
```

> Sample response body (201)

```json
  {
    "role": {
      "id": 2,
      "name": "Admin",
      "description": "Can do everything",
      "assignable": false,
      "claims": []
    }
  }
```

<%= url_generation('POST', '/auth/role') %>

This endpoint creates a new role

### Body parameters

Parameter | Validations | Default | Description |
--------- | ----------- | ------- | ----------- |
name        | Required, Unique | None | Role name |
description | None | None | Optional user-friendly text description |
assignable  | None | False | Determines which groupment may receive this role |

### Possible responses

- `201 Created`
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

## Delete role

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Delete Role URL:

```plain
  <%= url_generation('DELETE', '/auth/role/5721', highlight: false) %>
```

<%= url_generation('DELETE', '/auth/role/:id') %>

This endpoint deletes a role

### URL parameters

Parameter | Description |
--------- | ----------- |
id        | ID of the Role to be deleted |

### Possible responses

- `204 No Content`
- `404 Not Found`
  - The ID provided in the URL do not match any existing role

## Claim assignment

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Claim Assignment URL:

```plain
  <%= url_generation('POST', '/auth/claim/5721/assign', highlight: false) %>
```

> Sample request body

```json
  {
    "role_id": 2
  }
```

> Sample request body

```json
  {
    "user_id": 1
  }
```

> Sample response body (200) - Assigning to Role

```json
{
  "claim": {
    "id": 5,
    "name": "Sample2",
    "description": null,
    "assignable": false
  },
  "role": {
    "id": 1,
    "name": "System Admin",
    "description": "Can do anything. Part of the Air Job Manager engineering team",
    "assignable": false,
    "claims": [
      ...
      {
        "id": 5,
        "name": "Sample2",
        "description": null,
        "assignable": false
      }
      ...
    ]
  }
}
```

> Sample response body (200) - Assigning to User

```json
{
  "claim": {
    "id": 4,
    "name": "Sample",
    "description": null,
    "assignable": true
  },
  "user": {
    "id": 1,
    "name": "Hugo Fonseca",
    "email": "hugo.fonseca@airjobmanager.com",
    "roles": [
      ...
    ],
    "claims": [
      ...
      {
        "id": 4,
        "name": "Sample",
        "description": null,
        "assignable": true
      },
      ...
    ],
  },
}
```

<%= url_generation('POST', '/auth/claim/:id/assign') %>

This endpoint assigns a existing claim to a role or user

### URL parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
id  | None        | ID of the `Claim` to be assigned |

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
role_id   | None        | ID of the `Role` to receive the claim |
user_id   | None        | ID of the `User` to receive the claim |

<aside class="notice">
  Claims can be assigned/unassigned to <i>Roles</i> or directly to <i>Users</i>. In case you provide both <i>role_id</i> and <i>user_id</i> in a request, the <i>role</i> will take precedence over the <i>user</i>
</aside>

### Possible responses

- `200 Success`
- `404 Not Found`
  - Any of the entities envolved, could not be found, either `Claim`, `Role` or `User`.
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

<aside class="warning">
  <i>Claims</i> with can only be assigned to <i>Roles</i> with the same assignability. In other words, <i>claim.assignable</i> must equals <i>role.assignable</i>.
</aside>

## Claim unassignment

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Claim Unassignment URL:

```plain
  <%= url_generation('POST', '/auth/claim/5721/unassign', highlight: false) %>
```

> Sample request body

```json
  {
    "role_id": 2
  }
```

> Sample request body

```json
  {
    "user_id": 1
  }
```

> Sample response body (200) - Unassigning from Role

```json
{
  "claim": {
    "id": 5,
    "name": "Sample2",
    "description": null,
    "assignable": false
  },
  "role": {
    "id": 1,
    "name": "System Admin",
    "description": "Can do anything. Part of the Air Job Manager engineering team",
    "assignable": false,
    "claims": [
      ...
    ]
  }
}
```

> Sample response body (200) - Unassigning from User

```json
{
  "claim": {
    "id": 4,
    "name": "Sample",
    "description": null,
    "assignable": true
  },
  "user": {
    "id": 1,
    "name": "Hugo Fonseca",
    "email": "hugo.fonseca@airjobmanager.com",
    "roles": [
      ...
    ],
    "claims": [
      ...
    ],
  },
}
```

<%= url_generation('POST', '/auth/claim/:id/unassign') %>

This endpoint unassigns a existing claim from a role or user

### URL parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
id  | None        | ID of the `Claim` to be unassigned |

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
role_id   | None        | ID of the `Role` to remove the claim |
user_id   | None        | ID of the `User` to remove the claim |

<aside class="notice">
  Claims can be assigned/unassigned to <i>Roles</i> or directly to <i>Users</i>. In case you provide both <i>role_id</i> and <i>user_id</i> in a request, the <i>role</i> will take precedence over the <i>user</i>
</aside>

### Possible responses

- `200 Success`
- `404 Not Found`
  - Any of the entities envolved, could not be found, either `Claim`, `Role` or `User`.
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

<aside class="warning">
  <i>Claims</i> with can only be assigned to <i>Roles</i> with the same assignability. In other words, <i>claim.assignable</i> must equals <i>role.assignable</i>.
</aside>

## Role assignment

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Role Assignment URL:

```plain
  <%= url_generation('POST', '/auth/role/5721/assign', highlight: false) %>
```

> Sample request body

```json
  {
    "user_id": 1
  }
```

> Sample response body (200) - Assigning to User

```json
{
  "role": {
    "id": 2,
    "name": "Manipulate Sound",
    "description": "Can increase volume",
    "assignable": false,
    "claims": [
      ...
    ],
  },
  "user": {
    "id": 1,
    "name": "Hugo Fonseca",
    "email": "hugo.fonseca@airjobmanager.com",
    "roles": [
      ...
      {
        "id": 2,
        "name": "Manipulate Sound",
        "description": "Can increase volume",
        "assignable": false,
        "claims": [
          ...
        ],
      },
      ...
    ],
    "claims": [
      ...
    ],
  },
}
```

<%= url_generation('POST', '/auth/role/:id/assign') %>

This endpoint assigns a existing role to a user

### URL parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
id  | None        | ID of the `Role` to be assigned |

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
user_id   | None        | ID of the `User` to receive the role |

### Possible responses

- `200 Success`
- `404 Not Found`
  - Any of the entities envolved, could not be found, either `Role` or `User`.
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

## Role unassignment

<!-- Endpoint badges -->
<%= badge('auth_type', 'Auth', 'Authorized', 'red') %>

> Role Unassignment URL:

```plain
  <%= url_generation('POST', '/auth/role/5721/unassign', highlight: false) %>
```

> Sample request body

```json
  {
    "user_id": 1
  }
```

> Sample response body (200) - Unassigning from User

```json
{
  "role": {
    "id": 2,
    "name": "Manipulate Sound",
    "description": "Can increase volume",
    "assignable": false,
    "claims": [
      ...
    ],
  },
  "user": {
    "id": 1,
    "name": "Hugo Fonseca",
    "email": "hugo.fonseca@airjobmanager.com",
    "roles": [
      ...
    ],
    "claims": [
      ...
    ],
  },
}
```

<%= url_generation('POST', '/auth/role/:id/unassign') %>

This endpoint unassigns a existing role from a user

### URL parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
id   | None        | ID of the `Role` to be unassigned |

### Body parameters

Parameter | Validations | Description |
--------- | ----------- | ----------- |
user_id   | None        | ID of the `User` to remove the role |

### Possible responses

- `200 Success`
- `404 Not Found`
  - Any of the entities envolved, could not be found, either `Role` or `User`.
- `422 Unprocessable entity`
  - The creation is violating any of the validations described in the body parameters. In this case, the property `errors` will contain a array with user-friendly messages

> Sample response body (404) for the Claim resource

```json
  {
    "error": "The record does not exist or has been deleted",
    "message": "Couldn't find Auth::Claim with 'id'=5721"
  }
```

> Sample response body (422) for the Claim resource and associations

```json
  {
    "errors": ["Name can't be blank"]
  }
```

> Sample response body (404) for the Role resource

```json
  {
    "error": "The record does not exist or has been deleted",
    "message": "Couldn't find Auth::Role with 'id'=5721"
  }
```

> Sample response body (422) for the Role resource and associations

```json
  {
    "errors": ["Name has already been taken"]
  }
```
