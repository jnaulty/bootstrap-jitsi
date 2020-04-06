# Hosting Jitsi on AWS using Terraform

This is meant to serve as a starting point for those who want to host their own video call service using Jitsi on AWS

## Installation

**Requires**

- [terraform](https://www.terraform.io/downloads.html)
- SSH key + client
- AWS profile with the following policies: AmazonEC2FullAccess, AmazonVPCFullAccess, AmazonRoute53FullAccess
- Domain Name already in [Route53](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)


## Resources

### Jitsi

- [Jitsi Docs -- Quick Start](https://github.com/jitsi/jitsi-meet/blob/master/doc/quick-install.md)
- [Getting started with Jitsi, an open source web conferencing solution](https://awsfeed.com/whats-new/open-source/getting-started-with-jitsi-an-open-source-web-conferencing-solution/)

### Jibri (for recording + streaming)

- [Jibri README -- Installation](https://github.com/jitsi/jibri/tree/80236965c589aed7f55d4751eb65419b8f527307#installing-jibri)

## Inspiration

![image](https://user-images.githubusercontent.com/6826729/78512719-92fced00-775b-11ea-95a1-ad8029d9547e.png)

Due to the terrible history of services like Zoom, and the lack of privacy on services like WhatsApp, Facebook, and
Google, it is desirable to be able to host a secure and stable video call service.

Jitsi has all the necessary components to do this as well as documentation on getting setup.

David Cruz's ["Zoom Sucks" List](https://gist.github.com/dacruz21/dd2480f195f5b48a9ab7af8b41c21404) lists a number of
articles describing series of security setbacks repeated year-after-year by Zoom. There is no reason to support a
company who's core principles do not have room for the security of the user.

Schools, governments, and businesses, and various social groups are using Zoom. We should be helping them convert to
more stable, open, and secure systems.

For anyone who wants assistance in setting up a jitsi-based system, please feel free to reach out.

