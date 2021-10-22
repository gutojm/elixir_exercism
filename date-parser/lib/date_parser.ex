defmodule DateParser do
  def day() do
    "[0-9]{1,2}"
  end

  def month() do
    "[0-9]{1,2}"
  end

  def year() do
    "[0-9]{4}"
  end

  def day_names() do
    "[A-Z][a-z]{4,}"
  end

  def month_names() do
    "(May|[A-Z][a-z]{3,})"
  end

  def capture_day() do
    "(?<day>#{day()})"
  end

  def capture_month() do
    "(?<month>#{month()})"
  end

  def capture_year() do
    "(?<year>#{year()})"
  end

  def capture_day_name() do
    "(?<day_name>#{day_names()})"
  end

  def capture_month_name() do
    "(?<month_name>#{month_names()})"
  end

  def capture_numeric_date() do
    "#{capture_day()}/#{capture_month()}/#{capture_year()}"
  end

  def capture_month_name_date() do
    "#{capture_month_name()}\\s#{capture_day()}, #{capture_year()}"
  end

  def capture_day_month_name_date() do
    "#{capture_day_name()},\\s#{capture_month_name_date()}"
  end

  def match_numeric_date() do
    "^#{capture_numeric_date()}$"
    |> Regex.compile!()
  end

  def match_month_name_date() do
    "^#{capture_month_name_date()}$"
    |> Regex.compile!()
  end

  def match_day_month_name_date() do
    "^#{capture_day_month_name_date()}$"
    |> Regex.compile!()
  end
end
