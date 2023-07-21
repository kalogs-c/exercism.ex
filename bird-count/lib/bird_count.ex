defmodule BirdCount do
  def today(list) do
    case list do
      [head | _] -> head
      [] -> nil
    end
  end

  def increment_day_count(list) do
    case list do
      [head | tail] -> [head + 1 | tail]
      [] -> [1]
    end
  end

  def has_day_without_birds?(list) do
    case list do
      [0 | _] -> true
      [_ | tail] -> has_day_without_birds?(tail)
      [] -> false
    end
  end

  def total(list) do
    total(0, list)
  end

  defp total(count, []), do: count
  
  defp total(count, [head | tail]), do: total(count + head, tail)

  def busy_days(list) do
    busy_days(0, list)
  end

  defp busy_days(count, []), do: count

  defp busy_days(count, [head | tail]) when head > 4, do: busy_days(count + 1, tail)

  defp busy_days(count, [_ | tail]), do: busy_days(count, tail)
end
