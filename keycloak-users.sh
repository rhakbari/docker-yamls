#!/bin/bash

# Define variables
KEYCLOAK_CONTAINER_ID="keycloak"
REALM_NAME="Cloud7-Realm"

# Copy users-export.json into the Keycloak container
sudo docker cp users-export.json "$KEYCLOAK_CONTAINER_ID:/opt/jboss/keycloak/imports/users-export.json"

# Run Keycloak Admin CLI commands inside the container
sudo docker exec -it "$KEYCLOAK_CONTAINER_ID" /opt/jboss/keycloak/bin/kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin
sudo docker exec -it "$KEYCLOAK_CONTAINER_ID" /opt/jboss/keycloak/bin/kcadm.sh create users -r "$REALM_NAME" -f /opt/jboss/keycloak/imports/users-export.json
