VENV=../../venv
ACTIVATE=. $(VENV)/bin/activate &&

init: $(VENV) pip-tools requirements.txt
	$(ACTIVATE) pip install -r requirements.txt

$(VENV):
	python -m venv $(VENV)

pip-tools:
	$(ACTIVATE) pip install --upgrade pip pip-tools

.PHONY: run
run:
	$(ACTIVATE) ./manage.py migrate && ./manage.py runserver
