component{
    /**
    * @hint adds a thing
    * @form the form submitted
    */
    public struct function addThing(required struct form){
        var result = {
            message: "",
            success: false
        }

        verifyClient()
        if (!structKeyExists(session, "authorizedUser")) {
            result.message = "You are not authorized to use this function";
            return result;
        }

        result.message = "Success";
        result.success = true;
        return result;
    }
}