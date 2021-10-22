defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function

    for x <- username do
      do_sanitize(x)
    end
    |> Enum.filter(& &1 != nil)
    |> List.flatten()
  end

  defp do_sanitize(x) when x in ?a..?z, do: x
  defp do_sanitize(?_), do: ?_
  defp do_sanitize(?ä), do: 'ae'
  defp do_sanitize(?ö), do: 'oe'
  defp do_sanitize(?ü), do: 'ue'
  defp do_sanitize(?ß), do: 'ss'
  defp do_sanitize(_), do: nil
end
