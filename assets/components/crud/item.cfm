<cfoutput>
    <div class="item flex gap-4" id="item_#thingId#">
        <p>#thingName#</p>
        <form method="POST"
              hx-post="../cfc/crud.cfc?method=crudOperations"
              hx-target="##item_#thingId#"
              hx-swap="delete">
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="itemId" value="#thingId#"/>
            <button type="submit" hx-confirm="Are you sure you want to delete this item?" class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-700 transition">Delete</button>
            <button type="button" onclick="openEdit(event, '#thingId#')" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 transition">Edit</button>
        </form>
        <div id="editModal#thingId#" class="top-0 left-0 absolute w-full h-full bg-black bg-opacity-50 flex justify-center items-center invisible">
            <div class="bg-white p-5 rounded-lg shadow-lg relative" onclick="event.stopPropagation()">
                <form method="POST"
                    hx-post="../cfc/crud.cfc?method=crudOperations"
                    hx-target="##item_#thingId#"
                    hx-swap="outerHTML"
                    class="flex flex-col gap-4">
                    <input type="hidden" name="action" value="edit"/>
                    <input type="hidden" name="itemId" value="#thingId#"/>
                    <input type="text" name="newThing" placeholder="New Thing Name" class="border-gray-300 focus:border-blue-500 focus:ring-blue-500 rounded p-2"/>
                    <button type="submit" class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-700 transition">Submit</button>
                </form>
            </div>
        </div>
    </div>
</cfoutput>
