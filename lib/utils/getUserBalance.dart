String returnAccountBalance(num creditBalance,num debitBalance){
  num totalBalance = creditBalance-debitBalance;
  return totalBalance.toString();
}