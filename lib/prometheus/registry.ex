defmodule Prometheus.Registry do
  @moduledoc """
  A registry of Collectors.

  The majority of users should use the `:default`, rather than their own.

  Creating a registry other than the default is primarily useful for
  unit tests, or pushing a subset of metrics to the
  [Pushgateway](https://github.com/prometheus/pushgateway) from batch jobs.
  """

  use Prometheus.Erlang, :prometheus_registry

  @doc """
  Calls `callback` for each collector with two arguments: `registry` and `collector`.
  """
  defmacro collect(callback, registry \\ :default) do
    Erlang.call([registry, callback])
  end

  @doc """
  Returns collectors registered in `registry`.
  """
  defmacro collectors(registry \\ :default) do
    Erlang.call([registry])
  end

  @doc """
  Register a collector.
  """
  defmacro register_collector(collector, registry \\ :default) do
    Erlang.call([registry, collector])
  end

  @doc """
  Register collectors list.
  """
  defmacro register_collectors(collectors, registry \\ :default) do
    Erlang.call([registry, collectors])
  end

  @doc """
  Unregister a collector.
  """
  defmacro deregister_collector(collector, registry \\ :default) do
    Erlang.call([registry, collector])
  end

  @doc """
  Unregister all collectors.
  """
  defmacro clear(registry \\ :default) do
    Erlang.call([registry])
  end

  @doc """
  Check whether `collector` is registered.
  """
  defmacro collector_registered?(collector, registry \\ :default) do
    Erlang.call([registry, collector])
  end

end
