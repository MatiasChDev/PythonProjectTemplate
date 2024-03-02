FROM python:3.11-alpine3.19 as builder

RUN pip install poetry==1.8.1

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry install --no-root && rm -rf $POETRY_CACHE_DIR

FROM builder as testing

COPY src ./src/
COPY tests ./tests/
COPY noxfile.py ./

FROM builder as removing-dev-dependencies

RUN poetry install --without dev --sync && rm -rf $POETRY_CACHE_DIR

FROM python:3.11-alpine3.19 as runtime

ENV VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:$PATH"

COPY --from=removing-dev-dependencies ${VIRTUAL_ENV} ${VIRTUAL_ENV}
COPY src ./src/

CMD ["python", "-m", "src.python_project_template.app"]
