# how to migrate docker container to another server in ubuntu 22.04

## On the Source Server
### Export the Docker Container to an Image

First, identify the container ID or name you wish to migrate with docker ps.
Then, commit the container to an image:
```docker commit [CONTAINER_ID_OR_NAME] [new_image_name]```
Example:
```docker commit my_container my_container_image```
Save the Image to a Tarball

Save the newly created image to a tarball file:
```docker save -o [path_to_save]/[image_name].tar [image_name]```
Example:
```docker save -o ~/my_container_image.tar my_container_image```
### Transfer the Tarball to the New Server

Use scp, rsync, or any file transfer method you prefer. Assuming you are using scp:
```scp ~/my_container_image.tar [user]@[destination_server_ip]:/path/to/destination```
Example:
```scp ~/my_container_image.tar ubuntu@192.168.1.2:/home/ubuntu/```
## On the Destination Server
### Load the Image from the Tarball

Once the tarball is transferred, load the image into Docker:
```docker load -i /path/to/[image_name].tar```
Example:
```docker load -i /home/ubuntu/my_container_image.tar```

## Create a New Container from the Image

Now, create a new container from the image. You’ll need to replicate any port mappings, volume bindings, or environment variables manually. Here’s a basic example:
```docker run -d [other_options] [image_name]```
Example (assuming you want to run it in detached mode):
```docker run -d my_container_image```

src: https://tenten.co/insight/dev/how-to-migrate-docker-container-to-another-server/