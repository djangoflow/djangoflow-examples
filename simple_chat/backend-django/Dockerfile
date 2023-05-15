FROM djangoflow/docker-django:3.9

COPY ./requirements/project.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt \
    && rm /requirements.txt

COPY --chown=django:django . /app

USER django
