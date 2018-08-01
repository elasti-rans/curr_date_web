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

### CI
    I chose to use jenkins + docker + ansible
    I added the jenkins/jenkinsfile which is a script for the jenkins pipeline plugin.
    The script by default will checkout master, but if the a commit or a branch given it will use them instead.
    using the git hash can recreate builds.

    after the checkout the script will build with gradle (although its not needed because its python)
    JUst simulate a build ...

    then it will package the app in docker, upload it to registry
    then run the image in a some worker server and potentialy run integration tests.

###  How to implement a release pipeline
    The above pipeline should be triggered for new commits by setting jenkins to track the repository.
    After success of integration tests in above pipeline promote the docker image to stable.

    dev - can use above task to check their branches
        but in any case master branch should not be pushed directly, instead pushing to some feature branch ]
        then there should be a hook that invoke the jenkins with this branch
        assuming jenkins passed it should push it to master.
        This task before even starting should provision a new vm or utilize existing one.

        Another need of dev is: debugging code, so in case that task provision a new vm each time and then delete it.
        They should have the option to ask for the vm to stay alive.
        But this should be managed so there will not be any resource leak over time (vms that never being deleted)

    QA - THere should be a task that do only deployment from stable builds
         and it will deploy either on all QA organization / specific people/ systems, ... (that in case the resources are static)
         Another alternative is to allocate new vms and delete them in the end
         # and upon failure save the snapshot of the docker / vm and continue.

        automation - probably in the night and weekends it should run on the latest stable
        in case it pass promote the image again to extra_stable

        manual - They should have a task just to delpoy from a stable version.

    release
        there should be a manual step that a release manager is doing to promote an extra_stable
        to released

        and then a production cluster is shinned up and once its up reroute the trafic to new version
        and all one can be removed
