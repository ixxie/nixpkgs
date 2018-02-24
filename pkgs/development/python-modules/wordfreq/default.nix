
{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
}:

buildPythonPackage rec {
  pname = "wordfreq";
  version = "1.6.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0rx1h40qsdvgii28501dzs52rp5r6rpisrdayc7f1k1521rx47k7";
  };

  # No tests in archive
  #doCheck = false;
   
  propagatedBuildInputs = [ ];

  disabled = pythonOlder "3.4";

  meta = with lib; {
    description = "Authenticate JupyterHub users with common OAuth providers, including GitHub, Bitbucket, and more.";
    homepage =  https://github.com/jupyterhub/oauthenticator;
    license = licenses.bsd3;
    maintainers = with maintainers; [ ixxie ];
  };
}
