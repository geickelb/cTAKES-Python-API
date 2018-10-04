### cTAKES Python API Install Instructions ###

1. Run the script `ctakes-install/ctakes-install.sh`, which will:
    - Download a copy of cTAKES into `./ctakes-install/tmp`
    - Extract cTAKES then copy into `ctakes-install (cTAKES_HOME)` directory
    - Download `ctakes-resources-4.0-bin.zip` into `./ctakes-install/tmp`
    - Unzip `ctakes-resources-4.0-bin.zip` and copy into `apache-ctakes-4.0.0/resources`
    - Remove/clean `/tmp` directory from `ctakes-install`
    
2. Add UMLS credentials to `/bin/runctakesCVD.sh & /bin/runctakesCPE.sh` at `cTAKES_HOME`
    
    Example: `java -Dctakes.umlsuser=<YOUR_UMLS_ID_HERE> -Dctakes.umlspw=<YOUR_UMLS_PASSSWORD_HERE> -cp ...`

3. Create a file named `./umls.sh` containing your UMLS username and password:
      
        UMLS_USERNAME='username'
        UMLS_PASSWORD='password'S
