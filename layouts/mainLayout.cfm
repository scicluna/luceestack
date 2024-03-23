<html>
    <cfinclude template="../assets/components/header.cfm">
    <body class="min-h-[100dvh]">
        <!--- header --->
        <nav class="w-full">

        </nav>
        
        <!--- Content from nested layouts or pages will go here --->
        <section class="w-full">
            <cfoutput>#includes.mainContent#</cfoutput>
        </section>

        <!--- footer --->
        <footer class="w-full">

        </footer>
    </body>
</html>