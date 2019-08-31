from testscase import test_udacity


def test_main():
    result = test_udacity.call_web_service()
    assert result.status_code == 200


def test_predict():
    result = test_udacity.post_music()
    assert result.status_code == 200
