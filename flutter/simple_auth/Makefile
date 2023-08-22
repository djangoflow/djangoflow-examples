init: init-djangoflow_openapi init-simple_auth run-build_runner

init-djangoflow_openapi:
	cd packages/djangoflow_openapi && flutter pub get

init-simple_auth:
	flutter pub get

run-build_runner-simple_auth:
	dart run build_runner build --delete-conflicting-outputs

run-build_runner-djangoflow_openapi:
	cd packages/djangoflow_openapi && dart run build_runner build --delete-conflicting-outputs

run-build_runner: run-build_runner-djangoflow_openapi run-build_runner-simple_auth

run:
	flutter run
