/**
* Created by ASUS on 21.07.2022.
*/

public with sharing class HomeWork10 {

    public static List<Opportunity> updateOpportunityStage(String stageNew, String stageOld) {
        List <Opportunity> opportunities = [SELECT Name,StageName FROM Opportunity WHERE StageName =:stageOld];
        List<Schema.PicklistEntry> opportunityStages = Opportunity.StageName.getDescribe().getPicklistValues();
        Set<String> setStages = new Set<String>();
        for (Schema.PicklistEntry oppStg : opportunityStages) {
            setStages.add(oppStg.getValue());
            if (setStages.contains(stageNew) && setStages.contains(stageOld)) {
                for (Opportunity ops : opportunities) {
                    ops.StageName = stageNew;
                }
            }
        }
        update opportunities;
        return  opportunities;
    }
}