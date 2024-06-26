#!/usr/bin/env sh

set -e

terraform apply -auto-approve \
-target=kind_cluster.default \
-target=helm_release.metallb \
-target=terraform_data.wait_for_metallb_controller \
-target=terraform_data.wait_for_metallb_speaker

sleep 5

terraform apply -auto-approve