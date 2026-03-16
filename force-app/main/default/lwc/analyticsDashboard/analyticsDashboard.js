import { LightningElement, wire, track } from 'lwc';
import { subscribe } from 'lightning/empApi';
import getHighRiskAccounts from '@salesforce/apex/ChurnPredictor.getHighRiskAccounts';

export default class AnalyticsDashboard extends LightningElement {

    @track highRiskAccounts;

    columns = [
        { label: 'Account Name', fieldName: 'Name' },
        { label: 'Revenue', fieldName: 'AnnualRevenue', type: 'currency' },
        { label: 'Support Cases', fieldName: 'NumSupportCases__c', type: 'number' }
    ];

    @wire(getHighRiskAccounts)
    accounts({error, data}){

        if(data){
            this.highRiskAccounts = data;
        }
        else if(error){
            console.error(error);
        }

    }

    connectedCallback(){

        subscribe('/event/ChurnAlert__e', -1, (response) => {

            console.log('Churn Alert Received');

            location.reload();

        });

    }

}