# Localization

> You can include the lng query param in all your requests:

```shell
curl "api_endpoint_here?lng=en-US"
```

All endpoints accepts a query param called `lng` for you to choose which language you want the response.
In the response headers, you'll find the `Locale` header, specifying which language was used.

### Localization Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
lng | en-US | Set the language to use in the response

<aside class="success">Available locales: en-US, pt-BR</aside>
<aside class="notice">For the sake of simplicity, these docs will only present the responses in the en-US localization</aside>
