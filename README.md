# Viper-Web-Portable

Original Viper-Framework and Viper-Web by brotherder
<https://github.com/viper-framework>

I have dockerised the framework and viper-web.

## Config

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