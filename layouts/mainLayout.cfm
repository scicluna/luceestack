<html>
    <cfinclude template="../assets/components/header.cfm">
    <body class="min-h-[100dvh]">
        <nav class="w-full">
            <cfinclude template="../assets/components/nav.cfm">
        </nav>
        
        <section class="w-full">
            <cfoutput>#includes.mainContent#</cfoutput>
        </section>
        
        <footer class="w-full">
            <cfinclude template="../assets/components/footer.cfm">
        </footer>
    </body>
</html>