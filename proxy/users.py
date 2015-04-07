#!/bin/env python
import redis as REDIS 
redis_pool =  REDIS.ConnectionPool(host='127.0.0.1', port=6379,password='', db=0)
redis = REDIS.Redis(connection_pool=redis_pool) 
print redis.ping()
print redis.get('ss:user:test')
#redis.set('ss:user:wow','{"name": "wow", "password": "wow123456", "method": "aes-256-cfb", "limit": 1073741824,"active":1}')
