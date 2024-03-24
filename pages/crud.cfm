<cfscript>

</cfscript>

<cfsavecontent variable="includes.mainContent">
<div>
    <form class="p-2" 
        hx-post="../cfc/crud.cfc?method=crudOperations"
        hx-target="#listOfThings"
        hx-swap="afterbegin"
        method="POST">
        <input class="shadow-sm shadow-black bg-gray-300" type="text" name="thing"/>
        <input type="hidden" value="add" name="action"/>
        <button type="submit">Submit</button>
    </form>

    <div id="listOfThings">
    <!-- Updated content will go here -->
    </div>
</div>

<script>
        document.addEventListener('htmx:afterSwap', function(evt) {
        if (evt.detail.target.id === 'listOfThings') {
            document.querySelector('form').reset();
        }
    });
</script>
</cfsavecontent>

<cfinclude template="../layouts/mainLayout.cfm">