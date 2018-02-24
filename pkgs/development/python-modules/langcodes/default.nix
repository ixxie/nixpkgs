{ lib
, buildPythonPackage
, marisa-trie
, pythonOlder
, fetchPypi
}:

buildPythonPackage rec {
  pname = "langcodes";
  version = "1.4.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "02pbf9cy1i4vkikgq9azb0v9gpsn4fxvaxdjgdasvzdycpws9yp9";
  };

  # No tests in archive
  #doCheck = false;
   
  propagatedBuildInputs = [ marisa-trie ];

  disabled = pythonOlder "3.4";

  meta = with lib; {
    description = "langcodes is a toolkit for working with and comparing the standardized codes for languages, such as ‘en’ for English, ‘es’ for Spanish, and ‘zh-Hant’ for Traditional Chinese.";
    homepage =  http://github.com/LuminosoInsight/langcodes;
    license = licenses.mit;
    maintainers = with maintainers; [ ixxie ];
  };
}
