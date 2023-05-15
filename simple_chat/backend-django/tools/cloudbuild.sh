#!/bin/sh
TARGET=${1:-.}
BRANCH_NAME="${CI_COMMIT_REF_NAME:-latest}"
if [ "${CI_COMMIT_REF_NAME}" = "main" ]; then BRANCH_NAME='latest';fi
echo "Building ${TARGET} ${BRANCH_NAME}"
gcloud builds submit --project=django-df-chat "${TARGET}" --config="${TARGET}"/cloudbuild.yaml \
  --substitutions=BRANCH_NAME=${BRANCH_NAME}
