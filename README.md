This is a template for future Python projects. It includes package management, tests, linting, Git pre-commit hooks, and a multi-stage Dockerfile for testing and deployment. Additionally, there's a fully automated CI/CD pipeline set up to run on my home Jenkins server. However, anyone can create their own GitHub app credentials and change the webhook URL to link it to their own Jenkins server.

### Features
- Package management using poetry
- Testing using pytest
- Extremely fast linting using ruff
- Git pre-commit hooks that run lint checks and tests
- Fully automated CI/CD pipeline that runs jobs on Jenkins after each push
- PR checks that won't allow merge until pipeline passes on Jenkins
- Multi stage dockerfile for both testing and deployment
- Branch protection rules preventing pushes directly to main unless through PR

### Showcase

### What to do after copying template

1. `poetry install`
2. `poetry run pre-commit install`

### Jenkins setup
While the main purpose of this repo is to act as a template, it's also a personal project to develop skills around CI/CD pipelines so I will briefly explain my Jenkins server setup.

I have two virtual machines running on a home server, one is the jenkins master and I have one jenkins agent with docker installed. I exposed the master node by forwarding incoming requests to a specific port, this way GitHub can communicate with my server for any event such as a push or a PR. Inside my Jenkins server I have an organization folder that scans my account every minute so that it will automatically create a new multibranch job when I make a new repo that has a Jenkinsfile in it.

Regarding the Jenkinsfile itself, I initially wanted to use a docker agent, however, because of unexpected behavior of the docker plugin and recommendations by members of the Jenkins community, I decided against it. Instead, I created a Dockerfile myself with a testing stage that still has the dev dependencies. Since the jenkins agent has docker installed, it's able to build this image and then I run the commands like `docker run --rm $(docker build --target=testing -q .) some command with args`.

Right now, I'm only using the pipeline for testing, however in the future I could also add a deployment stage if needed.

### Room for improvement
- Implent coverage and export data to github repo in tag or in jenkins
- Separate tests into unit tests and implementation tests with mock objects
    - For unit tests, can also have black box and glass box, and implement mutation for glass box
