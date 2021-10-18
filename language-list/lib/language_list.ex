defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language|list]
  end

  def remove([_|tail] = list) do
    tail
  end

  def first([head|_] = list) do
    head
  end

  def count(list) do
    length(list)
  end

  def exciting_list?(list) do
    "Elixir" in list
  end
end
