{ lib
, buildPythonPackage
, fetchPypi
, pytest
, html5lib
, six
, nbformat
, nbconvert
}:

buildPythonPackage rec {
  
  pname = "pytest_check_links";
  version = "0.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0vdfjxlyl81qa8j82m93rb6jnpf67vd04w8nv0sr6m0xi6wwax2d";
  };

  propagatedBuildInputs = [
    pytest
    html5lib
    six
    nbformat
    nbconvert
  ];
  
  doCheck = true;

  meta = with lib; {
    description = "Jupyter lab environment notebook server extension.";
    license = [ licenses.bsd3 ];
    homepage = "http://jupyter.org/";
  };
}
