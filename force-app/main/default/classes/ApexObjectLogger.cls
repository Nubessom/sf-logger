global with sharing class ApexObjectLogger extends Logger {
    
    public ApexObjectLogger(Error_Handling_Configuration__mdt metadata) {
        super(metadata);
    }
    
    public void debug(Exception ex, String source, String referenceId, String referenceInfo) {
        if (logLevel != 'Finest') {
            return;
        }
		
        createAndInsertErrorLogs(ex, source, referenceId, referenceInfo, 'Debug', null);    
    }
    
    public void debug(Exception ex) {
        debug(ex, null, null, null);
    }
    
    public void debug(String customMessage, String source, String referenceId, String referenceInfo) {
        if (logLevel != 'Finest') {
            return;
        }
		
        createAndInsertErrorLogs(null, source, referenceId, referenceInfo, 'Debug', customMessage);
    }

    public void debug(String customMessage) {
        debug(customMessage, null, null, null);        
    }
    
    public void info(Exception ex, String source, String referenceId, String referenceInfo) {
        createAndInsertErrorLogs(ex, source, referenceId, referenceInfo, 'Info', null);        
    }

    public void info(Exception ex){
        info(ex, null, null, null);
    }
    
    public void info(String customMessage, String source, String referenceId, String referenceInfo) {
        createAndInsertErrorLogs(null, source, referenceId, referenceInfo, 'Info', customMessage);
    }

    public void info(String customMessage) {
        info(customMessage, null, null, null);         
    }
    
    public void warning(Exception ex, String source, String referenceId, String referenceInfo) {

        if (metadata.Log_Level__c == 'Info') {
            return;
        }

        createAndInsertErrorLogs(ex, source, referenceId, referenceInfo, 'Warning', null);    
    }

    public void warning(Exception ex){
        warning(ex, null, null, null);
    }
        
    public void error(Exception ex, String source, String referenceId, String referenceInfo) {
        createAndInsertErrorLogs(ex, source, referenceId, referenceInfo, 'Error', null);

        if (isSendEmail) {
            sendEmail(ex, source, referenceId, referenceInfo);
        }            
    }
    
    public void error(Exception ex){
        error(ex, null, null, null);
    }
    
    private void createAndInsertErrorLogs(Exception ex, String source, String referenceId, String referenceInfo, String logType, String customMessage) {
        
        Error_Logs__c errorLogs = new Error_Logs__c(Username__c = UserInfo.getUserName(),
                                                    RoleId__c = UserInfo.getUserRoleId(),
                                                    ProfileId__c = UserInfo.getProfileId(),
                                                    Log_Type__c = logType
                                                    );
        if (ex != null) {
            errorLogs.Message__c = ex.getMessage();                                                                           
            errorLogs.Exception_Type__c = ex.getTypeName();
            errorLogs.Exception_Stack_Trace__c = ex.getStackTraceString();
        } else if (customMessage != null) {
            errorLogs.Message__c = customMessage;                                                                                     
        }
        
        if (source != null) {
            errorLogs.Source__c = source;
        }

        if (referenceId != null) {
            errorLogs.Reference_Id__c = referenceId;
        }

        if (referenceInfo != null) {
            errorLogs.Reference_Info__c = referenceInfo;
        }
        
        //SecurityEnforcer.createSObject(errorLogs);
        //if you have SecurityEnforcer installed, use the line above instead of the one below
        insert errorLogs;
    }
}
