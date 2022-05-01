defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts) :: {:ok, opts} | {:error, error}
  @callback handle_frame(dot, frame_number, opts) :: dot

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation

      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def handle_frame(dot = %DancingDots.Dot{opacity: opacity}, frame_number, _opts) when rem(frame_number, 4) == 0 do
    %DancingDots.Dot{dot | opacity: opacity / 2}
  end

  def handle_frame(dot, _frame_number, _opts), do: dot
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  @impl DancingDots.Animation
  def init(opts) when is_list(opts) do
    velocity = opts[:velocity]

    case is_integer(velocity) do
      true -> {:ok, opts}
      _ -> {:error, "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
    end
  end

  @impl DancingDots.Animation
  def handle_frame(dot = %DancingDots.Dot{radius: radius}, frame_number, opts) do
    velocity = opts[:velocity]
    %DancingDots.Dot{dot | radius: radius + (frame_number - 1) * velocity}
  end
end
