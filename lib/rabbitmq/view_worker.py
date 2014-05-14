# -*- coding: utf-8 -*-
import os
import sys
import pika
import json
import MySQLdb as db
import subprocess
import datetime
import random

from utility import naive2aware
from utility import getUTCDatetime
from utility import getUTCawaredate
from utility import getUTCawaredatetime
from utility import RANK
from config import get_config   

#from settings import PROJECT_DIR
PROJECT_DIR = os.path.join(os.path.dirname(__file__),'..')


credentials = pika.PlainCredentials('urqa', 'urqa')
parameters  = pika.ConnectionParameters(host='14.63.164.245', 
                                        port=5672, 
                                        credentials=credentials)


connection  = pika.BlockingConnection(parameters)
channel     = connection.channel()

channel.queue_declare(queue='urqa-queue', durable=True)
channel.queue_bind(exchange ='urqa-exchange', queue = 'urqa-queue')

try:
    con = db.connect(host='14.63.164.245',port=3306, user = 'root',passwd='stanly',db='urqa');
    con.autocommit(True)  

    cur = con.cursor()
    cur.execute("SELECT VERSION()")
    ver = cur.fetchone()
    print " [*] Database version : %s " % ver
    cur.close()
except db.Error, e:
        print "Error %d: %s" % (e.args[0],e.args[1])
        logger.error('database connect')
        sys.exit(1)
finally:    
    pass
        #if con:
            #con.close()

print " [*] Waiting for messages. To exit press CTRL+C"

@csrf_exempt
def callback(ch, method, properties, body):

    print " [x] Received %r\n\n" % (body,)
    firstData = json.loads(body,encoding='utf-8')
   
    # 데이터 형식
    #data forma {“apikey”: “12312312”, “appversion”: “1.0”}    
    #tag정보와 body정보로 구분한다. tag정보는 데이터를 분류할 떄 사용한다.
    tag = firstData['tag']
    body = firstData['data']    
    idinstance = firstData['instance_id']

    if tag == 'connect':
        #step1: apikey를  project찾기
        apikey = body['apikey']
        appversion = body['appversion']
        print "apikey : " + apikey
        query = "select pid from projects where apikey ='{}';".format(apikey);
        print "query : " + query
        cur  = con.cursor()
        cur.execute(query)
        results = cur.fetchone()
        #pid 구�~U~X기
        pid = None
        pid = results[0]

        if pid == None:
            return;

        query = "select * from appruncount where pid = {} and appversion ='{}';".format(pid, appversion)
        print query
        cur.execute(query)
        results = cur.fetchone()
        print "type : " +str(type(results))
        
        if results == None:
            query = "INSERT INTO appruncount (pid,appversion,runcount) VALUES ({},'{}',0);".format(pid,appversion);
            cur.execute(query)
        
        else :
            query = "UPDATE appruncount SET runcount = runcount + 1 WHERE pid = {} and appversion = '{}';".format(pid,appversion)
        cur.close()


if __name__ == '__main__':
    try:
        channel.basic_consume(callback, queue='urqa-queue', no_ack=True)
        channel.start_consuming()
    except (KeyboardInterrupt):#, SystemExit):
        print " [*]Program Exit....\n"
    channel.stop_consuming()
    connection.close()
    con.close()
    sys.exit(1)


'''
You can also use the local time zone
>>> import tz
>>> l = tz.timezone("localtime")

Or the obvious UTC time zone
>>> import tz
>>> utc = tz.timezone("UTC")
'''

