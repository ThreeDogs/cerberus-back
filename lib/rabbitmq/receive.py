#!/usr/bin/env python
# -*- coding: utf-8 -*-

# receive.py
# 큐에서 메시지를 받아와서 print
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

channel.queue_declare(queue='hello')

print ' [*] Waiting for messages. To exit press CTRL+C'

# 우리가 메시지를 받을때마다 callback 함수 동작 (by the Pika library)
def callback(ch,method,properties,body):
	print " [X] Received %r" % (body,)

# 이 callback 함수가 hello 큐로부터 메시지를 받는다.
channel.basic_consume(callback, queue='hello', no_ack=True)

# never end loop
channel.start_consuming()