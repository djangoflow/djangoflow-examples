#!python3
import secrets

RANDOM_PLACEHOLDER = "%randstr%"

with open(".env", "w") as env_f:
    with open("dot.env.example") as f:
        for line in f:
            line = line.replace(RANDOM_PLACEHOLDER, secrets.token_hex(16))
            env_f.write(line)
