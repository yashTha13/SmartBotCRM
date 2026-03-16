public class ChurnPredictor {

    @InvocableMethod(label='Predict Churn Risk')
    public static List<ChurnResult> predictChurn(List<Account> accounts) {

        List<ChurnResult> results = new List<ChurnResult>();

        for(Account acc : accounts){

            Decimal probability = Math.random() * 100;

            ChurnResult res = new ChurnResult();
            res.accountId = acc.Id;
            res.churnProbability = probability;

            results.add(res);
        }

        return results;
    }

    public class ChurnResult {

        @InvocableVariable
        public String accountId;

        @InvocableVariable
        public Decimal churnProbability;

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getHighRiskAccounts() {

        return [
            SELECT Id, Name, AnnualRevenue, NumSupportCases__c
            FROM Account
            WHERE NumSupportCases__c > 5
            LIMIT 10
        ];

    }

}