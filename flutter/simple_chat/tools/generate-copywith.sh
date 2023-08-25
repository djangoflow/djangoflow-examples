#!/bin/bash

# Directory path
DIR="packages/djangoflow_openapi/lib/src/model"

# Annotation and import to add
ANNOTATION="@CopyWith()\n@JsonSerializable("
IMPORT="import 'package:copy_with_extension/copy_with_extension.dart';"

# Loop through the files in the directory
for file in $DIR/*.dart; do
  # Get the file name without the path
  filename=$(basename "$file")

  # Check if the file contains @JsonSerializable(
  if grep -q "@JsonSerializable(" "$file"; then
    # Add the CopyWith annotation and import
    sed -i '' "/@JsonSerializable(/i\\
$IMPORT
" "$file"
    sed -i '' "s/@JsonSerializable(/$ANNOTATION/" "$file"
    echo "Updated $filename"
  fi
done

# Install copy_with_extension and copy_with_extension_gen
pushd "packages/djangoflow_openapi" > /dev/null
dart pub add copy_with_extension
dart pub add --dev copy_with_extension_gen
dart pub get
dart run build_runner build --delete-conflicting-outputs
popd > /dev/null

echo "Modification completed."
