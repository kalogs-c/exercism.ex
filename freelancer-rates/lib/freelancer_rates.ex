defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount) do
    discount_amount = discount * before_discount / 100

    before_discount - discount_amount
  end

  def monthly_rate(hourly_rate, discount) do
    mounth_ammount = daily_rate(hourly_rate) * 22
    discount_ammount = discount * mounth_ammount / 100

    mounth_ammount - discount_ammount
      |> Float.ceil()
      |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_value = hourly_rate
      |> daily_rate()
      |> apply_discount(discount)

    budget / daily_value
      |> Float.floor(1)
  end
end
