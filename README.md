Exqpid
======
Exqpid is the wrapper for qpidpn.

Exqpid depends on qpidpn. Follow the below steps:-

1. install [Apache Qpid Proton 0.7](http://qpid.apache.org/download.html)
2. Set the `ERLANG_HOME`, If you have installed in a location other than such as '/usr', '/usr/local'.
   Set the `QPID_PROTON_HOME`, If you have installed in a location other than such as '/usr', '/usr/local'.
3. `mix deps.get`
4. `mix deps.compile`
5. `iex -S mix`

### Start Exqpid

	Exqpid.start() :: {:ok, pid} | {:error, :not_started}

### Publish to topic

	Exqpid.publish(:topic, 'mytopic', 'hello') :: :ok | {:error, :not_published}

### Publish to queue

	Exqpid.publish(:queue, 'myqueue', 'hello') :: :ok | {:error, :not_published}

### Subscribe to topic

	Exqpid.subscribe(:topic, 'mytopic') :: :ok | {:error, :not_subscribed}

### Subscribe to Queue
	
	Exqpid.subscribe(:queue, 'myqueue') :: :ok | {:error, :not_subscribed}
