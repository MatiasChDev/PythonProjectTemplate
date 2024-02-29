FROM python:3.11-alpine3.19

RUN pip install poetry==1.8.1

WORKDIR /app

COPY . .

# Run tests and different stages as part of docker container to take advantage of caching
# Use docker build --target to run specific stages during tests
# When installing dependencies, only copy the poetry files so it doesnt delete the cached step everytime I change a src file

RUN poetry install

CMD ["poetry", "run", "python", "-m", "src.python_project_template.app"]
