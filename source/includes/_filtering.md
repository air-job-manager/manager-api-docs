# Filtering

## How to use

> Example:

```shell
curl "api_endpoint_here?order_by=name&order_seq=DESC&name=Airbus&manufactured_after=may"
```

Many indexes endpoints will allow you to filter your results. In each endpoint documentation, will you find the name of the params allowed for filtering the entity in discussion.
You can send these params in the request via query param.

Parameter | Description
--------- | -----------
[name_of_param]  | Value for filtering
