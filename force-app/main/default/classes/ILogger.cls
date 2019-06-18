public virtual interface ILogger{

    /**
    * @description debug log level
    */
    void debug(Exception ex, String source, String referenceId, String referenceInfo);
    void debug(Exception ex);
    
    void debug(String customMessage, String source, String referenceId, String referenceInfo);
    void debug(String customMessage);

    /**
    * @description info log level
    */
    void info(Exception ex, String source, String referenceId, String referenceInfo);
    void info(Exception ex);
    
    void info(String customMessage, String source, String referenceId, String referenceInfo);
    void info(String customMessage);
    	
    /**
    * @description warning log level
    */
    void warning(Exception ex, String source, String referenceId, String referenceInfo);
    void warning(Exception ex);

    /**
    * @description error log level
    */
    void error(Exception ex, String source, String referenceId, String referenceInfo);
    void error(Exception ex);
}