bind = "0.0.0.0:8000"
#check_config = True
reload = True
worker_class = 'uvicorn.workers.UvicornWorker'
#worker_class = 'gevent'
workers = 3
wsgi_app = "src.main:app"
