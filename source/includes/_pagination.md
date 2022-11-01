# Pagination

> You can include the following query params in all indexes requests:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here?page=1&per_page=20"
```

All indexes endpoints accepts the following query params below:

<h3>Query Parameters</h3>

Parameter | Default | Description
--------- | ------- | -----------
page      | 1       | Specify required page
per_page  | 20      | Specify how many itens will return in one page

<aside class="warning">The items <i>total_items</i> and <i>page_count</i> may not be available in all routes to preserve service's performance.</aside>

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
