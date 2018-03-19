{ lib
, buildPythonPackage
, regex
, langcodes
, ftfy
, msgpack
, pythonOlder
, fetchPypi
, fetchFromGitHub
}:

buildPythonPackage rec {
  pname = "wordfreq";
  version = "2.0";


   src = fetchPypi {
    inherit pname version;
    sha256 = "0zbpjghv6z7xlq3445pb7fdbsz71iy4k2hv9lj67574lxmcgsabg";
   };
#  src = fetchFromGitHub {
#    owner = "ixxie";
#    repo = "wordfreq";
#    rev = "9013fa8991d98f4907d5b75280c6a23aa2742874"; 
#    sha256 = "1p31qrvr0wnrg0zdb78s59pcy0vwzlfdrk9ffcm7wb656kf6cbby";
#  };
   
  propagatedBuildInputs = [ regex langcodes ftfy msgpack ];

  disabled = pythonOlder "3.4";

  meta = with lib; {
    description = "A Python library for looking up the frequencies of words in many languages, based on many sources of data.";
    homepage =  https://github.com/LuminosoInsight/wordfreq/;
    license = licenses.mit;
    maintainers = with maintainers; [ ixxie ];
  };
}
