{ lib
, buildPythonPackage
, fetchPypi
, notebook
, jupyterlab_launcher
, ipython_genutils
, nodejs
, pandas
, ipywidgets
, futures
, subprocess32
, pythonOlder
, pytest
, requests
, pytest_check_links
, selenium
}:

buildPythonPackage rec {
  pname = "jupyterlab";
  version = "0.32.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0m3m0wq71by9k4ldblsf2jcvvdgkhg17w99sj7pkhbnvl9b0cac8";
  };
  
  propagatedBuildInputs = [
    jupyterlab_launcher
    notebook
    ipython_genutils
    nodejs
    ipywidgets
    pandas
  ] ++ (
    if pythonOlder "3.0"
    then [
      futures
      subprocess32
      ]
    else []
  );

  checkInputs = [
    pytest
    requests
    pytest_check_links
    selenium
  ];
  
  doCheck = true;

  checkPhase = ''
    mkdir ./tmp-home
    export HOME=./tmp-home
    pytest
  '';
  
  meta = with lib; {
    description = "Jupyter lab environment notebook server extension.";
    license = [ licenses.bsd3 ];
    homepage = "http://jupyter.org/";
  };
}
