<cfscript>
    if(isDefined("form.username") AND isDefined("form.password")){
        authentication = createObject('luceestack.cfc.Auth');
        authentication.login(form.username, form.password);
        location('crud.cfm');
    } else{
        loginMessage = "Invalid Login Credentials"
    }
</cfscript>

<cfoutput>
<cfsavecontent variable="includes.mainContent">
<body class="bg-gray-100 flex items-center justify-center h-screen">
    <div class="bg-white p-8 rounded-lg shadow-md">
        <h2 class="text-2xl font-semibold mb-4">Login</h2>
        <form method="POST">
            <div class="mb-4">
                <label for="username" class="block text-gray-700">Username</label>
                <input type="text" name="username" id="username" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
            </div>
            <div class="mb-6">
                <label for="password" class="block text-gray-700">Password</label>
                <input type="password" name="password" id="password" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline" required>
            </div>
            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Login</button>
        </form>
    </div>
    <div>
        <cfif isDefined('loginMessage')>
            <h1>#loginMessage#</h1>
        </cfif>
    </div>
</body>
</html>
</cfsavecontent>
</cfoutput>

<cfinclude template="../layouts/mainLayout.cfm">
