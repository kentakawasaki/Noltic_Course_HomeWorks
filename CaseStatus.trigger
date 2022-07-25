

trigger CaseStatus on Case (after update,after insert,before update,before insert) {
    updateMassageCases.updateSuccessMessage(Trigger.new);
}