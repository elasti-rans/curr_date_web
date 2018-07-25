## Current date and time web app

### Assumption
    The deployment script and procedure are for RHEL/cenos flavour linux.
    It was tested on centos 7.5.1804.
    The app it self should work on any platform the main platform spesific 
    is the installation of docker in the host.

### Deployment procedure
    sudo yum install git; git clone git@github.com:elasti-rans/curr_date_web.git
    curr_date_web/build_and_run.sh

### Explanation
    About the app:
        THe server is sending the time in UTC.
        THe sent html contain the moment javascript and will convert the UTC time into the client local time.
        This way no matter the client timezone, the received time will be correct for him.

    build_and_run will will:
    - install docker
    - build the docker image
    - run the docker image
    
    From that point the web app will be accesiable through port 8000.
