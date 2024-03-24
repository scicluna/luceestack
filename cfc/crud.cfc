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
        return "<div>Item added: " & encodeForHTML(form.thing) & "</div>"
    }

    /**
    * @hint Handles editing the thing
    * @form Submitted form
    */
    private string function crudEdit(required struct struct form) {
        return serializeJSON({success: true, message: "Item edited successfully"});
    }

    /**
    * @hint Handles deleting the thing
    * @form Submitted form
    */
    private string function crudDelete(required struct form) {
        return serializeJSON({success: true, message: "Item deleted successfully"});
    }

    /**
    * @hint Handles API request security
    */
    private boolean function isValidRequest(){
        if (!clientVerify()){
            return false;
        }

        if (!structKeyExists(cookie, "csrfToken") OR !structKeyExists(session, "token")){
            return false;
        }

        if (cookie.csrfToken NEQ session.token){
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
}