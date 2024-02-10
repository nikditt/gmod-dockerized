#Installation Guide GMod-Server (LINUX VM)

[SteamCMD - Valve Developer Community](https://developer.valvesoftware.com/wiki/SteamCMD)

##Prerequisites/Used Software:

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) Version 7.0.14 r161095 (Qt5.15.2)

- [SteamCMD for Linux](https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz)

- [Debian 12](https://www.debian.org/)

Ports that need to be open [here]([Source Dedicated Server - Valve Developer Community](https://developer.valvesoftware.com/wiki/Source_Dedicated_Server#Connectivity))

actions are marked like **this**

Give the default "vboxuser"" sudo rights:

```bash
su
```

**entering password**

```bash
sudo usermod -aG sudo vboxuser
```

check for sufficient permissions

```bash
groups vboxuser
```

Update OS

```bash
sudo apt update && sudo apt upgrade -y
```

Install curl

```bash
sudo apt install curl
```

##Downloading SteamCMD



Add user for SteamCMD

```bash
sudo useradd -m steam
sudo passwd steam
```

**setting a new password for the user "steam"**

changing directory

```bash
sudo -u steam -s
cd /home/steam
```

Install SteamCMD

Dependencies (on VM steam is not in sudo by default):

```bash
sudo apt-get install lib32gcc-s1
```

Make steam sudo (probably not needed)

```bash
sudo usermod -aG sudo steam
```

```bash
sudo -u steam -s
```

creating new directory and navigating to it

```bash
mkdir ~/Steam && cd ~/Steam
```

download and extract steamCMD

```bash
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
```



##Starting SteamCMD

```bash
cd ~/Steam
./steamcmd.sh
```