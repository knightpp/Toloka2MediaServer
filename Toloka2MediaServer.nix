{
  lib,
  python3,
}:
python3.pkgs.buildPythonApplication {
  pname = "toloka2MediaServer";
  version = "git";
  pyproject = true;

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.gitTracked ./.;
  };

  patches = [ ./patch-init.patch ];

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  dependencies = with python3.pkgs; [
    qbittorrent-api
    requests
    transmission-rpc
    (callPackage ./toloka2python.nix { })
  ];

  pythonImportsCheck = [
    "toloka2MediaServer"
  ];

  meta = {
    description = "Консольна утиліта для докачування нових серій аніме з Toloka. Для скачування торрент-файлів використовується бібліотека toloka2python";
    homepage = "https://github.com/CakesTwix/Toloka2MediaServer";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "toloka2MediaServer";
  };
}
