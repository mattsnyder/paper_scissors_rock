class RockPaperScissorsRules
  def rules
    {
     :paper => :rock,
     :rock => :scissors,
     :scissors => :paper
    }
  end
  
  def play(token1, token2)
    return nil if token1 == token2
    if rules[token1] == token2
      token1
    else
      token2
    end
  end
end
