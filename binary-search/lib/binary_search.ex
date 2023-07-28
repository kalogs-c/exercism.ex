defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """
  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp get_middle(low, high) do 
    high
    |> Kernel.+(low)
    |> Kernel./(2)
    |> trunc()
  end

  defp search(_, _, low, high) when low > high, do: :not_found

  defp search(numbers, key, low, high) when low == high do
    case elem(numbers, low) do
      n when n == key -> {:ok, low}
      _ -> :not_found
    end
  end

  defp search(numbers, key, low, high) when low < high do
    middle = get_middle(low, high)

    case elem(numbers, middle) do
      n when key > n -> search(numbers, key, middle + 1, high)
      n when key < n -> search(numbers, key, low, middle)
      n when key === n -> {:ok, middle}
      _ -> :not_found
    end
  end
end
