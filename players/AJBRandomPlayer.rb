class AJBRandomPlayer < Player
  def choose
    [:paper, :scissors, :rock][rand(3)]
  end
end
