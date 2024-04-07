component{
    /**
    * @hint Handles CRUD controls
    * @form the form submitted
    */
    remote string function crudOperations() httpmethod="post" output="false" returnFormat="plain"{

        if (!isValidRequest()){
           return "You are not authorized";
        }

        if(!isDefined('form.action')){
            return "Requires an action"
        }

        switch(form.action){
            case 'add':
                return crudAdd(form);
            case 'edit':
                return crudEdit(form);
            case 'delete':
                return crudDelete(form);
            default:
            return "Unsupported Action";
        }
    }

    /**
    * @hint Handles adding the thing
    * @form Submitted form
    */
    private string function crudAdd(required struct form) { 
        if(form.thing EQ ""){
            return ""
        }

        var thingId = createUUID();
        var thingName = form.thing;
        savecontent variable="item"{
            include "../assets/components/crud/add.cfm";
        }
        return item        
    }

    /**
    * @hint Handles editing the thing
    * @form Submitted form
    */
    private string function crudEdit(required struct form) {
        return serializeJSON({success: true, message: "Item edited successfully"});
    }

    /**
    * @hint Handles API request security
    */
    private boolean function isValidRequest(){
        if (!clientVerify()){
            return false;
        }

        if (!isDefined("CGI.HTTP_AUTHORIZATION") || listFirst(CGI.HTTP_AUTHORIZATION, " ") != "Bearer") {
            return false;
        }
        
        var jwtToken = listLast(CGI.HTTP_AUTHORIZATION, " ");
        return verifyJWT(jwtToken);
    }

    /**
    * @hint Verifies an internal call
    */
    private boolean function clientVerify() {
        // Get the IP address of the requestor
        var requestIP = CGI.REMOTE_ADDR;
    
        // List of IPs considered to be "local"
        var localIPs = ["127.0.0.1", "::1", "0:0:0:0:0:0:0:1", CGI.SERVER_ADDR];
    
        // Check if the requestIP is in the list of local IPs
        return listFindNoCase(arrayToList(localIPs), requestIP) > 0;
    }

    private boolean function verifyJWT(required string token) {
        // Implement JWT verification
        // Decode and verify the JWT using the same key used for creation
        // Check the exp claim to ensure the token hasn't expired
        
        var jwt = new jwt(key=session.secretKey);
        try{
            var result = jwt.decode(token);
            return true;
        } catch (any e){
            return false;
        }
    }
}