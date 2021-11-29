defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part(ast, acc) do
    {ast, decode_ast(ast, acc)}
  end

  defp decode_ast({atom, _, rest}, acc) when atom in [:def, :defp] do
    rest =
      case rest do
        [ {:when, _, rest_when}| _ ] -> rest_when
        _ -> rest
      end

    [ {message, _, aarity}| _] = rest

    [get_sliced_message(message,aarity)| acc]
  end

  defp decode_ast(_, acc), do: acc

  defp get_sliced_message(_,nil), do: ""
  defp get_sliced_message(_,[]), do: ""
  defp get_sliced_message(message,aarity), do: String.slice(Atom.to_string(message),0..length(aarity)-1)

  def decode_secret_message(string) do
    {_, l} =
      to_ast(string)
      |> Macro.prewalk([], &decode_secret_message_part(&1, &2))

    Enum.reverse(l)
    |> Enum.join()
  end
end
