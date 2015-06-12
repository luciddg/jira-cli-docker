FROM java:8-jre

ENV pkgurl 'https://bobswift.atlassian.net/wiki/download/attachments/16285777/jira-cli-4.3.0-distribution.zip'

RUN wget -qO /tmp/jira.zip ${pkgurl} \
  && unzip -qq -d /opt/ /tmp/jira.zip \
  && mkdir /etc/jira-cli

VOLUME /etc/jira-cli.conf

ADD files/jira-cli.sh /usr/local/bin/jira-cli-wrapper.sh

ENTRYPOINT ["/usr/local/bin/jira-cli-wrapper.sh"]
