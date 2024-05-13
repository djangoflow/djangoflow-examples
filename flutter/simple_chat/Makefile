init: init-djangoflow_openapi init-simple_chat run-build_runner

init-djangoflow_openapi:
	cd packages/djangoflow_openapi && flutter pub get

init-simple_chat:
	flutter pub get

run-build_runner-simple_chat:
	dart run build_runner build --delete-conflicting-outputs

run-build_runner-djangoflow_openapi:
	cd packages/djangoflow_openapi && dart run build_runner build --delete-conflicting-outputs

run-build_runner: run-build_runner-djangoflow_openapi run-build_runner-simple_chat

run:
	flutter run
