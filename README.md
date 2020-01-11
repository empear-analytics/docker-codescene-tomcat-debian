# docker-codescene-tomcat-debian
Sample docker image for testing codescene running in tomcat under Debian

## How to Run

Clone this repo and use docker-compose to start the application.
```
docker-compose up
```

Or you can rebuild the image:
```
docker-compose up --build
```

The codescene will be running on http://localhost:8888 by default.
You can change the port in the `docker-compose.yml` file.
