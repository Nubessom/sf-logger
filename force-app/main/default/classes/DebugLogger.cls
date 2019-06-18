global with sharing class DebugLogger extends Logger {
    
    public DebugLogger(Error_Handling_Configuration__mdt metadata) {
        super(metadata);
    }
    
    public void debug(Exception ex, String source, String referenceId, String referenceInfo){
        
        if (logLevel != 'Finest') {
            return;
        }

        printLogType('DEBUG');
        printLog(ex, source, referenceId, referenceInfo, null);
        printLogType('DEBUG');
    }

    public void debug(Exception ex){
        debug(ex, null, null, null);
    }
    
    public void debug(String customMessage, String source, String referenceId, String referenceInfo) {
        if (logLevel != 'Finest') {
            return;
        }

        printLogType('DEBUG');
        printLog(null, source, referenceId, referenceInfo, customMessage);
        printLogType('DEBUG');
    }
    
    public void debug(String customMessage) {
        debug(customMessage, null, null, null);
    }
    
    public void info(Exception ex, String source, String referenceId, String referenceInfo){        
        printLogType('INFO');
        printLog(ex, source, referenceId, referenceInfo, null);
        printLogType('INFO');
    }
    
    public void info(Exception ex){
        info(ex, null, null, null);
    }
   	
    public void info(String customMessage, String source, String referenceId, String referenceInfo) {
        printLogType('INFO');
        printLog(null, source, referenceId, referenceInfo, customMessage);
        printLogType('INFO');
    }
    
    public void info(String customMessage) {
        info(customMessage, null, null, null);
    }    
    
    public void warning(Exception ex, String source, String referenceId, String referenceInfo){
        if (metadata.Log_Level__c == 'Info') {
            return;
        }
        
        printLogType('WARNING');
        printLog(ex, source, referenceId, referenceInfo, null);
        printLogType('WARNING');
    }
    
    public void warning(Exception ex){
        warning(ex, null, null, null);
    }

    public void error(Exception ex, String source, String referenceId, String referenceInfo){
        printLogType('ERROR');
        printLog(ex, source, referenceId, referenceInfo, null);
        printLogType('ERROR');
        
        if (isSendEmail) {
            sendEmail(ex, source, referenceId, referenceInfo);
        }
    }
        
    public void error(Exception ex){
        error(ex, null, null, null);
    }
    
    private void printLog(Exception ex, String source, String referenceId, String referenceInfo, String customMessage) {
        System.debug('Username:  ' + UserInfo.getUserName());
        System.debug('RoleId:  ' + UserInfo.getUserRoleId());
        System.debug('ProfileId:  ' + UserInfo.getProfileId());

        if (source != null) {
            System.debug('Source:  ' + source);
        }
        
        if (referenceId != null) {
            System.debug('ReferenceId:  ' + referenceId);
        }

        if (referenceInfo != null) {
            System.debug('ReferenceInfo:  ' + referenceInfo);
        }

        if (ex != null) {
        	System.debug('Exception Stack Trace:  ' + ex.getStackTraceString());
            System.debug('Exception Type:  ' + ex.getTypeName());
            System.debug('Exception Message:  ' + ex.getMessage());
        } else if (customMessage != null) {
            System.debug('Custom Message:  ' + customMessage);
        }
    }
    
    private void printLogType(String logType) {
        System.debug('=================================== ' + logType + ' ===================================');
    }
}
