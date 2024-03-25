component{
    /**
    * @hint Handles CRUD controls
    * @form the form submitted
    */
    remote string function crudOperations() httpmethod="post" output="false" returnFormat="plain"{

        if (!isValidRequest(form)){
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
        var thingId = createUUID();
        var thingName = form.thing;
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
        return serializeJSON({success: true, message: "Item edited successfully"});
    }

    /**
    * @hint Handles deleting the thing
    * @form Submitted form
    */
    private string function crudDelete(required struct form) {
        // Ensure that the itemId is provided
        if (!structKeyExists(form, "itemId")) {
            return "<div class='error'>Item ID is required for deletion.</div>";
        }
        return "";
    }

    /**
    * @hint Handles API request security
    * @form Submitted form
    */
    private boolean function isValidRequest(required struct form){
        if (!clientVerify()){
            return false;
        }

        if (!verifyToken(form)){
            return false;
        }

        return true;
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

    /**
    * @hint Verifies an internal call
    * @form The submitted form with a token on it
    */
    private boolean function verifyToken(required struct form){
        if(!isDefined("form.token")){
            return false;
        }
        var decryptedToken = decrypt(form.token, application.key, "AES", "Base64");
    
        return decryptedToken == session.token;
    }
}