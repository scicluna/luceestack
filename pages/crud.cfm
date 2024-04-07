<cfscript>

</cfscript>

<cfoutput>
<cfsavecontent variable="includes.mainContent">
<div class="p-2">
    <form
    hx-post="../cfc/Crud.cfc?method=crudOperations"
    hx-target="##listOfThings"
    hx-swap="afterend"
    
    method="POST">
        <input class="shadow-sm shadow-black bg-gray-300" type="text" name="thing"/>
        <input type="hidden" value="add" name="action"/>
        <button type="submit">Submit</button>
    </form>

    <div id="listOfThings" >
    <!-- Updated content will go here -->
    </div>
</div>

<script>
    document.addEventListener('htmx:configRequest', function(evt) {
        var jwtToken = #serializeJSON(session.jwt)#;
        if (jwtToken) {
            evt.detail.headers['Authorization'] = 'Bearer ' + jwtToken;
        }
    });

    document.addEventListener('htmx:afterSwap', function(evt) {
        if (evt.detail.target.id === 'listOfThings') {
            document.querySelector('form').reset();
        }
    });
</script>
</cfsavecontent>
</cfoutput>

<cfinclude template="../layouts/mainLayout.cfm">