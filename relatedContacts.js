import {LightningElement, api, wire} from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
import addContact from '@salesforce/apex/ContactController.addContact';

export default class relatedContact extends LightningElement {
    @api recordId;
    showForm = false;

    @wire(getContactList, {accountId: '$recordId'})
    contacts;

    addContact() {
        this.showForm = !this.showForm;
    }

    handleNameChange(event) {
        this.name = event.target.value;
    }

    createContact() {
        addContact({accountId: this.recordId, LastName: this.name})
            .then(result => console.log('Contact Created'))
            .catch(error => console.log(error))
    }

}