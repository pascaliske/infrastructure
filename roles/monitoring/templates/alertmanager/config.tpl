route:
  receiver: slack

receivers:
  - name: slack
    slack_configs:
      - channel: '{{ alertmanager_slack_channel }}'
        username: '{{ alertmanager_slack_username }}'
        api_url: '{{ alertmanager_slack_webhook }}'
        text: '{{ "{{" }} .CommonAnnotations.description {{ "}}" }}'
        send_resolved: true
