import os


API_PORT_TLS = os.environ['API_PORT_TLS']

bind = f"0.0.0.0:{API_PORT_TLS}"
ca_certs = '/var/run/tls/ca.crt'
certfile = '/var/run/tls/tls.crt'
#check_config = True
keyfile = '/var/run/tls/tls.key'
proc_name = 'swamibot'
reload = True
worker_class = 'uvicorn.workers.UvicornWorker'
#worker_class = 'gevent'
workers = 3
wsgi_app = "src.slack_fastapi:api"

def ssl_context(conf, default_ssl_context_factory):
    import ssl
    context = default_ssl_context_factory()
    context.minimum_version = ssl.TLSVersion.TLSv1_3
    return context
