bind = "0.0.0.0:8443"
ca_certs = '/var/run/tls/ca.crt'
certfile = '/var/run/tls/tls.crt'
#check_config = True
keyfile = '/var/run/tls/tls.key'
proc_name = 'swamibot'
reload = True
worker_class = 'uvicorn.workers.UvicornWorker'
#worker_class = 'gevent'
workers = 3
wsgi_app = "src.main:app"

def ssl_context(conf, default_ssl_context_factory):
    import ssl
    context = default_ssl_context_factory()
    context.minimum_version = ssl.TLSVersion.TLSv1_3
    return context
