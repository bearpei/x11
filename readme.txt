Dockerfile Optional
===================
install firefox CN font
# apt-get -y install firefox ttf-wqy-microhei wget


Building it
=========
docker build --tag=fedora-chromium .
docker build -t fedora-chromium .

Running it
=========
docker run \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e XAUTHORITY=/.Xauthority \
    -v ~/.Xauthority:/.Xauthority:ro \
    --name chromium \
    fedora-chromium

docker run -e DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/.Xauthority:/home/developer/.Xauthority \
--net=host \
firefox

xhost +local:root; \
docker run -ti --rm \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
ubuntu:latest \
sh -c 'apt-get update && apt-get install -qqy mesa-utils && glxgears'

Required
========

--net host #<--- use host's network stack, otherwise you'll see:
[1:1:0327/114315:ERROR:browser_main_loop.cc(210)] Gtk: cannot open display: :0.0
-v /tmp/.X11-unix:/tmp/.X11-unix #<---bindmount X socket
-e DISPLAY=$DISPLAY #<--- connect to proper display
-e XAUTHORITY=/.Xauthority -v ~/.Xauthority:/.Xauthority:ro #<---X auth stuff
-v ~/.Xauthority:/.Xauthority:ro #<--- again, X auth stuff



Optional
========

--cpuset-cpus 0 #<---one core is just enough
--memory 512mb #<---that should be enough, max memory it can use
-v $HOME/Downloads:/home/chromium/Downloads #<---get access to Downloads dir in your profile
-v $HOME/.config/chromium/:/home/chromium/.config/chromium\ #<---preserve runtime configuration
-v /dev/snd:/dev/snd --privileged \ #<---sound
-v $HOME/Downloads:/root/Downloads \ # optional, but nice
-v $HOME/.config/google-chrome/:/data \ # if you want to save state
-v /etc/localtime:/etc/localtime \ 



