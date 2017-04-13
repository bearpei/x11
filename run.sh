#docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/developer/.Xauthority -e DISPLAY=$DISPLAY -e XAUTHORITY=~/.Xauthority --net=host --name x11 bearpei/x11:latest 

docker run -it \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/.Xauthority:/home/developer/.Xauthority \
-e DISPLAY=$DISPLAY \
-e XAUTHORITY=~/.Xauthority \
--net=host \
--name x11 \
x11/test

