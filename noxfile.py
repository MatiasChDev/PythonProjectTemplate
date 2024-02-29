import nox


@nox.session
def lint(session):
    session.install("ruff")
    session.run("ruff", "check", ".")


@nox.session
def tests(session):
    session.run(
        "poetry",
        "export",
        "-f",
        "requirements.txt",
        "--output",
        "requirements.txt",
        external=True,
    )
    session.install("-r", "requirements.txt")
    session.install("pytest")
    session.run("pytest")
