module TransactionsHelper
  def convertAmount(amount, debitOrCredit)
    if debitOrCredit == 0
      amount *= -1
    end
  end
  
end
