@isTest
private class SentimentAnalyzerTest {

    @TestSetup
    static void setup(){
        TestDataFactory.createInteractions(50);
    }

    @isTest
    static void testBulkSentiment(){

        List<CustomerInteraction__c> records = [
            SELECT Id FROM CustomerInteraction__c
        ];

        List<String> ids = new List<String>();

        for(CustomerInteraction__c c : records){
            ids.add(c.Id);
        }

        Test.startTest();
        SentimentAnalyzer.bulkAnalyze(ids);
        Test.stopTest();

        List<CustomerInteraction__c> updated = [
            SELECT SentimentScore__c FROM CustomerInteraction__c
        ];

        System.assert(updated.size() > 0);
    }
}