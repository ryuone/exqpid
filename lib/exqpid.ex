defmodule Exqpid do
  @moduledoc """
  Wrapper module for Qpidpn. Module provides functionality to access qpidpn functions from elixir
  """
  @host Application.get_env(:qpidpn, :host, "amqp://127.0.0.1/")

  @doc """
  Function starts the Qpidpn process.
  """
  @spec start() :: {atom, pid} | {atom, atom} 
  def start() do
    lib_path = Application.get_env(:qpidpn, :path, System.cwd() <> "/deps/qpidpn/priv")
    System.put_env("DYLD_LIBRARY_PATH", lib_path)
    System.put_env("LD_LIBRARY_PATH", lib_path)
    qpidpn_path = lib_path <> "/qpidpn"
    pid = :qpidpn.start(qpidpn_path)
    if is_pid(pid) do
      {:ok, pid}
    else
      {:error, :not_started}
    end  
  end  

  @doc """
  Function publishes message to a topic
  """
  @spec publish(atom, char_list, char_list) :: :ok | {atom, atom} 
  def publish(:topic, topic_name, body) do
    host = @host ++ 'topic://' ++ topic_name
    res = :qpidpn.publish(%{address: host, body: body})
    case res do
       :ok -> :ok
      _ -> {:error, :not_published} 
    end  
  end

  @doc """
  Function publishes message to a queue
  """
  @spec publish(atom, char_list, char_list) :: :ok | {atom, atom} 
  def publish(:queue, queue_name, body) do
    host = @host ++ 'queue://' ++ queue_name
    res = :qpidpn.publish(%{address: host, body: body})
    case res do
       :ok -> :ok
      _ -> {:error, :not_published} 
    end  
  end


  @doc """
  Function subscribe to a specified topic
  """
  @spec subscribe(atom, char_list) :: :ok | {atom, atom} 
  def subscribe(:topic, topic_name) do
    host = @host ++ 'topic://' ++ topic_name
    res = :qpidpn.subscribe(host)
    case res do
      {:ok, ref} -> {:ok, ref}
      _ -> {:error, :not_subscribed} 
    end  
  end

  @doc """
  Function subscribe to a specified queue
  """
  @spec subscribe(atom, char_list) :: :ok | {atom, atom} 
  def subscribe(:queue, queue_name) do
    host = @host ++ 'queue://' ++ queue_name
    res = :qpidpn.subscribe(host)
    case res do
      {:ok, ref} -> {:ok, ref}
      _ -> {:error, :not_subscribed} 
    end  
  end

  @doc """
  Function to start qpidpn service 
  """
  @spec stop() :: :ok  
  def stop() do
   :qpidpn.stop()
   :ok
  end  
end
