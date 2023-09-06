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
                console.error('An error occurred when trying to fetch the offer code from a third-party system. Looks like some configuration to make the callout is missing. It is often due to incorrect commits to source control repo {!$Label.GitHub_Repo}')
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