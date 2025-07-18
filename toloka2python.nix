{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  wheel,
  beautifulsoup4,
  requests,
}:
buildPythonPackage {
  pname = "toloka2python";
  version = "unstable-2024-11-09";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "CakesTwix";
    repo = "toloka2python";
    rev = "ce15d246df756644efc7c6681489e46b6fd6a38b";
    hash = "sha256-/3Pf4cWrLmy/sWmElF4ux5LKJZUetJXfR9TyZ1+EASg=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    beautifulsoup4
    requests
    setuptools
  ];

  pythonImportsCheck = [
    "toloka2python"
  ];

  meta = {
    description = "Бібліотека на пітоні для взаємодії з українським торрент-трекером Toloka";
    homepage = "https://github.com/CakesTwix/toloka2python";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
}
