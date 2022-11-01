# Errors

The Manager API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Your access token is incorrect. See <a href="#authentication">Authentication session</a> for details.
403 | Forbidden -- You're missing the necessary permissions to access the resource you're requesting.
404 | Not Found -- You're requesting a resource that could not be found.
406 | Not Acceptable -- You requested a format that isn't json.
422 | Unprocessable entity -- You requested some action that conflicts with the current state of the application.
429 | Too Many Requests -- You're doing too much requests! Slow down!
500 | Internal Server Error -- We had a problem with our server.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

If you're constantly receiving errors with 5XX status codes, please check our status page, or send a e-mail to [Support](mailto:suporte@airjobmanager.com)
