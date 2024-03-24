<cfscript>
    dataBase = createObject('cfc.crud')
    message = dataBase.addThing()
</cfscript>

<cfsavecontent variable="includes.mainContent">
<div>
    <h1>Crud Sample</h1>
</div>
</cfsavecontent>

<cfinclude template="../layouts/mainLayout.cfm">