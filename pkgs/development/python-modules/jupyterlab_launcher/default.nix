{ lib
, buildPythonPackage
, fetchPypi
, notebook
, jsonschema
}:

buildPythonPackage rec {
  pname = "jupyterlab_launcher";
  version = "0.10.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1v1ir182zm2dl14lqvqjhx2x40wnp0i32n6rldxnm1allfpld1n7";
  };

  propagatedBuildInputs = [ notebook jsonschema ];

  # No tests in archive
  doCheck = false;

  meta = with lib; {
    description = "Jupyter lab environment notebook server extension.";
    license = [ licenses.bsd3 ];
    homepage = "http://jupyter.org/";
  };
}
