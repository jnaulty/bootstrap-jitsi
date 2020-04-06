# Hosting Jitsi on AWS using Terraform

Tired of the Zoom Bombing?

Do you ever wonder if Zoom is hacking you? Or letting other people hack you?

Well, now you don't have to care, because it's easy to get off of Zoom.

Follow this guide for a working instance of Jitsi up and running in less than 30-minutes with the additional features of etherpad,
live-streaming, and recording.

If you want access to a demo, send me an e-mail and I can give you access to my jitsi instance [meet.dendritictech.com](https://meet.dendritictech.com)

## Installation

**Requires**

- [terraform](https://www.terraform.io/downloads.html)
- SSH key + client
- AWS profile with the following policies: AmazonEC2FullAccess, AmazonVPCFullAccess, AmazonRoute53FullAccess
- Domain Name already in [Route53](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)

### Terraform

The usual Terraform commands should get you a running EC2 Instance

`terraform init`

`terraform plan`

`terraform apply`

Then transfer the [jitsi-setup](./jitsi-setup) directory to the new EC2 Instance and begin installation and configuration.

## Resources

### Jitsi

- [Jitsi Docs -- Quick Start](https://github.com/jitsi/jitsi-meet/blob/master/doc/quick-install.md)
- [Getting started with Jitsi, an open source web conferencing solution](https://awsfeed.com/whats-new/open-source/getting-started-with-jitsi-an-open-source-web-conferencing-solution/)

### Jibri (for recording + streaming)

- [Jibri README -- Installation](https://github.com/jitsi/jibri/tree/80236965c589aed7f55d4751eb65419b8f527307#installing-jibri)

## Inspiration

COVID-19 has caused a lot of people to work remote and engage in social activities 'virtually'. It's caused an increase
in video-conference usage, and people (like me) started reflecting on what tools were 'better' than others.

![image](https://user-images.githubusercontent.com/6826729/78512719-92fced00-775b-11ea-95a1-ad8029d9547e.png)

I prefer opensource services and tools for communications than proprietary alternatives. There's a lot of reasons for my preference. During this crisis, I would like to help people use more secure, open, and stable services. Jitsi is a great alternative to Zoom. 

David Cruz's ["Zoom Sucks" List](https://gist.github.com/dacruz21/dd2480f195f5b48a9ab7af8b41c21404) is a great curation of Zoom's security fails over the past couple of years. If you are not familiar with the **Security Fails** of Zoom, please, peruse this list--especially the last few incidences. 

There is no reason to support a company who's core principles do not have room for the security of the user.

Schools, governments, and businesses, and various social groups are using Zoom. We should be helping them convert to more stable, open, and secure systems.

For anyone who wants assistance in setting up a jitsi-based system, please feel free to reach out, you can find various contact details at [dendritictech.com](https://dendritictech.com)

