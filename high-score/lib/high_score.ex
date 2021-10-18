defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ 0) do
    Map.put(scores,name,score)
  end

  def remove_player(scores, name) do
    Map.delete(scores,name)
  end

  def reset_score(scores, name) do
    add_player(scores,name)
  end

  def update_score(scores, name, score) do    
    Map.put(scores,name,score+Map.get(scores,name,0))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
