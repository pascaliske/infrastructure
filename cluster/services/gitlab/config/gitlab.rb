# general
external_url 'https://git.${DOMAIN_EXTERNAL}'
registry_external_url 'https://registry.${DOMAIN_EXTERNAL}'
pages_external_url 'https://pages.${DOMAIN_EXTERNAL}'
gitlab_rails['time_zone'] = '${TIMEZONE}'

# backups
gitlab_rails['backup_path'] = '/backups'
gitlab_rails['backup_keep_time'] = 604800

# default theme
gitlab_rails['gitlab_default_theme'] = 2

# default project features
gitlab_rails['gitlab_default_projects_features_issues'] = true
gitlab_rails['gitlab_default_projects_features_merge_requests'] = true
gitlab_rails['gitlab_default_projects_features_wiki'] = true
gitlab_rails['gitlab_default_projects_features_snippets'] = true
gitlab_rails['gitlab_default_projects_features_builds'] = true
gitlab_rails['gitlab_default_projects_features_container_registry'] = true

# gitlab ci
gitlab_ci['gitlab_ci_all_broken_builds'] = true

# artifacts
gitlab_rails['artifacts_enabled'] = true

# dependency proxy
gitlab_rails['dependency_proxy_enabled'] = true

# git lfs
gitlab_rails['lfs_enabled'] = true

# impersonation settings
gitlab_rails['impersonation_enabled'] = true

# emails
gitlab_rails['gitlab_email_enabled'] = true
gitlab_rails['gitlab_email_from'] = '${SMTP_ACCOUNT_GITLAB_EMAIL}'
gitlab_rails['gitlab_email_reply_to'] = '${SMTP_ACCOUNT_GITLAB_EMAIL}'
gitlab_rails['gitlab_email_display_name'] = '${SMTP_ACCOUNT_GITLAB_NAME}'
gitlab_rails['gitlab_email_subject_suffix'] = ''
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_domain'] = '${DOMAIN_EXTERNAL}'
gitlab_rails['smtp_address'] = '${SMTP_HOST}'
gitlab_rails['smtp_user_name'] = '${SMTP_ACCOUNT_GITLAB_EMAIL}'
gitlab_rails['smtp_password'] = '${SMTP_ACCOUNT_GITLAB_PASSWORD}'
gitlab_rails['smtp_authentication'] = 'login'
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_port'] = 587

# oidc auth
gitlab_rails['omniauth_allow_single_sign_on'] = ['openid_connect']
gitlab_rails['omniauth_allow_bypass_two_factor'] = ['openid_connect']
gitlab_rails['omniauth_auto_link_ldap_user'] = false
gitlab_rails['omniauth_block_auto_created_users'] = true
gitlab_rails['omniauth_providers'] = [
    {
        name: "openid_connect",
        label: "Authelia",
        icon: "https://www.authelia.com/images/branding/logo-cropped.png",
        args: {
            name: "openid_connect",
            scope: ["openid", "profile", "email", "groups"],
            response_type: "code",
            issuer: "https://auth.${DOMAIN_EXTERNAL}",
            discovery: true,
            client_auth_method: "query",
            uid_field: "preferred_username",
            send_scope_to_token_endpoint: "false",
            client_options: {
                identifier: "gitlab",
                secret: "${AUTH_OIDC_CLIENT_SECRET}",
                redirect_uri: "https://git.${DOMAIN_EXTERNAL}/users/auth/openid_connect/callback"
            }
        }
    }
]

# disable integrated certificates
letsencrypt['enable'] = false
letsencrypt['auto_renew'] = false

# sentry error logging
gitlab_rails['sentry_enabled'] = true
gitlab_rails['sentry_dsn'] = '${SENTRY_DSN}'
gitlab_rails['sentry_clientside_dsn'] = '${SENTRY_DSN}'
gitlab_rails['sentry_environment'] = 'production'

# gitlab pages
gitlab_pages['enable'] = false

# nginx
nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['worker_processes'] = 2
nginx['proxy_set_headers'] = {
    'Host' => 'git.${DOMAIN_EXTERNAL}',
    'Upgrade' => '$http_upgrade',
    'Connection' => '$connection_upgrade',
    'X-Forwarded-Proto' => 'https',
    'X-Forwarded-Ssl' => 'on',
    'X-Forwarded-For' => '$proxy_add_x_forwarded_for',
    'X-Real-IP' => '$remote_addr'
}

# registry nginx
registry_nginx['listen_port'] = 5005
registry_nginx['listen_https'] = false
registry_nginx['proxy_set_headers'] = {
    'Host' => 'registry.${DOMAIN_EXTERNAL}',
    'Upgrade' => '$http_upgrade',
    'Connection' => '$connection_upgrade',
    'X-Forwarded-Proto' => 'https',
    'X-Forwarded-Ssl' => 'on',
    'X-Forwarded-For' => '$proxy_add_x_forwarded_for',
    'X-Real-IP' => '$remote_addr'
}

# pages nginx
pages_nginx['listen_https'] = false

# sidekiq
sidekiq['concurrency'] = 2

# puma
puma['worker_processes'] = 2

# monitoring
prometheus['enable'] = false
alertmanager['enable'] = false
node_exporter['enable'] = false
redis_exporter['enable'] = false
postgres_exporter['enable'] = false
gitlab_exporter['enable'] = false
grafana['enable'] = false

# ensure kubelet probes are whitelisted
gitlab_rails['monitoring_whitelist'] = [
  '127.0.0.1',
  '10.42.2.1',
]
