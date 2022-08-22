# Viper-Web-Portable

Original Viper-Framework and Viper-Web by brotherder
<https://github.com/viper-framework>

I have dockerised the framework and viper-web.

## Process

1. docker-compose build --no-cache
2. docker-compose up -d
3. get a shell on the container
4. cp /viper.conf /home/viper/.viper/viper.conf
5. restart container
6. Webpage available at http://localhost:8080

## TODO

1. Get Apache working
2. Install Let's Encrypt and configure
3. Work out dependancies from existing Viper platform
4. Install updated modules
5. Remove branding links