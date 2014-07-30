Exqpid
======
Exqpid is the wrapper for qpidpn.

Exqpid depends on qpidpn. Follow the below steps:-

1. Modify `qpidpn` Make file and change `QPID_PROTON_DIR` path to  `proton_build` path
2. `mix deps.get`
3. `mix deps.compile`
4. `iex -S mix`

### Start Exqpid

	Exqpid.start() : {:ok, pid} | {:error, :not_started}

### Publish to topic

	Exqpid.publish(:topic, 'mytopic', 'hello') :: :ok | {:error, :not_published}

### Publish to queue

	Exqpid.publish(:queue, 'myqueue', 'hello') :: :ok | {:error, :not_published}

### Subscribe to topic

	Exqpid.subscribe(:topic, 'mytopic') :: :ok | {:error, :not_subscribed}

### Subscribe to Queue
	
	Exqpid.subscribe(:queue, 'myqueue') :: :ok | {:error, :not_subscribed}
