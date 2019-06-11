global with sharing class DebugLogger extends Logger {
    
    public DebugLogger(Error_Handling_Configuration__mdt metadata) {
        super(metadata);
    }
    
    public void debug(Exception ex, String source, Id referenceId, String referenceInfo, String msg){
        
        if (logLevel == 'Info' || logLevel == 'Fine') {
            return;
        }

        printLogType('DEBUG');
        printLog(ex, source, referenceId, referenceInfo, msg);
        printLogType('DEBUG');
        
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
    
    public void info(Exception ex, String source, Id referenceId, String referenceInfo, String msg){        
        printLogType('INFO');
        printLog(ex, source, referenceId, referenceInfo, msg);
        printLogType('INFO');
        
        if (isSendEmail) {
            sendEmail();    
        }
    }

    public void info(Exception ex, Id ReferenceId, String ReferenceInfo, String msg){
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
        
        printLogType('WARNING');
        printLog(ex, source, referenceId, referenceInfo, msg);
        printLogType('WARNING');
        
        if (isSendEmail) {
            sendEmail();    
        }
    }

    public void warning(Exception ex, Id referenceId, String referenceInfo, String msg){
        warning(ex, null, referenceId, referenceInfo, msg);
    }

    public void warning(Exception ex, String source, String msg){
        warning(ex, source, null, null, msg);
    }
    
    public void warning(Exception ex, String msg){
        warning(ex, null, null, null, msg);
    }

    public void error(Exception ex, String source, Id referenceId, String referenceInfo, String msg){
        printLogType('ERROR');
        printLog(ex, source, referenceId, referenceInfo, msg);
        printLogType('ERROR');
        
        if (isSendEmail) {
            sendEmail();    
        }
    }
    
    public void error(Exception ex, Id referenceId, String referenceInfo, String msg){
        error(ex, null, referenceId, referenceInfo, msg);
    }
  
    public void error(Exception ex, String source, String msg){
        error(ex, source, null, null, msg);
    }
    
    public void error(Exception ex, String msg){
        error(ex, null, null, null, msg);
    }
    
    private void printLog(Exception ex, String source, Id referenceId, String referenceInfo, String msg) {
        System.debug('Username = '+ UserInfo.getUserName());
        System.debug('RoleId = '+ UserInfo.getUserRoleId());
        System.debug('ProfileId = '+ UserInfo.getProfileId());
        System.debug('Message = '+ msg);
        
        if (ex != null) {
        	System.debug('Exception Stack Trace = '+ ex.getStackTraceString());    
        }
        
        if (source != null) {
            System.debug('Source = '+ source);
        }
        
        if (referenceId != null && referenceInfo != null) {
            System.debug('ReferenceId = '+ referenceId);
            System.debug('ReferenceInfo = '+ referenceInfo);
        }
    }
    
    private void printLogType(String logType) {
        System.debug('=================================== ' + logType + ' ===================================');
    }
}