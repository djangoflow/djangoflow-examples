init: init-djangoflow_openapi init-auth_simple run-build_runner

init-djangoflow_openapi:
	cd packages/djangoflow_openapi && flutter pub get

init-auth_simple:
	flutter pub get

run-build_runner-auth_simple:
	dart run build_runner build --delete-conflicting-outputs

run-build_runner-djangoflow_openapi:
	cd packages/djangoflow_openapi && dart run build_runner build --delete-conflicting-outputs

run-build_runner: run-build_runner-djangoflow_openapi run-build_runner-auth_simple

run:
	flutter run
