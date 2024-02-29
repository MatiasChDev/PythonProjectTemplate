from src.python_project_template.dummy_module import dummy_func


def test_dummy():
    result: int = dummy_func()
    assert result == 1

