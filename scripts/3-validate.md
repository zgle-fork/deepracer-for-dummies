# Which GPU?
```bash
$ lspci | awk '/NVIDIA/ && /3D controller/'
00:1e.0 3D controller: NVIDIA Corporation Device 1eb8 (rev a1)'
```

# Which Graphics Adapter is installed?
```bash
$ sudo apt install ubuntu-drivers-common
$ ubuntu-drivers devices
== /sys/devices/pci0000:00/0000:00:1e.0 ==
modalias : pci:v000010DEd00001EB8sv000010DEsd000012A2bc03sc02i00
vendor   : NVIDIA Corporation
driver   : nvidia-driver-430 - distro non-free
driver   : nvidia-driver-435 - distro non-free
driver   : nvidia-driver-410 - third-party free
driver   : nvidia-driver-440 - third-party free recommended
driver   : xserver-xorg-video-nouveau - distro free builtin
```

# NVidia?
```bash
$ nvidia-smi
Mon Mar 23 02:26:48 2020       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 440.64.00    Driver Version: 440.64.00    CUDA Version: 10.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
| N/A   31C    P8    10W /  70W |      0MiB / 15109MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
```

