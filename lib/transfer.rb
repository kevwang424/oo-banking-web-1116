require "pry"

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(from_account,to_account, amount)
    @sender = from_account
    @receiver = to_account
    @status = "pending"
    @amount = amount
  end

  def valid?
    return true if sender.valid? == true && receiver.valid? == true
    false
  end

  def execute_transaction
    # binding.pry
    if status == "pending" && sender.balance < amount
      # binding.pry
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif status == "pending" && valid?
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    end
  end

end
