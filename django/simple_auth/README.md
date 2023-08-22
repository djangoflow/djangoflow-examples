## Simple Auth Backend for Django

Running the example:

```
make
make run
```

Check `http://127.0.0.1:8000/api/v1/` in your browser.

### Obtaining a token

Request OTP code:

```
curl http://127.0.0.1:8000/api/v1/auth/otp/ \
    -H "content-type: application/json" \
    --data '{"email": "test@te.st"}'
```

Check console output for the token and request for the JWT.

```
curl http://127.0.0.1:8000/api/v1/auth/token/ \
    -H "content-type: application/json" \
    --data '{"email": "test@te.st", "code": "217508"}'

>>> {"token":"eyJhbGciOiJIUzI1NiIs......."}
```


### Social authentication

We use [Python Social Auth](https://python-social-auth.readthedocs.io/en/latest/) for social authentication.

#### Google

The Google OAuth2 backend works just of the box. We use [OAuth2 implicit flow](https://oauth.net/2/grant-types/implicit/), so you don't need to set up any additional configuration.

After you obtain access_token on client side you can request JWT token from the backend:

```
curl http://127.0.0.1:8000/api/v1/auth/social/ \
    -H "content-type: application/json" \
    --data '{"provider": "google-oauth2", "access_token": "ya29.a0AfB_byAQZ5DYqYxv9o8s9c9MHQp......."}'

>>> {"token":"eyJhbGciOiJIU........","provider":"google-oauth2"}
```

If you have any issues, please check the [documentation](https://python-social-auth.readthedocs.io/en/latest/backends/google.html#google-oauth2).


#### Facebook


To enable Facebook OAuth2 you need to set up `SOCIAL_AUTH_FACEBOOK_KEY` and `SOCIAL_AUTH_FACEBOOK_SECRET` in your `settings.py` file. You can find more info in the [documentation](https://python-social-auth.readthedocs.io/en/latest/backends/facebook.html#oauth2).


#### Other providers

To enable other providers you need to add a backend to `AUTHENTICATION_BACKENDS` and optionally set up `SOCIAL_AUTH_<PROVIDER>_KEY` and `SOCIAL_AUTH_<PROVIDER>_SECRET` in your `settings.py` file. You can find more info in the [documentation](https://python-social-auth.readthedocs.io/en/latest/backends/index.html).
