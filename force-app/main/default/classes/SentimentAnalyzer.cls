public class SentimentAnalyzer {

    @future
    public static void bulkAnalyze(List<String> conversationIds){

        List<CustomerInteraction__c> records = [
            SELECT Id, Message__c
            FROM CustomerInteraction__c
            WHERE Id IN :conversationIds
        ];

        for(CustomerInteraction__c conv : records){

            Decimal score;

            if(conv.Message__c != null && conv.Message__c.contains('bad')){
                score = -0.8;
            }
            else if(conv.Message__c != null && conv.Message__c.contains('good')){
                score = 0.8;
            }
            else{
                score = 0;
            }

            conv.SentimentScore__c = score;
        }

        update records; // ONE DML ✔
    }
}