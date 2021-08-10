FROM node:14-alpine

# Create app directory 
WORKDIR /usr/src/app 

# install app dependencies for package.json and package.lock.json 
COPY package*.json ./ 

RUN npm install 

COPY . . 


RUN npm run build && npm link

ENTRYPOINT tatum-kms 

RUN useradd -ms /bin/bash newuser

USER newuser

RUN chown -R newuser

WORKDIR /home/newuser

CMD daemon