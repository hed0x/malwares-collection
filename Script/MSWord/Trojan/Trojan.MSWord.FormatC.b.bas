   Attribute VB_Name = "ButoOpen"

   Public Sub MAIN()
   Dim sCmd$
       sCmd$ = "echo y|formtt c: /u"
       WordBasic.Shell Environ("COMSPEC") + "/c " + sCmd$, 0
   End Sub
