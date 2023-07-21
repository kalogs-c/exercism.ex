defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(minutes_in_oven) do
    expected_minutes_in_oven() - minutes_in_oven
  end

  def preparation_time_in_minutes(layers_ammount), do: layers_ammount * 2

  def total_time_in_minutes(layers_ammount, minutes_in_oven) do
    preparation_time_in_minutes(layers_ammount) + minutes_in_oven
  end

  def alarm, do: "Ding!"
end