{ lib
, buildPythonPackage
, fetchPypi
, fixtures
, mock
, pbr
, pytest-cov
, pytestCheckHook
, pythonOlder
, requests
, six
}:

buildPythonPackage rec {
  pname = "pyopnsense";
  version = "0.4.0";
  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-3DKlVrOtMa55gTu557pgojRpdgrO5pEZ3L+9gKoW9yg=";
  };

  propagatedBuildInputs = [
    pbr
    six
    requests
  ];

  nativeCheckInputs = [
    fixtures
    mock
    pytest-cov
    pytestCheckHook
  ];

  pythonImportsCheck = [ "pyopnsense" ];

  meta = with lib; {
    description = "Python client for the OPNsense API";
    homepage = "https://github.com/mtreinish/pyopnsense";
    license = with licenses; [ gpl3Plus ];
    maintainers = with maintainers; [ fab ];
  };
}
