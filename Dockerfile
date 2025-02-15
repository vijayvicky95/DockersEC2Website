FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/Groovin/Groovin.zip .
RUN unzip Groovin.zip
RUN mv Groovin/* .
RUN rm -rf Groovin Groovin.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
