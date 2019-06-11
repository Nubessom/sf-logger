global with sharing class ApexObjectLogger extends Logger {
    
    public ApexObjectLogger(Error_Handling_Configuration__mdt metadata) {
        super(metadata);
    }
    
    public void debug(Exception ex, String source, Id referenceId, String referenceInfo, String msg){
                
        if (logLevel == 'Info' || logLevel == 'Fine') {
            return;
        }
		
        Error_Logs__c errorLogsObj = new Error_Logs__c(Username__c = UserInfo.getUserName(),
                                                       RoleId__c = UserInfo.getUserRoleId(),
                                                       ProfileId__c = UserInfo.getProfileId(),
                                                       Log_Type__c = 'Debug',
                                                       Message__c = msg,                                                                               
                                                       Source__c = source,
                                                       Reference_Id__c = referenceId,
                                                       Reference_Info__c = referenceInfo
                                                      );
        if (ex != null) {
            errorLogsObj.Exception_Stack_Trace__c = ex.getStackTraceString();
        }
        
        SecurityEnforcer.createSObject(errorLogsObj);
        if (isSendEmail) {
            sendEmail();
        }    
    }

    public void debug(Exception ex, Id referenceId, String referenceInfo, String msg){
        debug(ex, null, referenceId, referenceInfo, msg);
    }

    public void debug(Exception ex, String source, String msg){
        debug(ex, source, null, null, msg);
    }
    
    public void debug(Exception ex, String msg){
        debug(ex, null, null, null, msg);
    }
    
    public void debug(String source, Id referenceId, String referenceInfo, String msg) {
        debug(null, source, referenceId, referenceInfo, msg);
    }

    public void debug(Id ReferenceId, String ReferenceInfo, String msg) {
        debug(null, null, referenceId, referenceInfo, msg);        
    }
    
    public void debug(String source, String msg) {
        debug(null, source, null, null, msg);
    }
    
    public void debug(String msg) {
        debug(null, null, null, null, msg);
    }

    public void info(Exception ex, String source, Id referenceId, String referenceInfo, String msg) {
        
        Error_Logs__c errorLogsObj = new Error_Logs__c(Username__c = UserInfo.getUserName(),
                                                       RoleId__c = UserInfo.getUserRoleId(),
                                                       ProfileId__c = UserInfo.getProfileId(),
                                                       Log_Type__c = 'Info',
                                                       Message__c = msg,                                                                               
                                                       Source__c = source,
                                                       Reference_Id__c = referenceId,
                                                       Reference_Info__c = referenceInfo
                                                      );
        if (ex != null) {
            errorLogsObj.Exception_Stack_Trace__c = ex.getStackTraceString();
        }
        
        SecurityEnforcer.createSObject(errorLogsObj);
        if (isSendEmail) {
            sendEmail();
        }    
    }

    public void info(Exception ex, Id referenceId, String referenceInfo, String msg){
        info(ex, null, referenceId, referenceInfo, msg);
    }
    
    public void info(Exception ex, String source, String msg){
        info(ex, source, null, null, msg);
    }
    
    public void info(Exception ex, String msg){
        info(ex, null, null, null, msg);
    }

    public void info(String source, Id referenceId, String referenceInfo, String msg) {
        info(null, source, referenceId, referenceInfo, msg);
    }

    public void info(Id ReferenceId, String ReferenceInfo, String msg) {
        info(null, null, referenceId, referenceInfo, msg);        
    }
    
    public void info(String source, String msg) {
        info(null, source, null, null, msg);
    }
    
    public void info(String msg) {
        info(null, null, null, null, msg);
    }    
        
    public void warning(Exception ex, String source, Id referenceId, String referenceInfo, String msg){

        if (metadata.Log_Level__c == 'Info') {
            return;
        }

        Error_Logs__c errorLogsObj = new Error_Logs__c(Username__c = UserInfo.getUserName(),
                                                       RoleId__c = UserInfo.getUserRoleId(),
                                                       ProfileId__c = UserInfo.getProfileId(),
                                                       Log_Type__c = 'Warning',
                                                       Message__c = msg,                                                                               
                                                       Source__c = source,
                                                       Reference_Id__c = referenceId,
                                                       Reference_Info__c = referenceInfo
                                                      );
        if (ex != null) {
            errorLogsObj.Exception_Stack_Trace__c = ex.getStackTraceString();
        }
        
        SecurityEnforcer.createSObject(errorLogsObj);
        if (isSendEmail) {
            sendEmail();
        }    
    }

    public void warning(Exception ex, Id referenceId, String referenceInfo, String msg){
        warning(ex, null, referenceId, referenceInfo, msg);
    }
    
    public void warning(Exception ex, String msg){
        warning(ex, null, null, null, msg);
    }
    
    public void warning(Exception ex, String source, String msg){
        warning(ex, source, null, null, msg);
    }
    
    public void error(Exception ex, String source, Id referenceId, String referenceInfo, String msg){
        
        Error_Logs__c errorLogsObj = new Error_Logs__c(Username__c = UserInfo.getUserName(),
                                                       RoleId__c = UserInfo.getUserRoleId(),
                                                       ProfileId__c = UserInfo.getProfileId(),
                                                       Log_Type__c = 'Error',
                                                       Message__c = msg,                                                                               
                                                       Source__c = source,
                                                       Reference_Id__c = referenceId,
                                                       Reference_Info__c = referenceInfo
                                                      );
        if (ex != null) {
            errorLogsObj.Exception_Stack_Trace__c = ex.getStackTraceString();
        }
        
        SecurityEnforcer.createSObject(errorLogsObj);
        if (isSendEmail) {
            sendEmail();
        }    
    }
    
    public void error(Exception ex, String msg){
        error(ex, null, null, null, msg);
    }
    
    public void error(Exception ex, String source, String msg){
        error(ex, source, null, null, msg);
    }
    
    public void error(Exception ex, Id referenceId, String referenceInfo, String msg){
        error(ex, null, referenceId, referenceInfo, msg);
    }  
}