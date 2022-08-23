

public with sharing class DiaryController {
    @AuraEnabled(cacheable=true)
    public static List<Diary__c> getDiaryList(Id contactId) {
        return [SELECT Name,Contact__c FROM Diary__c WHERE Contact__c =: contactId ];
    }

}