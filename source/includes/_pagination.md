# Pagination

## How to use

> You can include the following query params in all indexes requests:

```shell
curl "api_endpoint_here?page=1&per_page=20"
```

Unless otherwise specified in the endpoint documentation, all indexes endpoints accepts the following query params below:

Parameter | Default | Description
--------- | ------- | -----------
page      | 1       | Specify required page
per_page  | 20      | Specify how many itens will return in one page

<aside class="warning">The response items <i>total_items</i> and <i>page_count</i> may not be available in all routes to preserve service's performance.</aside>

> In the responses, you'll find the pagination data for your request

```json
{
  ...
  "pagination": {
    "current_page": 1,
    "total_items": 100,
    "items_per_page": 20,
    "page_count": 5
  }
  ...
}
```

<aside class="notice">For the sake of simplicity, the responses examples will omit this pagination data.</aside>
