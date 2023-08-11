ACTIVATE=. venv/bin/activate &&

init: venv pip-tools requirements.txt
	$(ACTIVATE) pip install -r requirements.txt

venv:
	python3.9 -m venv venv

pip-tools:
	$(ACTIVATE) pip install --upgrade pip pip-tools

.PHONY: run
run:
	$(ACTIVATE) ./manage.py migrate && ./manage.py runserver
