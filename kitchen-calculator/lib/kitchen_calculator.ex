defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({unit, volume}) do
    new_volume = case unit do
      :milliliter -> volume
      :cup -> 240 * volume
      :fluid_ounce -> 30 * volume
      :teaspoon -> 5 * volume
      :tablespoon -> 15 * volume
    end

    {:milliliter, new_volume}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    new_volume = case unit do
      :milliliter -> volume
      :cup -> volume / 240
      :fluid_ounce -> volume / 30
      :teaspoon -> volume / 5
      :tablespoon -> volume / 15
    end

    {unit, new_volume}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair) 
    |> from_milliliter(unit)
  end
end
