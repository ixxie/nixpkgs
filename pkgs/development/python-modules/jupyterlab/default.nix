{ lib
, buildPythonPackage
, fetchurl
, notebook
}:

buildPythonPackage rec {
  name = "jupyterlab-${version}";
  version = "0.4.1";

  src = fetchurl {
    url = "mirror://pypi/j/jupyterlab/${name}.tar.gz";
    sha256 = "91dc4d7dfb1e6ab97e28d6e3a2fc38f5f65d368201c00fd0ed077519258e67bb";
  };

  propagatedBuildInputs = [ notebook ];

  # No tests in archive
  doCheck = false;

  meta = with lib; {
    description = "Jupyter lab environment notebook server extension.";
    license = [ licenses.bsd3 ];
    homepage = "http://jupyter.org/";
  };
}
