defmodule Exqpid do
  @host 'amqp://127.0.0.1'

  def start() do
    cwd = System.cwd()
    System.put_env("DYLD_LIBRARY_PATH", "/Users/atul/playground/qpid/exqpid/deps/qpidpn/priv")
    System.put_env("LD_LIBRARY_PATH", "/Users/atul/playground/qpid/exqpid/deps/qpidpn/priv")
    pid = :qpidpn.start()
    if is_pid(pid) do
      {:ok, pid}
    else
      {:error, "Not Stated"}
    end  
  end  


  def publish(:topic, topic_name, body) do
    host = @host ++ 'topic://' ++ topic_name
    :qpidpn.publish(%{address: host, body: body})
  end

  def publish(:queue, queue_name, body) do
    host = @host ++ 'queue://' ++ queue_name
    :qpidpn.publish(%{address: host, body: body})
  end


  def subscribe(:topic, topic_name) do
    host = @host ++ 'topic://' ++ topic_name
    :qpidpn.subscribe(host)
  end

  def subscribe(:queue, queue_name) do
    host = @host ++ 'queue://' ++ queue_name
    :qpidpn.subscribe(host)
  end

  def stop() do


  end  
    
end
