public abstract class Logger implements ILogger {
	
    protected Error_Handling_Configuration__mdt metadata;
    protected Boolean isSendEmail;
    protected String logLevel;
    
    public Logger(){}
    
    public Logger(Error_Handling_Configuration__mdt metadata){
        this.metadata = metadata;
        this.isSendEmail = metadata.Email_on_Error__c;
        this.logLevel = metadata.Log_Level__c;
    }
    
    public void sendEmail(){
            messaging.SingleEmailMessage email = new messaging.SingleEmailMessage();
            string[] address = new string[]{metadata.Email_Address__c};
    
            email.setToAddresses(address);
            email.setCcAddresses(address);
            
            email.setSubject('test');
            email.setPlainTextBody('test');
            email.setSenderDisplayName('Test');
            
            messaging.Email[] emails = new messaging.Email[]{email};
            messaging.sendEmail(emails);
        
    }
}