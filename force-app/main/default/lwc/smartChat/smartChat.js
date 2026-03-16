import { LightningElement, track } from 'lwc';

export default class SmartChat extends LightningElement {
    @track messages = [];
    @track newMessage = '';
    @track isLoading = false;

    connectedCallback() {
        // Add welcome message
        this.messages = [{
            id: '1',
            text: 'Hello! How can I help you today?',
            type: 'ai',
            time: new Date().toLocaleTimeString()
        }];
    }

    handleInputChange(event) {
        this.newMessage = event.target.value;
    }

    handleKeyPress(event) {
        if (event.key === 'Enter') {
            this.handleSend();
        }
    }

    async handleSend() {
        if (!this.newMessage.trim()) return;

        // Add user message
        const userMsg = {
            id: Date.now().toString(),
            text: this.newMessage,
            type: 'user',
            time: new Date().toLocaleTimeString()
        };
        this.messages = [...this.messages, userMsg];
        
        this.isLoading = true;
        this.newMessage = '';

        // Simulate AI response (Phase 2 will be real)
        setTimeout(() => {
            const aiResponse = this.getAIResponse(userMsg.text);
            this.messages = [...this.messages, {
                id: (Date.now() + 1).toString(),
                text: aiResponse,
                type: 'ai',
                time: new Date().toLocaleTimeString()
            }];
            this.isLoading = false;
        }, 1500);
    }

    getAIResponse(message) {
        const lowerMsg = message.toLowerCase();
        if (lowerMsg.includes('price') || lowerMsg.includes('cost')) {
            return 'Our plans: Basic $99/mo, Pro $299/mo, Enterprise $999/mo. Which interests you?';
        } else if (lowerMsg.includes('help') || lowerMsg.includes('support')) {
            return 'Connecting you to our support team...';
        } else if (lowerMsg.includes('demo')) {
            return 'Great! Let me schedule a demo. What day works?';
        }
        return 'Thanks for your message! How can I assist you?';
    }
}