#!/usr/bin/env python
# -*- coding: utf-8 -*-

# receive_logs.py
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

# exchange name: logs, type: fanout
channel.exchange_declare(exchange='logs', type='fanout')

# queue 이름을 안정해주면 랜덤 큐네임이 생성
# exclusive=True, 컨슈머(워커)와 연결이 해제되면 큐 삭제
result = channel.queue_declare(exclusive=True)

# result.method.queue 로 랜덤 생성된 큐 네임을 가져올 수 있다.
queue_name = result.method.queue

# binding 으로 큐와 exchange 사이에 연결을 만들어줘야한다.
channel.queue_bind(exchange='logs', queue=queue_name)

print ' [*] Waiting for logs. To exit press CTRC+C'

def callback(ch,method,properties, body):
	print " [X] %r" % (body,)

#
channel.basic_consume(callback, queue=queue_name, no_ack=True)
channel.start_consuming()