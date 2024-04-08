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
        //write DB interactions
        savecontent variable="item"{
            include "../assets/components/crud/item.cfm";
        }
        return item        
    }

    /**
    * @hint Handles editing the thing
    * @form Submitted form
    */
    private string function crudEdit(required struct form) {
        var thingId = form.itemId;
        var thingName = form.newThing
        //write DB interactions
        savecontent variable="item"{
            include "../assets/components/crud/item.cfm";
        }
        return item;
    }

    /**
    * @hint Handles deleting the thing
    */
    private string function crudDelete() {
        //write DB interactions
        return ""
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
        var requestIP = CGI.REMOTE_ADDR;
        var localIPs = ["127.0.0.1", "::1", "0:0:0:0:0:0:0:1", CGI.SERVER_ADDR];
    
        return listFindNoCase(arrayToList(localIPs), requestIP) > 0;
    }

    /**
    * @hint Verifies the JWT header
    * @token The JWT token
    */
    private boolean function verifyJWT(required string token) {
        var jwt = new jwt(key=session.secretKey);
        try{
            var result = jwt.decode(token);
            return true;
        } catch (any e){
            return false;
        }
    }
}