FROM python:3.11-alpine3.19

RUN pip install poetry==1.7.1

WORKDIR /app

COPY . .

RUN poetry install

CMD ["poetry", "run", "python", "-m", "src.python_project_template.app"]
