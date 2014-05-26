#!/bin/bash
#
# Synchronizes a GIT PhoneGap project repository and deploys the content
# of the www directory to a JBossEWS standalone cartridge

# Initialize script variables
GIT_PROJECT_NAME=openshift-mobile
GIT_URL=https://github.com/openshift-mobile/openshift-mobile.git
TOMCAT_DEPLOY_DIR=${HOME}/app-root/dependencies/jbossews/webapps

# Execution will occur in OpenShift tmp Directory
cd $OPENSHIFT_TMP_DIR

# Remove any existing directory
rm -rf ${GIT_PROJECT_NAME}

# Clone Git Repository
git clone $GIT_URL ${GIT_PROJECT_NAME}

# Enter www Directory
pushd $GIT_PROJECT_NAME/www

# Create WAR File
jar cf ROOT.war *

# Move WAR file to Tomcat Deployment Folder
mv -f ROOT.war ${TOMCAT_DEPLOY_DIR}

popd

# Cleanup
rm -Rf ${GIT_PROJECT_NAME}
