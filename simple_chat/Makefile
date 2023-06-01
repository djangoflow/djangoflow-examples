install-melos:
	cd frontend-flutter && dart pub global activate melos

bootstrap-melos:
	cd frontend-flutter && melos bootstrap

run-flutter-frontend:
	cd frontend-flutter/packages/chat && flutter run -d chrome

run: install-melos bootstrap-melos run-flutter-frontend