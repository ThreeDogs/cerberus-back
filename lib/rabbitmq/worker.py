#!/usr/bin/env python
# -*- coding: utf-8 -*-

# worker.py
import time
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

channel.queue_declare(queue='task_queue', durable=True)

print ' [*] Waiting for messages. To exit press CTRL+C'

def callback(ch,method,properties,body):
	print " [X] Received %r" % (body,)
	time.sleep( body.count('.') )
	print " [x] Done"
	ch.basic_ack(delivery_tag = method.delivery_tag)

# 한번에 한 워커에 한 메시지 이상 가지 않게 한다. 즉, 워커가 무거운 일을 처리 중이라면
# 그 다음 워커로 가야한다 하더라도 busy 하지 않은 워커를 찾아서 일을 처리하게 한다.
channel.basic_qos(prefetch_count=1)
# no_ack 확인 코드 (제대로 처리가 되었는지)
channel.basic_consume(callback, queue='task_queue')

# never end loop
channel.start_consuming()
