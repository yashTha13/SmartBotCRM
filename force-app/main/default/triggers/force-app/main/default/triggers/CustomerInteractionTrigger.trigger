trigger CustomerInteractionTrigger on CustomerInteraction__c (after insert) {

    List<String> ids = new List<String>();

    for(CustomerInteraction__c conv : Trigger.new){
        if(conv.Message__c != null){
            ids.add(conv.Id);
        }
    }

    if(!ids.isEmpty()){
        SentimentAnalyzer.bulkAnalyze(ids);
    }
}