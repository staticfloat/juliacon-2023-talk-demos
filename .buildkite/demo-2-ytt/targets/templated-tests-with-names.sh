TARGET=".buildkite/demo-2-ytt/targets/truly-templated-package-tests.yml"

FORERUNNER_PATH=$1 
PACKAGE_NAME=$(echo "${FORERUNNER_PATH}" | awk -F "/" '{print $NF}') # Name of the project for which the pipeline was triggered

ytt -f ${TARGET} \
    --data-value project=${FORERUNNER_PATH} \
    --data-value package="${PACKAGE_NAME}" | buildkite-agent pipeline upload
