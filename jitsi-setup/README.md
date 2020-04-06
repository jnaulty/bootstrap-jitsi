# Post Terraform Installation Steps

## Jitsi Server Installation

1. Transfer installation scripts directory to server

`scp -r install-scripts/ ubuntu@<domain-name>:~/`

2. Login to Server and become root

```
ssh ubuntu@<domain-name>
sudo su -
```

3. Install Jitsi

This will have a set of interactive questions that isn't fully automated yet

```
sudo su -
cd /home/ubuntu/jitsi-setup/jitsi
bash jitsi-install.sh
```

For configuration, please review the [jitsi/README.md](./jitsi/README.md)

4. Install Jibri

```
cd /home/ubuntu/jitsi-setup/jibri
bash jibri-install.sh
```

And for more information, please refer to the [jibri/README.md](./jibri/README.md) if you run into issues


5. Install Etherpad

This uses docker.

```
cd /home/ubuntu/jitsi-setup/etherpad
bash etherpad-isntall.sh
```

## Utils and Secrets

Some utility scripts after everything is 'up and running' exist in `utils/`

Secrets that are needed for running `etherpad` are in `secrets/secrets.env`

Replace them with something actually secret.

