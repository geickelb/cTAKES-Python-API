### cTAKES Python API Install Instructions ###
==========================

1. Install Maven 

    ###### Mac OSX ######
    
        brew install maven
        
    ###### CentOS 7 ######
        
        yum install -y java-1.8.0-openjdk-devel
        
        cd /usr/local/src
        wget http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
        
        tar -xf apache-maven-3.5.4-bin.tar.gz
        mv apache-maven-3.5.4/ apache-maven/ 
        
        cd /etc/profile.d/
        vim maven.sh
        
        export M2_HOME=/usr/local/src/apache-maven
        export PATH=${M2_HOME}/bin:${PATH}
        
        chmod +x maven.sh
        source /etc/profile.d/maven.sh
        
         mvn --version

2. Run the script `ctakes-extras/ctakes-install.sh`, which will:
    - checkout a copy of cTAKES into `./ctakes-svn` (if you haven't already) or update from the SVN repo
    - package cTAKES using Maven
    - move the compiled version to `./ctakes`
    - copy over the extras in `./ctakes-extras`

3. Create a file named `./umls.sh` containing your UMLS username and password:
      
        UMLS_USERNAME='username'
        UMLS_PASSWORD='password'

> This currently does not work correctly.


### MetaMap ###

To use MetaMap, download and install MetaMap:

1. Download [from NLM](http://metamap.nlm.nih.gov/#Downloads)
2. Extract the archive into our root directory and rename it to `metamap`
3. Copy the script `metamap-extras/run.sh` to `metamap/`
4. Run the install script:
    
        ./metamap/bin/install.sh


### NLTK ###

requirements:

- nltk

