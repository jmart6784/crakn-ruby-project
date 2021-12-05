class Journal
  attr_reader :lines

  def initialize(*lines)
    @lines = lines
  end

  def total
    @lines.reduce(0) do |sum, line|
      if line.debit
        sum + line.amount
      else
        sum - line.amount
      end
    end
  end

  def add(line)
    @lines << line
  end

  class Line
    attr_reader :amount, :debit

    def initialize(amount, debit: true)
      @amount = amount
      @debit = debit
    end
  end
end
