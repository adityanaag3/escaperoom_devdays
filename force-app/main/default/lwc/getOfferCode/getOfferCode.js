import { LightningElement } from 'lwc';
import getOfferCode from '@salesforce/apex/OfferCodeCtrl.getOfferCode';
import LightningAlert from "lightning/alert";

export default class GetOfferCode extends LightningElement {
    handleClick(e){
        getOfferCode()
            .then(result => {
                if(result){
                    this.showSuccess(result);
                } else {
                    this.showError('No offer code found');
                }
            })
            .catch(error => {
                this.showError('Unable to fetch offer code');
            });
    }

    showError(message){
        LightningAlert.open({
            message: message,
            theme: 'error',
            label: 'An error occurred'
        });
        console.error(message);
    }

    showSuccess(message){
        LightningAlert.open({
            message: message,
            theme: 'success',
            label: 'Your offer code'
        });
        console.error(message);
    }
}