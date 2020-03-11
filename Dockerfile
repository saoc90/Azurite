FROM stefanscherer/node-windows:10

WORKDIR /opt/azurite

# Default Workspace Volume
#VOLUME [ "C:/data" ]

COPY . .

RUN npm config set unsafe-perm=true
RUN npm ci
RUN npm run build
RUN dir
RUN npm install -g

# Blob Storage Port
EXPOSE 10000
# Queue Storage Port
EXPOSE 10001

CMD ["node", "C:\nodejs\node_modules\azurite\dist\src\azurite.js", "--blobHost", "0.0.0.0", "-L"]
