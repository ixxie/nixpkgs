{ lib
, buildPythonPackage
, nose
, notebook
, pandas
, ipywidgets
, py4j
, fetchPypi
}:

buildPythonPackage rec {
  pname = "beakerx";
  version = "0.17.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "19fjdvc44iwy036gcbn0lw9x2idx4fr7z6lg7cb6imkaj9h2g023";
  };

  # Pypi tarball contains no tests
  doCheck = false;
  
  propagatedBuildInputs = [ notebook pandas ipywidgets py4j ];

  meta = with lib; {
    description = "A collection of kernels and extensions to Jupyter, providing JVM support, interactive plots, tables, forms, publishing, and more";
    homepage = http://beakerx.com;
    license = licenses.asl20;
    maintainers = with maintainers; [ ixxie ];
  };
}
