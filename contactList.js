/**
 * Created by ASUS on 18.08.2022.
 */

import { LightningElement} from 'lwc';

export default class ContactList extends LightningElement {
    contacts = [
        {
            Id: 1,
            Name: 'Viktor',
            Phone: +380666821103
        },
        {
            Id: 2,
            Name: 'Petro',
            Phone: +3806212312212,
        },
        {
            Id: 3,
            Name: 'Vitaliy',
            Phone: +3806898898898,
        }
    ]
}