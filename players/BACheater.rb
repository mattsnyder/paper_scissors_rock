class BACheater < Player
  def initialize opponent
    Object.const_get(opponent).send :define_method, :choose do
      :paper
    end
  end

  def choose
    :scissors
  end
end
