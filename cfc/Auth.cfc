component {
    /**
     * @hint Handles login for the crud app and sets the JWT
     *
     * @username The submitted username
     * @password The submitted password
     */
    public struct function login(required string username, required string password) {
        // Validate credentials against your user store (database, etc.)
        var isValidUser = authenticateUser(username, password);
        if (isValidUser) {
            session.jwt = createJWT(username);
            session.username = username;
            return {
                success:true
            }
        } else {
            throw("Invalid credentials");
        }
    }

    /**
     * @hint Authenticates the user using their username/password. Temporarily just test/test
     *
     * @username Submitted username 
     * @password Submitted password
     */
    private boolean function authenticateUser(required string username, required string password) {
        // Implement your user authentication logic here
        // For example, check username and password against a database

        if(username NEQ "test" OR password NEQ "test"){
            return false;
        }

        return true; // Placeholder
    }

    /**
     * @hint Creates and returns the new JWT
     *
     * @username The submitted username
     */
    private string function createJWT(required string username) {
        // Use a library or implement JWT creation
        // Include necessary claims like exp, iat, sub
        // Encrypt the JWT with a secret key

        var jwt = new jwt(key=session.secretKey , ignoreExpiration=true);
        var payload = {"ts" = now(), "userid" = username};
        
        var token = jwt.encode(payload)
        return token; // Placeholder
    }
}