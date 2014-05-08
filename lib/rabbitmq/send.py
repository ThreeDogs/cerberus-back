#!/usr/bin/env python
# -*- coding: utf-8 -*-

# send.py 
# 큐에 싱글 메시지를 보내는 프로그램
import pika

# RabbitMQ 서버와 Connection을 만든다.
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

# 보내기전에 수신하는 큐가 존재하는지 확인해야된다. 없으면 쓰레기 처리하기 때문에 여기서 큐 선언
channel.queue_declare(queue='hello')

# 메시지 보낼 준비 완료
# Hello World! 문자열을 hello queue 가 받을 것이다.
# RabbitMQ 에서 메시지를 큐에 바로 직접적으로 보내지 않고 항상 exchange 를 거쳐서 보낸다.
# exchange 는 정확히 어떤 큐에 메시지가 잘 전달되도록 해준다.
# queue 이름은 routing_key 파라미터에 정의
channel.basic_publish(exchange='', routing_key='hello', body='Hello World!')

print " [X] Sent 'Hello World!'"

# 프로그램 종료 전에 네트워크 버퍼에서 잘 플러쉬되고 잘 메시지가 RabbitMQ 에 전달된 걸 확인하기 위해서
# connection을 close해준다.
connection.close()