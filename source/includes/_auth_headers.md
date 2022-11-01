# Authentication

> Remember to include the Authorization header:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: Bearer my_token"
```

> Make sure to replace `my_token` with your Access Token.

All Air Job Manager services uses Json Web Tokens to identify and authorize our users.

Air Job Manager expects for the `Authorization` header in the `Bearer token` format to be included in all requests that authentication is required.

`Authorization: Bearer my_token`

Info on how to retrieve tokens, see the <a href="#auth">Auth session</a>

<aside class="notice">
  All endpoints will point out which kind of authentication is required. It can be one of the following:
  <br />
  1. Anonymous - public endpoint (no authentication required)
  <br />
  2. Authenticated - private endpoint (any logged user will grant access)
  <br />
  3. Authorized - private endpoint (only users with the required permission(s) will grant access)
</aside>

<aside class="notice">
  The Manager service handles all authentication-related features, this means that you may be required to provide tokens emitted using this service to authenticate in other Air Job Manager services, for example the Tracker service.
</aside>

<aside class="warning">
  Be careful where you paste your tokens. JWTs are credentials which can grant access to resources. If someone elses has a token that you emmitted, you'll be impersonated by this person while he is using the API.
</aside>
