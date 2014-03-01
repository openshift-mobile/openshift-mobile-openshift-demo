openshift-mobile-openshift-demo
=========================

Template OpenShift project for synchronizing an existing GIT repository with OpenShift. Synchronization based on a cron schedule and requires the use of the OpenShift cron cartridge

## Usage

1. Create JBoss EWS 2.0 (Tomcat 7) OpenShift Application
2. Specify this repository to use as a template
3. Add cron embedded cartridge

### Additional Configuration
1. Synchronization job is scheduled to run daily at 2:00AM. This value can be modified in the `.openshift/cron/hourly/sync` script
2. Manually run synchronization job
    * The default OpenShift content will be displayed until the cron job runs. To deploy the project immediately, perform the following operations
        * SSH into cartridge `rhc ssh <application_name>`
        * Run the synchronization script: `${OPENSHIFT_REPO_DIR}/clone_deploy_project.sh`