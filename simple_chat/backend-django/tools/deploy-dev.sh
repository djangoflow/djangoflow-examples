#!/bin/sh
export KUBECONFIG=~/.kube/django-df-chat_kubeconfig.yaml \
	&& sh tools/cloudbuild.sh src \
	&& kubectl delete po -n django-df-chat -l app.kubernetes.io/name=django
