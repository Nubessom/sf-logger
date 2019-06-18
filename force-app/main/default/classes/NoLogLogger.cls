global with sharing class NoLogLogger extends Logger {
    
    public NoLogLogger(Error_Handling_Configuration__mdt metadata) {
        super(metadata);
    }
      
    public void debug(Exception ex, String source, Id referenceId, String referenceInfo){}
    public void debug(Exception ex){}
  
    public void debug(String customMessage, String source, Id referenceId, String referenceInfo){}
    public void debug(String customMessage){}
    
    public void info(Exception ex, String source, Id referenceId, String referenceInfo){}
    public void info(Exception ex){}

    public void info(String customMessage, String source, Id referenceId, String referenceInfo){}
    public void info(String customMessage){}
    
    public void warning(Exception ex, String source, Id referenceId, String referenceInfo){}
    public void warning(Exception ex){}
    
    public void error(Exception ex, String source, Id referenceId, String referenceInfo){}
    public void error(Exception ex){}
}