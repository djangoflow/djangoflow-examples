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
