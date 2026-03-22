import { LightningElement } from 'lwc';

export default class AnalyticsDashboard extends LightningElement {

    get channelStats() {
        return [
            { channel: 'WhatsApp', messages: 247, conversion: '23%' },
            { channel: 'SMS', messages: 156, conversion: '18%' },
            { channel: 'Voice', messages: 42, conversion: '35%' }
        ];
    }
}