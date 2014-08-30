---
layout: default
title: MQWeb &bull; MessageController
api: true
hideSidebar: true
---
MessageController
=================

The second part of the URI must be `message` to call the MessageController.
This controller can be used to get messages from a queue.

##browse

The action browse is used to browse one or more messages. The returned JSON object 
will have a `mqweb` object and a `messages` array.
The MQMD of each message will be translated into a JSON object. A message Id
or a correlation id is returned in hexadecimal format. When a WebSphere MQ 
error occurred there will be no `messages` array, but instead an `error` object 
is returned.

###URL Parameters

`/api/message/browse/<QueueManager>/<QueueName>`  

**QueueManager**
 
The name of the queuemanager. This parameter is required.

**QueueName**

The name of a queue. This parameter is required.

**messageId** (optional)
  
A message id in hex format.

###Query Parameters

**Limit** (optional)

When no message id is passed, you can limit the number of messages to return.

**Teaser** (optional)

When a message has format MQFMT_STRING, a part of the message can be returned.

###Example

`/api/message/browse/PIGEON/MQWEB.TEST.Q1`  
`/api/message/browse/PIGEON/MQWEB.TEST.Q1?Limit=100`

##dump

The action dump can be used to browse one message and get the data in hexidecimal,
ebcdic and ascii format.
The returned JSON object will have a `mqweb` object and a `message` object.
The MQMD will be translated to JSON and results in properties on the `message`
object. The message will also have a `dump` property which contains some arrays
that represents the message data. The `hex` property will contain an array with 
a hexadecimal representation of the message data. The `ascii` property will 
contain an array with a ASCII representation of the message data. And the 
`ebcdic` property will contain an array with an EBCIDIC representation of the 
message data. 

###URL Parameters

`/api/message/dump/<QueueManager>/<Queue>/<MessageId>`  

**QueueManager**
 
The name of the queuemanager. This parameter is required.

**QueueName**

The name of a queue. This parameter is required.
    
**MessageId**
  
A message id in hex format. This parameter is required.

###Example

`/api/message/dump/PIGEON/MQWEB.TEST.Q1/414D512053504152524F5720202020202BA4755304000010`  

##event

The event action is used to return event messages. The returned JSON object will 
have a `mqweb` object and an `events` array. Each event item, will have a `message` property 
with a MQMD that is translated to JSON, it will have an `event` object with the specific event 
information and a `reason` object.

###URL Parameters

`/api/message/event/<QueueManager>/<QueueName>/<MessageId>`  

**QueueManager**
 
The name of the queuemanager. This parameter is required.

**QueueName**

The name of a queue which contains event messages. This parameter is required.
    
**MessageId** (optional)
  
A message id in hex format. When no message id is set, all event messages will be returned.

###Query Parameters

**Limit** (optional)

When no message id is passed, you can limit the number of messages to return.

###Example

`/api/message/event/PIGEON/SYSTEM.ADMIN.QGMR.EVENT`  
