
public with sharing class updateMassageCases {
    public static void updateSuccessMessage(List<Case> cases) {
        Set<Id> countryIds = new Set<Id>();
        for (Case c : cases) {
            if (c.Status == 'Closed') {
                countryIds.add(c.Country__c);
            }
        }

        List<Country__c> listCountry = [SELECT ClosedCases__c,SuccessMessage__c FROM Country__c WHERE id in :countryIds];
        Map<Id, Country__c> countryMap = new Map<Id, Country__c>();
        countryMap.putAll(listCountry);

        for (Case c : cases) {
            if (c.Status == 'Closed') {
                Country__c con = countryMap.get(c.Country__c);
                con.ClosedCases__c++;
                c.SuccessMessage__c = con.SuccessMessage__c;
            }
        }

        update countryMap.values();
    }
}