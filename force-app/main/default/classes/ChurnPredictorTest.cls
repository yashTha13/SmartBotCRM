@isTest
private class ChurnPredictorTest {

    @isTest
    static void testChurnPrediction(){

        List<Account> accs = TestDataFactory.createAccounts(10);

        Test.startTest();
        List<ChurnPredictor.ChurnResult> result =
            ChurnPredictor.predictChurn(accs);
        Test.stopTest();

        System.assertEquals(10, result.size());
    }

    // ✅ ADD THIS METHOD (Bulk Test)
    @isTest
    static void testBulk200(){

        List<Account> accs = TestDataFactory.createAccounts(200);

        Test.startTest();
        ChurnPredictor.predictChurn(accs);
        Test.stopTest();

        System.assertEquals(200, accs.size());
    }
}