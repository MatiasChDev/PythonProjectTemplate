This serves as a template for all of my future python projects. It has all basic needs such as package management using poetry, testing and coverage testing with pytest, linting with ruff, as well as running tests for these in separate sessions using nox. It also has git hooks set up so it won't allow me to commit bad code by checking linting/tests, and also has a Jenkins CI/CD pipeline template that will when any PR is created/updated to prevent bad merges. Finally, it also has a DOCKERFILE template to easily containerize all my projects, and part of the CI/CD pipeline is to check that the docker image will build.

TODO:
- Poetry
- Pytest
- Ruff
- Nox
- Git hooks
- Dockerfile
- Setup jenkins
- Prevent merges unless Jenkins approves
