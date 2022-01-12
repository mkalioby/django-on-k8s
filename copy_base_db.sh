#! /bin/bash
ssh -i $(minikube ssh-key)  docker@$(minikube ip) "sudo mkdir -p /storage/sqlite/example/; sudo chmod a+w /storage/sqlite/example/"
scp -i $(minikube ssh-key) django_app/db.sqlite3 docker@$(minikube ip):/storage/sqlite/example/db.sqlite3