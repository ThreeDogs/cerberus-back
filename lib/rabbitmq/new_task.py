#!/usr/bin/env python
# -*- coding: utf-8 -*-

# new_task.py
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

# durable 옵션 (RabbitMQ 서버가 죽어도 큐를 잃지 않는다.)
# channel.queue_declare(queue='hello', durable=True)

# 처음 짤째 durable 옵션 없이 코드로 정의해버리고 써버리면 다음에 재정의할 수 없다.
channel.queue_declare(queue='task_queue', durable=True)

message = ' '.join(sys.argv[1:]) or "Hello World!"

channel.basic_publish(exchange='', routing_key='task_queue',body=message,
										 	properties=pika.BasicProperties(delivery_mode = 2, # make message persistent
										 	))
# persistence 옵션이 RabbitMQ 서버 재시작시 메시지 보존을 완벽하게 해준다는 보장은 없으나
# 안하는 것보다는 낫다.
# 제대로 더 강하게 보장하려면 퍼블리싱 코드를 transaction 으로 랩핑해야된다.

print " [X] Sent %r" % (message,)

connection.close()