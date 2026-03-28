#!/bin/bash

# Setting up mariadb with docker
# Pulling the image
echo "To look for a specific MariaDB image run the command:"
echo "  docker search mariadb"
echo "Pick a version and then run:"
echo "  docker pull mariadb:<version>"
echo "Or to get the latest just run:"
echo "  docker pull mariadb"
read -p "Do you want to pull the latest version? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo "Pulling the latest MariaDB image"
    sudo docker pull mariadb
else
    echo "Skipping image pull..."
fi
echo "************"
echo ""

# Running a container
echo "To run a container use the command:"
echo "  docker run --name finance_app -e MYSQL_ROOT_PASSWORD=mariadb -p 3308:3308 -d mariadb"
# - name - the name for the container
# - e - specifies the password for the root user
# - p - sets a mapping of the port of the container and the host
# - d - run in detach mode
# - at the end we specify the image to be used
read -p "Do you want to run the container with the default arguments from the command above? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo "Running the container with the default arguments"
    sudo docker run --name finance_app -e MYSQL_ROOT_PASSWORD=mariadb -p 3308:3308 -d mariadb
else
    echo "Skipping running the container..."
fi
echo "************"
echo ""

# Connect to MariaDB and execute database setup sql script
read -p "Do you want to configure the App database? (Y/N): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo "Connecting to the app database"
    mariadbIP="$(sudo docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' finance_app)"
    echo "The assigned IP for the container is - $mariadbIP"
    sudo mysql -h $mariadbIP -u root -p < setup_db_finance_app.sql
else
    echo "Skipping the App DB configuration at the moment!"
fi

# Instructions on manually connecting to the container and the DB terminal
echo "To access the container run the following command:"
echo "  docker exec -it finance_app bash"
echo "To access the DB directly once you are in the container run the following command:"
echo "  mysql -u root -p"
echo "If 'mysql' is not available in this image you can access mariadb directly using the full path command:"
echo "  /usr/bin/mariadb -u root -p"
