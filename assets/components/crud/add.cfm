<cfoutput>
    <div class="item flex gap-4" id="item_#thingId#">
        <p>#thingName#</p>
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