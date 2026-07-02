import os

class Config:
    # 1. Docker usa 'MYSQL_HOST', si no existe (como en Windows) usa '127.0.0.1'
    MYSQL_HOST = os.environ.get('MYSQL_HOST', '127.0.0.1')
    MYSQL_USER = os.environ.get('MYSQL_USER', 'root')
    MYSQL_PASSWORD = os.environ.get('MYSQL_PASSWORD', 'Victor12345#')
    MYSQL_DB = os.environ.get('MYSQL_DB', 'pizzeria')