This serves as a template for all of my future python projects. It has all basic needs such as package management using poetry, testing and coverage testing with pytest, linting with ruff, as well as running tests for these in separate sessions using nox. It also has git hooks set up so it won't allow me to commit bad code by checking linting/tests, and also has a Jenkins CI/CD pipeline template that will when any PR is created/updated to prevent bad merges. Finally, it also has a DOCKERFILE template to easily containerize all my projects, and part of the CI/CD pipeline is to check that the docker image will build.

TODO:
- Git hooks (linting, unit tests and poetry)
- PR template
- Cleanup leftover dev comments

Showcase

Features

What to do after copying template

Mention jenkins setup

Room for improvement:
- Multi stage dockerfile
- implent coverage and export data to github repo in tag or in jenkins
- Separate tests into unit tests and implementation tests with mock objects
    - for unit tests, can also have black box and glass box, and implement mutation for glass box
- Separate dev dependencies in pyproject
- Mention pre-commit installation in instructions or automate it
