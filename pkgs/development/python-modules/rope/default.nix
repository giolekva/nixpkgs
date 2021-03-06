{ lib, stdenv, buildPythonPackage, fetchPypi, pythonAtLeast, nose }:

buildPythonPackage rec {
  pname = "rope";
  version = "0.18.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "786b5c38c530d4846aa68a42604f61b4e69a493390e3ca11b88df0fbfdc3ed04";
  };

  checkInputs = [ nose ];
  checkPhase = ''
    # tracked upstream here https://github.com/python-rope/rope/issues/247
    NOSE_IGNORE_FILES=type_hinting_test.py nosetests ropetest
  '';

  meta = with lib; {
    description = "Python refactoring library";
    homepage = "https://github.com/python-rope/rope";
    maintainers = with maintainers; [ goibhniu ];
    license = licenses.gpl2;
  };
}
