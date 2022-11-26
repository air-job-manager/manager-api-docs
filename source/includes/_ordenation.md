# Ordenation

## How to use

> You can include the following query params in all indexes requests:

```shell
curl "api_endpoint_here?order_by=name&order_seq=DESC"
```

Unless otherwise specified in the endpoint documentation, all indexes endpoints accepts the following query params below:

Parameter | Default | Description
--------- | ------- | -----------
order_by  | None    | Specify the attribute to perform the ordenation
order_seq | ASC     | Specify the order. Can be 'ASC' for ascending order or 'DESC' for descending order.

<aside class="warning">The <i>order_seq</i> parameter do not have any effect without the <i>order_by</i> parameter.</aside>
