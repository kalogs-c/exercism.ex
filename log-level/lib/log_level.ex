defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      {level, legacy?} === {0, true} -> :unknown
      {level, legacy?} === {5, true} -> :unknown
      level === 0 -> :trace
      level === 1 -> :debug
      level === 2 -> :info
      level === 3 -> :warning
      level === 4 -> :error
      level === 5 -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label == :error or label == :fatal -> :ops
      {label, legacy?} == {:unknown, true} -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end
end
