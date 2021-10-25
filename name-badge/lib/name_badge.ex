defmodule NameBadge do
  def print(id, name, department) do
    print_string(id,name,department)
  end

  defp print_string(id,name,department), do: id_string(id) <> "#{name} - " <> dep_string(department)

  defp id_string(nil), do: ""
  defp id_string(id), do: "[#{id}] - "

  defp dep_string(nil), do: "OWNER"
  defp dep_string(department), do: "#{String.upcase(department)}"
end
