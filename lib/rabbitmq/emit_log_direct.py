#!/usr/bin/env python
# -*- coding: utf-8 -*-

# emit_log_direct.py
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

# direct type exchange
channel.exchange_declare(exchange='direct_logs', type='direct')

severity = sys.argv[1] if len(sys.argv) > 1 else 'info'
message = ' '.join(sys.argv[2:]) or 'Hello World!'

# severity -> routing_key (exchange가 큐와 연결되는 키)
channel.basic_publish(exchange='direct_logs', routing_key=severity, body=message)
print " [X] Sent %r:%r" % (severity, message)
connection.close()

