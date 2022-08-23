import {LightningElement, api, wire} from 'lwc';
import getDiaryList from '@salesforce/apex/DiaryController.getDiaryList';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Diary__c.Name'
import RELATED_FIELD from '@salesforce/schema/Diary__c.Contact__c'
import DIARY_OBJECT from '@salesforce/schema/Diary__c';
import NOTE_FIELD from '@salesforce/schema/Diary__c.Note__c';
import { refreshApex } from '@salesforce/apex';
import { deleteRecord } from 'lightning/uiRecordApi';
export default class relatedContact extends LightningElement {
    @api recordId;
    Note;
    @api dairyId;

    @wire(getDiaryList, {contactId: '$recordId'})
    records;

    handleNoteChange(event) {
        this.Note = event.target.value;
    }

    createDiary() {
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.Note;
        fields[NOTE_FIELD.fieldApiName] = this.Note;
        fields[RELATED_FIELD.fieldApiName]=this.recordId;
        const recordInput = { apiName: DIARY_OBJECT.objectApiName, fields };
        createRecord(recordInput)
            .then((diary) => {
                this.records.data = diary.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Note created',
                        variant: 'success'
                    })
                );
                return refreshApex(this.records);
            })
            .catch((error) => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        variant: 'error'
                    })
                );
            });
    }
    deleteDiary(event) {
        const recordId = event.target.dataset.recordid;
        deleteRecord(recordId)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Note deleted',
                        variant: 'success'
                    })
                );
                return refreshApex(this.records);
            })
            .catch((error) => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting record',
                        variant: 'error'
                    })
                );
            });
    }
}