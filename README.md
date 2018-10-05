### cTAKES Python API Install Instructions ###

1. Run the script `ctakes-install/ctakes-install.sh`, which will:
    - Download a copy of cTAKES into `./ctakes-install/tmp`
    - Extract cTAKES then copy into `ctakes-install (cTAKES_HOME)` directory
    - Download `ctakes-resources-4.0-bin.zip` into `./ctakes-install/tmp`
    - Unzip `ctakes-resources-4.0-bin.zip` and copy into `apache-ctakes-4.0.0/resources`
    - Remove/clean `/tmp` directory from `ctakes-install`
    - Set UMLS `username` and `password` for `/bin/runctakesCVD.sh` & `/bin/runctakesCPE.sh` (Optional to use UMLS related dictionaries)

Note: If you don't have a UMLS username & password you'll need to request one at https://uts.nlm.nih.gov/license.html
