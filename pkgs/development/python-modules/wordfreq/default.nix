{ lib
, buildPythonPackage
, regex
, langcodes
, ftfy
, msgpack
, pythonOlder
, fetchFromGitHub
}:

buildPythonPackage rec {
  pname = "wordfreq";
  version = "1.7.0";

  src = /home/ixxie/wordfreq;
   
  propagatedBuildInputs = [ regex langcodes ftfy msgpack ];

  disabled = pythonOlder "3.4";

  meta = with lib; {
    description = "A Python library for looking up the frequencies of words in many languages, based on many sources of data.";
    homepage =  https://github.com/LuminosoInsight/wordfreq/;
    license = licenses.mit;
    maintainers = with maintainers; [ ixxie ];
  };
}
