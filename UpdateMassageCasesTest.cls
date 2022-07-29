/**
 * Created by ASUS on 26.07.2022.
 */

@IsTest
private class UpdateMassageCasesTest {

    private static List<Case> createCase(Integer count,Id countryId) {
        List<Case> cases = new List<Case>();

        for (Integer i = 0; i < count; i++) {
            Case cs = new Case(Status = 'Closed',Country__c = countryId);
            cases.add(cs);
        }

        return cases;
    }

    @testSetup
    private static void makeData() {
        Country__c testCountry = new Country__c(Name = 'Test',ClosedCases__c = 4,SuccessMessage__c = 'Hello, trailblazer! This is greeting from Test');
        insert testCountry;
    }

    @isTest
    private static void updateClosedCasesTest() {
        Country__c testCountry = [SELECT Id From Country__c LIMIT 1];
        List<Case> cases = createCase(1, testCountry.Id);

        Test.startTest();
        updateMassageCases.updateSuccessMessage(cases);
        Test.stopTest();

        testCountry = [SELECT ClosedCases__c From Country__c LIMIT 1];
        System.assertEquals(5, testCountry.ClosedCases__c);
    }
    @isTest
    private static void updateSuccessMessageTest() {
        Country__c testCountry = [SELECT Id From Country__c LIMIT 1];
        List<Case> cases = createCase(1, testCountry.Id);

        Test.startTest();
        updateMassageCases.updateSuccessMessage(cases);
        Test.stopTest();

        testCountry = [SELECT SuccessMessage__c From Country__c LIMIT 1];
        System.assertEquals('Hello, trailblazer! This is greeting from Test', testCountry.SuccessMessage__c );
    }


}
