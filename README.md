# Supported tags and respective `Dockerfile` links

- [`latest`, `4.3.0` (*Dockerfile*)](https://github.com/luciddg/jira-cli-docker/blob/master/Dockerfile)

# What is jira-cli?

[The JIRA Command Line Interface (jira-cli)](https://bobswift.atlassian.net/wiki/display/JCLI/JIRA+Command+Line+Interface) 
is a command line interface (CLI) for remotely accessing JIRA. 
This provides a convenient way to automate JIRA administration and include JIRA content as part of other automation. 
Examples are build and test automation or other business processes. 
This is a working command line client that can be used directly with your installation. 
This CLI uses JIRA's SOAP and REST remote APIs.

# How to use this image

## without a configuration file

Simply pass any compatible args to the container's entry point:

  docker run --rm luciddg/jira-cli --server https://jira.example.org/ --user johndoe --password "s3KURe!" --action getServerInfo

## with a configuration file

Edit the example configuration file and rename to `jira-cli.conf`.

Then you can run it while bind mounting the configuration file:

  docker run --rm -v ./jira-cli.sh:/etc/jira-cli.conf luciddg/jira-cli --action getServerInfo


