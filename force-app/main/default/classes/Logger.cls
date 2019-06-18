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

    public void sendEmail(Exception ex, String source, String referenceId, String referenceInfo){

        messaging.SingleEmailMessage email = new messaging.SingleEmailMessage();
        string[] address = new string[]{metadata.Email_Address__c};

        String subject =  'OrgName:  ' + UserInfo.getOrganizationName() + ' OrgId: ' + UserInfo.getOrganizationId() + ' at ' + Datetime.now().format();

        String textBody = 'Username:  ' + UserInfo.getUserName() + '\n' +
                          'RoleId:  ' + UserInfo.getUserRoleId() + '\n' +
                          'ProfileId:  ' + UserInfo.getProfileId() + '\n';

        if (source != null) {
            textBody += 'Source:  ' + source + '\n';
        }
        
        if (referenceId != null) {
            textBody += 'ReferenceId:  ' + referenceId + '\n';
        }

        if (referenceInfo != null) {
            textBody += 'ReferenceInfo:  ' + referenceInfo + '\n';
        }

        if (ex != null) {
            textBody += 'Exception Type:  ' + ex.getTypeName() + '\n';
            textBody += 'Exception Message:  ' + ex.getMessage() + '\n'; 
            textBody += 'Exception Stack Trace:  ' + ex.getStackTraceString() + '\n';    
        }

        email.setToAddresses(address);
        
        email.setSubject(subject); 
        email.setPlainTextBody(textBody);
        email.setSenderDisplayName('Logger');
        
        messaging.Email[] emails = new messaging.Email[]{email};
        messaging.sendEmail(emails);
    }
}
