defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    String.split(path,".")
    |> do_extract(data)
  end

  defp do_extract([key],data), do: data[key]
  defp do_extract([h|t],data), do: do_extract(t,data[h])

  def get_in_path(data, path) do
    get_in(data,String.split(path,"."))
  end
end
