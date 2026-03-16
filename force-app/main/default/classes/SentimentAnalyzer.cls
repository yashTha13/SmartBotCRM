public class SentimentAnalyzer {

    @future
    public static void analyzeConversation(String conversationId){

        CustomerInteraction__c conv = [
            SELECT Id, Message__c
            FROM CustomerInteraction__c
            WHERE Id = :conversationId
        ];

        Decimal sentimentScore;

        if(conv.Message__c != null && conv.Message__c.contains('bad')){
            sentimentScore = -0.8;
        }
        else if(conv.Message__c != null && conv.Message__c.contains('good')){
            sentimentScore = 0.8;
        }
        else{
            sentimentScore = 0.0;
        }

        conv.SentimentScore__c = sentimentScore;

        update conv;

    }

}