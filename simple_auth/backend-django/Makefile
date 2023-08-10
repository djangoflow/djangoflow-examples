ACTIVATE=. venv/bin/activate &&

init: venv pip-tools requirements/local.txt .env
	$(ACTIVATE) pip-sync requirements/local.txt

req:	requirements/local.txt requirements/project.txt

clean:
	rm -rf venv

venv:
	python3.9 -m venv venv

pip-tools:
	$(ACTIVATE) pip install --upgrade pip pip-tools


requirements/local.txt: pip-tools requirements/local.in requirements/project.txt
	$(ACTIVATE) pip-compile requirements/local.in

requirements/project.txt: pip-tools requirements/base.in requirements/project.in
	$(ACTIVATE) pip-compile requirements/project.in

.env:
	cp dot.env.example .env
