# djangoflow-df-chat


## Local development environment

1. Clone the repo
2. Make sure you have `python3.9` and `pip3` installed and optionally docker if you plan to use `redis` and `postgresql`
3. `make init` - will set up virtual environment and requirements
4. Run `sh ./tools/start-server.sh` to start the server

The project comes with pre-defined run targets for the `migrate` and `runserver`

To run a chat example you need:

- Create two superusers via `./manage.py createsuperuser`
- Open http://localhost:8000/api/v1/auth/token/ and obtain a token for each user
- Create chat room via admin http://localhost:8000/admin/chat/room/add/
- Open http://localhost:8000/chat/<chat_id>/?token=<token> in two different browsers
- Start chatting. You should see messages appear in both browsers
