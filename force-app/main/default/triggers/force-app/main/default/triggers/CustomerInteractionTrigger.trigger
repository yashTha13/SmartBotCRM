trigger CustomerInteractionTrigger on CustomerInteraction__c (after insert) {

    for(CustomerInteraction__c conv : Trigger.new){

        if(conv.Message__c != null){

            SentimentAnalyzer.analyzeConversation(conv.Id);

        }

    }

}