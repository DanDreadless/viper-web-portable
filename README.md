# Viper-Web-Portable

Original Viper-Framework and Viper-Web by brotherder
<https://github.com/viper-framework>

## Dependancies

Django version 3.0 (any higher is not supported)

Python version <= 3.9 (Python 3.10 not supported by the latest version of django)

See requirements.txt for python modules and add any extras that you want installing.

## Config

Dockerfile - This is the build information

Docker-compose.yaml - Settings for services.

viper.conf - This is where you need to configure things such as admin user and pass.

site-config.conf - This is where you need to configure Apach.

## Process

1. docker-compose build --no-cache
2. docker-compose up -d
3. get a shell on the container
4. cp /viper.conf /home/viper/.viper/viper.conf
5. start viper and 'update-modules'
6. restart container
7. Webpage available at <http://localhost:8080>

## TODO

1. Get Apache working
2. Install Let's Encrypt and configure
3. Work out dependancies from existing Viper platform
4. Install updated modules
5. Remove branding links