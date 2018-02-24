{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "marisa-trie";
  version = "0.7.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1n4pxnaranbh3x2fcqxwh8j1z2918vy7i4q1z4jn75m9rkm5h8ia";
  };

  meta = with lib; {
    description = "Static memory-efficient Trie-like structures for Python (2.x and 3.x) based on marisa-trie C++ library.";
    homepage =  https://github.com/kmike/marisa-trie;
    license = licenses.mit;
    maintainers = with maintainers; [ ixxie ];
  };
}
