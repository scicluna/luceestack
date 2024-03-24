<cfscript>
    // Assuming form data is submitted via POST
    actionType = form.actionType;

    // Instance of your CFC
    crudOperations = createObject('cfc.crud')

    // Prepare a structure to hold the response data
    response = {};

    // Determine the action to perform based on the actionType form field
    switch(actionType) {
        case "add":
            response = crudOperations.addThing(form);
            break;
        case "edit":
            response = crudOperations.editThing(form);
            break;
        case "delete":
            response = crudOperations.deleteThing(form);
            break;
        default:
            response.message = "Invalid action type";
            response.success = false;
    }

    // Output the response as HTML
    writeOutput("<div>");
    writeOutput(encodeForHTML(response.message));
    writeOutput("</div>");
</cfscript>