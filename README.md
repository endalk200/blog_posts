# ReactJs containerization for development and production

To read the rational and description of this project checkout the blog post [here](https://google.com)

> You can use both development and production docker configurations found in this repo in your own projects.

## Essential commands to use

1. To build and run `development` server using `docker-compose` use the following command.

    ```bash
    docker-compose up --build
    ```

    When you make changes to your code the server reloads which is great for development.

2. To stop the runing container

    ```bash
    docker-compose down
    ```

3. To build production docker `container` use the following command.

    ```bash
    docker build -t reactjs-prod -f ./production/Dockerfile .
    ```

4. To run the production docker image you have created (You have to run it on port 80 because that is the default port `Nginx` uses). This command will run your container in interactive mode.

    ```bash
    docker run -it -p 80:80 reactjs-prod:latest
    ```

5. To run the production docker image using detatched mode

    ```bash
    docker run -d -p 80:80 reactjs-prod:latest
    ```


<hr />

**Use the following link to get 100 USD in DigitalOcean free credit**

[![DigitalOcean Referral Badge](https://web-platforms.sfo2.digitaloceanspaces.com/WWW/Badge%203.svg)](https://www.digitalocean.com/?refcode=7a5167a14566&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)