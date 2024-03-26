#!/bin/bash
# `sleep 1` is used to make sure the packages are installed and no race condition, 
# otherwise throws (OS Error: No such file or directory, errno = 2)

# 1. Delete the directory
rm -rf packages/djangoflow_openapi

# 2. Call the generate-openapi tool
export ROOT_DIR=$(pwd)
export TARGET_DIR=$ROOT_DIR/packages/djangoflow_openapi

HOST_NAME=${1:-"http://127.0.0.1:8000"}

[ "$1" == "-l" ] && HOST_NAME="http://127.0.0.1:8000"
[ "$1" == "-d" ] && HOST_NAME="http://127.0.0.1:8000"

export API_VERSION=v1

echo "Generating OpenAPI client using host: ${HOST_NAME}"
[ -d "${TARGET_DIR}" ] || mkdir -p "${TARGET_DIR}"

${OPENAPI_GENERATOR:-openapi-generator} generate -g dart-dio -p browserClient=false -p nullableFields=true \
  -p serializationLibrary=json_serializable -p pubName=djangoflow_openapi \
  -p pubLibrary=djangoflow_openapi \
  -i "${HOST_NAME}/api/${API_VERSION}/schema" -o "${TARGET_DIR}" \
  && cd "${TARGET_DIR}" \
  && dart pub get \
  && sleep 1 \
  && dart run build_runner build --delete-conflicting-outputs

cd "${ROOT_DIR}"
sh tools/apply-git-patches.sh

echo "Script completed."

# 4. generate copyWith extension, if needed comment out the line below
curl -sSL https://raw.githubusercontent.com/djangoflow/flutter-djangoflow/main/packages/djangoflow_openapi_extensions/tool/generate-openapi-copywith.sh | sh