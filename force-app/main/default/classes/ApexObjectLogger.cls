global with sharing class ApexObjectLogger extends Logger {
    
    public ApexObjectLogger(Error_Handling_Configuration__mdt metadata) {
        super(metadata);
    }
    
    public void debug(Exception ex, String source, String referenceId, String referenceInfo, String msg){
                
        if (logLevel == 'Info' || logLevel == 'Fine') {
            return;
        }
		
        createAndInsertErrorLogs(ex, source, referenceId, referenceInfo, 'Debug');    
    }

    public void debug(Exception ex, String referenceId, String referenceInfo, String msg){
        debug(ex, null, referenceId, referenceInfo, msg);
    }

    public void debug(Exception ex, String source, String msg){
        debug(ex, source, null, null, msg);
    }
    
    public void debug(Exception ex, String msg){
        debug(ex, null, null, null, msg);
    }
    
    public void debug(String source, String referenceId, String referenceInfo, String msg) {
        debug(null, source, referenceId, referenceInfo, msg);
    }

    public void debug(String ReferenceId, String ReferenceInfo, String msg) {
        debug(null, null, referenceId, referenceInfo, msg);        
    }
    
    public void debug(String source, String msg) {
        debug(null, source, null, null, msg);
    }
    
    public void debug(String msg) {
        debug(null, null, null, null, msg);
    }

    public void info(Exception ex, String source, String referenceId, String referenceInfo, String msg) {
        createAndInsertErrorLogs(ex, source, referenceId, referenceInfo, 'Info');        
    }

    public void info(Exception ex, String referenceId, String referenceInfo, String msg){
        info(ex, null, referenceId, referenceInfo, msg);
    }
    
    public void info(Exception ex, String source, String msg){
        info(ex, source, null, null, msg);
    }
    
    public void info(Exception ex, String msg){
        info(ex, null, null, null, msg);
    }

    public void info(String source, String referenceId, String referenceInfo, String msg) {
        info(null, source, referenceId, referenceInfo, msg);
    }

    public void info(String ReferenceId, String ReferenceInfo, String msg) {
        info(null, null, referenceId, referenceInfo, msg);        
    }
    
    public void info(String source, String msg) {
        info(null, source, null, null, msg);
    }
    
    public void info(String msg) {
        info(null, null, null, null, msg);
    }    
        
    public void warning(Exception ex, String source, String referenceId, String referenceInfo, String msg){

        if (metadata.Log_Level__c == 'Info') {
            return;
        }

        createAndInsertErrorLogs(ex, source, referenceId, referenceInfo, 'Warning');    
    }

    public void warning(Exception ex, String referenceId, String referenceInfo, String msg){
        warning(ex, null, referenceId, referenceInfo, msg);
    }
    
    public void warning(Exception ex, String msg){
        warning(ex, null, null, null, msg);
    }
    
    public void warning(Exception ex, String source, String msg){
        warning(ex, source, null, null, msg);
    }
    
    public void error(Exception ex, String source, String referenceId, String referenceInfo, String msg){
        createAndInsertErrorLogs(ex, source, referenceId, referenceInfo, 'Error');

        if (isSendEmail) {
            sendEmail(ex, source, referenceId, referenceInfo, msg);
        }            
    }
    
    public void error(Exception ex, String msg){
        error(ex, null, null, null, msg);
    }
    
    public void error(Exception ex, String source, String msg){
        error(ex, source, null, null, msg);
    }
    
    public void error(Exception ex, String referenceId, String referenceInfo, String msg){
        error(ex, null, referenceId, referenceInfo, msg);
    }

    private void createAndInsertErrorLogs(Exception ex, String source, String referenceId, String referenceInfo, String logType) {
        
        Error_Logs__c errorLogs = new Error_Logs__c(Username__c = UserInfo.getUserName(),
                                                    RoleId__c = UserInfo.getUserRoleId(),
                                                    ProfileId__c = UserInfo.getProfileId(),
                                                    Log_Type__c = logType
                                                    );
        if (ex != null) {
            errorLogs.Message__c = ex.getMessage();                                                                           
            errorLogs.Exception_Type__c = ex.getTypeName();
            errorLogs.Exception_Stack_Trace__c = ex.getStackTraceString();
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
