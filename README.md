# hello_drogon

Example of using a patched base image for building applications based on the Drogon framework.

_**Base**_ image size: 377MB, _**hello_drogon**_ image size: 14.3MB 

### Links

- Drogon framework: https://drogon.org/
- Base image: https://hub.docker.com/r/slacktomcat/alpine_drogon
- 
### Start container:    
  `$ docker build -f Dockerfile -t hello_drogon:latest . && ` \\\
  &nbsp;&nbsp;&nbsp;&nbsp;`docker run -p 80:5555 --name hello_drogon hello_drogon:latest` \

### Check:
  `$ curl http://localhost`
  