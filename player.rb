class Player
  @@players = [ ]

  def self.inherited( player )
    @@players << player
  end

  def self.each_pair
    (0...(@@players.size - 1)).each do |i|
      ((i + 1)...@@players.size).each do |j|
        yield @@players[i], @@players[j]
      end
    end
  end

  def initialize( opponent )
    @opponent = opponent
  end

  def choose
    raise NoMethodError, "Player subclasses must override choose()."
  end

  def result( you, them, win_lose_or_draw )
    # do nothing--sublcasses can override as needed
  end
end
