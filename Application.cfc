component {
    this.name = "v04";
    this.applicationTimeout = createTimeSpan(0, 2, 0, 0); // 2 hours
    this.sessionManagement = true;
    this.sessionTimeout = createTimeSpan(0, 0, 30, 0); // 30 minutes
    this.setClientCookies = true;
    this.setDomainCookies = false;
    this.secureJSON = true;
    this.scriptProtect = "all";

    public boolean function onApplicationStart(){
        application.name = "My Applciation Name";
        application.root = "luceestack";
        application.key = "verycoolsecrestareverycoolindeed";
        return true;
    }

    public void function onSessionStart(){
        session.token = generateSecretKey("AES", 256);
        session.encryptedToken = encrypt(session.token, application.key, "AES", "Base64");
    }
    

    public void function onRequest(targetPage){
        cfinclude(template=targetPage);
    }

    public void function onRequestEnd(){}

    public void function onError(exception, eventName){
        writeDump(exception);
    }
}