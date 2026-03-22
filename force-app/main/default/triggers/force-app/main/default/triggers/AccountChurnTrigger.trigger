trigger AccountChurnTrigger on Account (after update) {

    List<Account> highRiskAccounts = new List<Account>();

    for(Account acc : Trigger.new){

        Account oldAcc = Trigger.oldMap.get(acc.Id);

        if(acc.NumSupportCases__c > oldAcc.NumSupportCases__c){
            highRiskAccounts.add(acc);
        }
    }

    // SINGLE method call (bulk safe)
    if(!highRiskAccounts.isEmpty()){
        ChurnPredictor.predictChurn(highRiskAccounts);
    }

}