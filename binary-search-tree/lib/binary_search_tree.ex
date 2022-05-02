defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(nil, data) do
    new(data)
  end

  def insert(%{data: current_data, left: left, right: right}, data) do
    if data <= current_data do
      %{data: current_data, left: insert(left, data), right: right }
    else
      %{data: current_data, left: left, right: insert(right, data) }
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    do_in_order([], tree)
  end

  defp do_in_order(list, nil) do
    list
  end

  defp do_in_order(list, %{data: data, left: left, right: nil}) do
    do_in_order([data | list], left)
  end

  defp do_in_order(list, %{data: data, left: left, right: right}) do
    list = do_in_order(list, right)
    list = [data | list]
    do_in_order(list, left)
  end
end
