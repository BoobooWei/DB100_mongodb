# MongoDB �����ļ����

[TOC]

## ϵͳ��־systemLog Options

```shell
systemLog:
   verbosity: <int>    #��3.0����ģ���ϸ���������MongoDB�������Ϣ���͵�������Ĭ��Ϊ0     
   quiet: <boolean>    #��Ĭģʽ�����Ƽ�����ʹ�ã��������Ų�����
   traceAllExceptions: <boolean>    #��ӡ��ϸ�ĵ�����Ϣ��ʹ��������־��¼����֧����صĹ����ų���
   syslogFacility: <string>    #����Ϣ��¼��ϵͳ��־ʱʹ�õ���ʩ����
   path: <string>    #mongod��mongosӦ�������������־��Ϣ����־�ļ���·������ָ����·���ϴ�����־�ļ�
   logAppend: <boolean>    #Ϊtrue������mongos��mongod ʵ����������ʱ������Ŀ���ӵ�������־�ļ���ĩβ
   logRotate: <string>    #3.0.0�°湦�ܣ�����ѡ�� rename,reopen,logAppend����Ϊtrue
   destination: <string>    #MongoDB����������־�����Ŀ�ĵ�����ѡ�file or syslog
   timeStampFormat: <string> #Default: iso8601-local 1969-12-31T19:00:00.000-0500
   component:
      accessControl:
         verbosity: <int>
      command:
         verbosity: <int>
         
eg:
systemLog:
   destination: file
   path: "/alidata/mongodb/log/mongod_22001.log"
   logAppend: true
```

> verbosity: 
>
> ��ϸ����ķ�Χ���Դ�0��5��
>
> 0��MongoDBĬ�ϵ���־��ϸ���𣬰��� ��Ϣ����Ϣ��
>
> 1�� 5��������ϸ�����԰��� ������Ϣ��
>
> �ο���ַ��http://docs.mongoing.com/reference/log-messages.html#log-messages-configure-verbosity
>
> logRotate��
>
> rename����������־�ļ���
> reopen���رղ����´���־�ļ�����ѭ���͵�Linux / Unix��־��ת��Ϊ��ʹ��Linux / Unix��logrotate����ʱҪ���´򿪣��Ա�����־��ʧ��
> reopen���򻹱��뽫systemLog.logAppend����Ϊtrue��

## ���̹���processManagement Options

```shell
processManagement:
   fork: <boolean>    #Ĭ�ϣ�False �����ں�̨����mongos��mongod���̵��ػ�����ģʽ
   pidFilePath: <string>
```

## ����ѡ��Net Options

```shell
net:
   port: <int>    #Ĭ�ϣ�27017
   bindIp: <string>    #4.0Ĭ��ֻ�����ط��ʡ�3.2Ĭ���������С�mongos��mongod�󶨵�IP��ַ������������Ӧ�ó��������Ҫ�󶨵����IP��ַ�������붺�ŷָ�ֵ�б�
   maxIncomingConnections: <int>    #Ĭ�ϣ�65536��mongos��mongod���Խ��ܵ���󲢷���������
   wireObjectCheck: <boolean>    #Ĭ��ֵ��True
   ipv6: <boolean> #�ڰ汾3.0��ɾ����MongoDB 3.0�͸��߰汾�У�IPv6ʼ�մ�������״̬��
   unixDomainSocket:
      enabled: <boolean>
      pathPrefix: <string>    #Ĭ�ϣ�/ tmp
      filePermissions: <int>    #Ĭ�ϣ�0700 ����UNIX���׽����ļ���Ȩ�� ֻ�����ڻ���Unix��ϵͳ
   http:
      enabled: <boolean>    #Default: False 3.2 ������Ƴ�
      JSONPEnabled: <boolean>
      RESTInterfaceEnabled: <boolean>
   ssl:
      sslOnNormalPorts: <boolean> # 2.6������Ƴ�����3.0�汾���ģ������MongoDB���а����ڰ�����TLS / SSL��֧��
      mode: <string>    #2.6 �°湦��.
      PEMKeyFile: <string>
      PEMKeyPassword: <string>
      clusterFile: <string>
      clusterPassword: <string>
      CAFile: <string>
      CRLFile: <string>
      allowConnectionsWithoutCertificates: <boolean>
      allowInvalidCertificates: <boolean>
      allowInvalidHostnames: <boolean>
      disabledProtocols: <string>
      FIPSMode: <boolean>
```

## ��ȫSecurity Options

```shell
 security:
   keyFile: <string>
   clusterAuthMode: <string>    #2.6�°湦�ܡ�
   authorization: <string>    #Ĭ�ϣ����� ���û���û��ڽ�ɫ�ķ��ʿ��ƣ�RBAC��������ÿ���û������ݿ���Դ�Ͳ����ķ��ʡ�
   transitionToAuth: <boolean>    #Ĭ�ϣ�False 3.4 �°湦��: 
   javascriptEnabled:  <boolean>    #Ĭ��ֵ��True ���û���÷�������JavaScriptִ��
   redactClientLogData: <boolean>    #3.4�°湦�ܣ���������MongoDB Enterprise��
   sasl:
      hostName: <string>
      serviceName: <string>
      saslauthdSocketPath: <string>
   enableEncryption: <boolean>    #Ĭ�ϣ�False 3.2�°湦�ܣ�ΪWiredTiger�洢�������ü��� ����MongoDB Enterprise�п���
   encryptionCipherMode: <string>    #3.2�°湦�� ����MongoDB Enterprise�п���
   encryptionKeyFile: <string>    #����MongoDB Enterprise�п���
   kmip:
      keyIdentifier: <string>    #3.2�°湦��
      rotateMasterKey: <boolean>
      serverName: <string>
      port: <string>
      clientCertificateFile: <string>
      clientCertificatePassword: <string>
      serverCAFile: <string>
   ldap:    #3.4�°湦�ܣ���������MongoDB Enterprise��
      servers: <string>
      bind:
         method: <string>
         saslMechanism: <string>
         queryUser: <string>
         queryPassword: <string>
         useOSDefaults: <boolean>    #3.4�°湦�ܣ���������Windowsƽ̨��MongoDB Enterprise��
      transportSecurity: <string>
      timeoutMS: <int>
      userToDNMapping: <string>
      authz:
         queryTemplate: <string>
```

## ��������setParameter Option

```shell
setParameter:
   <parameter1>: <value1>
   <parameter2>: <value2>
   
eg:
setParameter:
   enableLocalhostAuthBypass: false
   ldapUserCacheInvalidationInterval: <int> #Ĭ�ϣ�30
```

## �洢Storage Options

```shell
storage:
   dbPath: <string>    #ȱʡֵ��Linux��OS X�ϵ�/data/db��Windows�ϵ�\data\db
   indexBuildRetry: <boolean>    #Ĭ��ֵ��True mongod�Ƿ����´�����ʱ�ؽ������������� ��������ʹ���ڴ�洢�����mongodʵ��
   repairPath: <string>    
   journal: 
      enabled: <boolean>    #Default: true on 64-bit systems, false on 32-bit systems
      commitIntervalMs: <num> #Ĭ��ֵ��100��30 3.2�°湦��
   directoryPerDB: <boolean>    #Ĭ�ϣ�False
   syncPeriodSecs: <int>   #Ĭ�ϣ�60 ��Ҫ������ϵͳ���������ֵ���ڼ�����������£�����Ӧ��ʹ��Ĭ�����á�
   engine: <string>    #��3.2�汾���ģ���MongoDB 3.2��ʼ��wiredTiger��Ĭ�ϵ�
   mmapv1:
      preallocDataFiles: <boolean>    #Ĭ��ֵ��True 2.6������Ƴ�
      nsSize: <int>    #Ĭ�ϣ�16
      quota:
         enforced: <boolean>    #Ĭ�ϣ�false MongoDBÿ�����ݿ������8�������ļ� ʹ��storage.quota.maxFilesPerDB������� ��
         maxFilesPerDB: <int>    #Ĭ�ϣ�8
      smallFiles: <boolean>    #Ĭ�ϣ�False
      journal:
         debugFlags: <int>    #���ͣ����� �ṩ���Թ���
         commitIntervalMs: <num>    #3.2�汾���Ƴ�
   wiredTiger:
      engineConfig:
         cacheSizeGB: <number>    #���ͣ�float WiredTiger�������������ݵ��ڲ����������С�����Ƶ������ڴ�
         #�����ڴ�-wiredtiger-��������-ϵͳ��ռ�õ��ڴ�=filesystem cache
         journalCompressor: <string>    #Ĭ�ϣ�snappy 3.0.0�°湦��
         directoryForIndexes: <boolean>    #Ĭ�ϣ�false 3.0.0�°湦��
      collectionConfig:
         blockCompressor: <string>    #Ĭ�ϣ�snappy 
      indexConfig:
         prefixCompression: <boolean>    #Ĭ��ֵ��true 
   inMemory:
      engineConfig:
         inMemorySizeGB: <number>    #Ĭ��ֵ������RAM��50������1 GB ��3.4�汾���ģ���ֵ���Դ�256MB��10TB��������һ�������� ����MongoDB Enterprise�п���
```

## OperationProfiling Options

```shell
operationProfiling:
   slowOpThresholdMs: <int>    #Ĭ��ֵ��100 ���ݿ��������Ϊ��ѯ����ֵ���Ժ���Ϊ��λ��������
   mode: <string>    #Ĭ�ϣ��ر� ���ݿ�������ܻ�Ӱ�����ݿ����� off,slowOp,all
```

## ����Replication Options

```shell
replication:
   oplogSizeMB: <int>    #ype: integer �����ֽ�Ϊ��λ ����64λϵͳ��oplogͨ���ǿ��ô��̿ռ��5��
   replSetName: <string>   #���ͣ��ַ���
   secondaryIndexPrefetch: <string>    #Ĭ�ϣ�ȫ�� ���� mmapv1 �洢�����п��� none,all,_id_only
   enableMajorityReadConcern: <boolean>    #Ĭ�ϣ�False 3.2�°湦��  
```

## ��Ⱥ��Ƭsharding Options

```shell
sharding:
   clusterRole: <string>    #configsvr Ĭ�������˿�27019 shardsvr Ĭ�������˿�27018
   archiveMovedChunks: <boolean>    #3.2�汾���ģ���3.2��ʼ��MongoDB Ĭ��ʹ��false �ڿ�Ǩ���ڼ䣬��Ƭ������ӷ�ƬǨ�Ƶ��ĵ�
```

## �����־AuditLog Options

> ע��
>
> Available only in?[MongoDB Enterprise](http://www.mongodb.com/products/mongodb-enterprise?jmp=docs)

```shell
auditLog:
   destination: <string>    #2.6 �°湦��
   format: <string>
   path: <string>
   filter: <string>
```

## ���������Э�� snmp Options

```shell
snmp:
   subagent: <boolean>
   master: <boolean>
```

## Mongos-only Options

```shell
replication:
   localPingThresholdMs: <int>    #Default: 15 �Ժ���Ϊ��λ

sharding:
   configDB: <string> #��MongoDB 3.2��ʼ����Ƭ��Ⱥ�����÷��������Բ���Ϊһ�������������������÷�������������WiredTiger�洢���档MongoDB 3.2�������÷��������������� mongodʵ����

eg��
sharding��
  configDB��<configReplSetName> /cfg1.example.net:27017��cfg2.example.net:27017��...
```

## Windows Service Options

```shell
processManagement:
   windowsService:    
      serviceName: <string>    # default: MongoDB
      displayName: <string>
      description: <string>
      serviceUser: <string>
      servicePassword: <string>
```

# MongoDB WT����������

## ��ʵ������

```shell
systemLog:
 destination: file
###��־�洢λ��
 path: /data/mongodb/log/mongod.log
 logAppend: true
storage:
##journal����
 journal:
  enabled: true
##�����ļ��洢λ��
 dbPath: /data/zhou/mongo1/
##�Ƿ�һ����һ���ļ���
 directoryPerDB: true
##��������
 engine: wiredTiger
##WT��������
 wiredTiger:
  engineConfig:
##WT���ʹ��cache�����ݷ�����ʵ��������ڣ�
   cacheSizeGB: 10
##�Ƿ�����Ҳ�����ݿ��������洢
   directoryForIndexes: true
##��ѹ������
  collectionConfig:
   blockCompressor: zlib
##��������
  indexConfig:
   prefixCompression: true
##�˿�����
net:
 port: 27017
```

## ���Ƽ�����

�������������ϼ������¼������ã���

```shell
replication:
##oplog��С
 oplogSizeMB: 20
##���Ƽ�����
 replSetName: zhou1
```

## ��Ƭ��Ⱥ����

��Ƭ���Ƽ�����

����ʵ���ڵ�Ļ����ϣ���

```shell
replication:
##oplog��С
 oplogSizeMB: 20
##���Ƽ�����
 replSetName: zhou1
##��Ƭ����
sharding:
##��Ƭ��ɫ
 clusterRole: shardsvr
```

## config server����

����ʵ���ڵ�Ļ����ϣ�

```shell
##��Ƭ����
sharding:
##��Ƭ��ɫ
 clusterRole: configsvr

```

## Mongos����

���뵥ʵ����ͬ����

```shell
##��־����
systemLog:
 destination: file
##��־λ��
 path: /data/mongos/mongod.log
 logAppend: true
##��·����
net:
##�˿�����
 port: 29020
##��Ƭ����
sharding:
##ָ��config server
 configDB: 10.96.29.2:29017,10.96.29.2:29018,10.96.29.2:29019
```