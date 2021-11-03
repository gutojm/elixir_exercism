defmodule LibraryFees do
  def datetime_from_string(string) do
    {_, n} = NaiveDateTime.from_iso8601(string)
    n
  end

  def before_noon?(datetime) do
    NaiveDateTime.to_time(datetime)
    |> Time.compare(~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    NaiveDateTime.to_date(checkout_datetime)
    |> Date.add(if before_noon?(checkout_datetime), do: 28, else: 29)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    d =
      NaiveDateTime.to_date(actual_return_datetime)
      |> Date.diff(planned_return_date)

    if d < 0 do
      0
    else
      d
    end
  end

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime)
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout = datetime_from_string(checkout)
    return = datetime_from_string(return)

    rate =
      if monday?(return) do
        rate / 2
      else
        rate
      end

    trunc(days_late(return_date(checkout),return)  * rate)
  end
end
