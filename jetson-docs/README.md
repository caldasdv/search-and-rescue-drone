# Jetson Nano Ambient installation and configuration.

## Python setup:

Begin the setup installing python 3.8:

```bash
sudo apt-get install python3.8 python3.8-dev python3.8-distutils python3.8-venv
```

Now we have 2 Python versions: 3.6 and 3.8. To make sure we a using the right version edit the .bashrc file.

To edit, we can use a text editor. It could be vim or gedit. You add these lines on the end of the file:

```bash
sudo echo '
alias python="python3.8" \
alias python3="python3.8” \
alias pip="python3.8 -m pip" \
alias pip3="python3.8 -m pip"' >> ~/.bashrc
```

We then create a venv environment using:

```bash
python -m venv “vision”
```

Edit the .bashrc by runing this command:

```bash
sudo echo '
source ~/vision/bin/activate' >> ~/.bashrc
```

Install jetson-stats to run jtop

```bash
sudo python3.8 -m pip install -U jetson-stats
```

To run just type in the terminal:

```bash
jtop
```

## OpenCV Setup:

Base: **[Install OpenCV on Jetson Nano](https://qengineering.eu/install-opencv-on-jetson-nano.html)**

First we need to increase the swap memory using the following commands:

```bash
sudo fallocate -l 4G /var/swapfile && \ 
chmod 600 /var/swapfile && \
mkswap /var/swapfile && \
swapon /var/swapfile && \
bash -c 'echo "/var/swapfile swap swap defaults 0 0"  >> /etc/fstab’
```

and reboot using

```bash
sudo reboot
```

We could just run the bash script using:

```bash
sh OpenCV-4-8-0.sh
```

Then you wait to compile the OpenCV. Clone this repo and go to the **files** folder.

After the boot open **jtop** to see if the OpenCV version is 4.8.0 and if CUDA is activated.

## PyTorch and TorchVision Setup:

Install the dependencies: 

```bash
sudo apt-get install python3-pip libjpeg-dev libopenblas-dev libopenmpi-dev libomp-dev
sudo -H pip3 install future
sudo pip3 install -U --user wheel mock pillow
sudo -H pip3 install testresources
# above 58.3.0 you get version issues
sudo -H pip3 install setuptools==58.3.0
sudo -H pip3 install Cython
```

Then go to the folder **files** again and run the following commands:

```bash
python -m pip install torch-*.whl torchvision-*.whl
```

## Ultranalytics Setup:

Just run:

```bash
pip install ultralytics==8.0.231
```

You can test using a photo (jpeg file) and run the following command:

```bash
yolo predict model=yolov8n.pt source=’image.jpg’
```
## Files:

[Drive](https://drive.google.com/drive/folders/14WmJrQxTNfkbxpqfNfUSV9FYOFEPnIZ9?usp=sharing)
## References:

[https://github.com/EdwardoSunny/Jetson-Nano-YOLOv8-Setup](https://github.com/EdwardoSunny/Jetson-Nano-YOLOv8-Setup)

[Install OpenCV on Jetson Nano - Q-engineering](https://qengineering.eu/install-opencv-on-jetson-nano.html)

[Install PyTorch on Jetson Nano - Q-engineering](https://qengineering.eu/install-pytorch-on-jetson-nano.html)

[L-3 Install OpenCV 4.5 on NVIDIA Jetson Nano | Set Up a Camera for NVIDIA Jetson Nano](https://www.youtube.com/watch?v=P-EZr0zy53g&t=4s)

[i7y blog](https://i7y.org/)
