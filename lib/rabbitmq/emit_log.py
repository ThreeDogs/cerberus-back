#!/usr/bin/env python
# -*- coding: utf-8 -*-

# emit_log.py
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

# producer 는 오직 exchange 에게 메시지를 보낸다. 그 뒤의 일을 모른다.
# exchange 가 큐에게 메시지를 전달해준다. 
# exchange type: direct, topic, headers, fanout 
# logs 라 불리는 fanout 타입 exchange 생성
channel.exchange_declare(exchange='logs', type='fanout')

message = ' '.join(sys.argv[1:]) or "info: Hellor World!"

# exchange 이름이 logs 로 퍼블리시 
# routing_key 에 원래 큐 네임이 들어가는데,
# fanout 타입이 이걸 무시할 수 있도록 한다.
channel.basic_publish(exchange='logs',
											routing_key='',
											body=message)
print " [X] Sent %r" % (message,)
connection.close