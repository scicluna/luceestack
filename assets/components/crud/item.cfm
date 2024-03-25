<cfoutput>
    <div class="item" id="item_#thingId#">
        <span>#thingName#</span>
        <form method="POST"
              hx-post="../cfc/crud.cfc"
              hx-target="##item_#thingId#"
              hx-swap="delete">
            <input type="hidden" name="token" value="#session.encryptedToken#"/>
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="itemId" value="#thingId#"/>
            <button type="submit" hx-confirm="Are you sure you want to delete this item?">Delete</button>
        </form>
    </div>
</cfoutput>