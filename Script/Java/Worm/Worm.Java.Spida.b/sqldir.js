// sqldir.js v1.01

function usage()
 {
  WScript.Echo("sqldir v1.01\n" +
               "\n" +
               "Usage : " + WScript.ScriptName + " ip user pass [path] [/a] [/rn] [/s]\n" +
               "\n" +
               "path - display information in format database\\table\n" +
               "/a - display system databases\n" +
               "/rn - display information until level n/1 - 3/\n" +
               "/s - show rows count\n");
  WScript.Quit();
 }

if (WScript.Arguments.length < 3)
 usage();

oSQLServer = new ActiveXObject("SQLDMO.SQLServer");
oSQLServer.Connect(WScript.Arguments(0), WScript.Arguments(1), WScript.Arguments(2));

flag_hide = flag_rows = false;
recursion_level = 0;
database = table = "";

for (counter = 3;counter < WScript.Arguments.length;counter++)
 if (WScript.Arguments(counter).charAt(0) == "/" || WScript.Arguments(counter).charAt(0) == "-")
  {
   if (WScript.Arguments(counter).length == 1)
    usage();
   
   for (subcounter = 1;subcounter < WScript.Arguments(counter).length;subcounter++)
    switch (WScript.Arguments(counter).charAt(subcounter))
     {
      case "a" : flag_hide = true;
                 break;

      case "r" : subcounter++

                 if (WScript.Arguments(counter).length == subcounter)
                  usage();

                 recursion_level = WScript.Arguments(counter).charCodeAt(subcounter) - 48;

                 if (recursion_level < 1 || recursion_level > 4)
                  usage();

                 break;

      case "s" : flag_rows = true;
                 break;

      default  : usage();
    }
  }
 else
  if (database.length == 0)
   database = WScript.Arguments(counter);

if (database.length != 0)
 for (counter = 0;counter < database.length;counter++)
  if (database.charAt(counter) == "\\" || database.charAt(counter) == "/")
   {
    table = database.slice(counter + 1);
    database = database.slice(0, counter);

    break;
   }

WScript.Echo("Query " + oSQLServer.NetName + " from " + WScript.Arguments(0) + " ...\n");

if (database.length == 0)
 {
  databases = oSQLServer.Databases;
  count_databases = databases.Count;

  for (database_counter = 1; database_counter <= count_databases;database_counter++)
   if (flag_hide || (!databases(database_counter).SystemObject &&
       databases(database_counter).Name != "Northwind" && databases(database_counter).Name != "pubs"))
    {
     if (recursion_level <= 1)
      {       
       WScript.Echo(databases(database_counter).Name);
       continue;
      }

     if (recursion_level == 2)
      WScript.Echo(databases(database_counter).Name);

     tables = databases(database_counter).Tables; 
     count_tables = tables.Count;

     for (table_counter = 1;table_counter <= count_tables;table_counter++)
      if (flag_hide || !tables(table_counter).SystemObject)
       {
        if (recursion_level <= 2)
         {
          if (flag_rows)
           WScript.Echo(" " + tables(table_counter).Name + " (" + tables(table_counter).Rows + ")");
          else
           WScript.Echo(" " + tables(table_counter).Name);

          continue;
         }

        if (recursion_level == 3)
         if (flag_rows)
          WScript.Echo(databases(database_counter).Name + "\\" + tables(table_counter).Name + " (" + tables(table_counter).Rows + ")");
         else
          WScript.Echo(databases(database_counter).Name + "\\" + tables(table_counter).Name);

        columns = tables(table_counter).Columns;
        count_columns = columns.Count;

        for (column_counter = 1;column_counter <= count_columns;column_counter++)
         WScript.Echo("  " + columns(column_counter).Name);

        WScript.Echo();
       }

     WScript.Echo();
    }
 }
else
 if (table.length == 0)
  {
   WScript.Echo(database);

   tables = oSQLServer.Databases(database).Tables;
   count_tables = tables.Count;

   for (counter = 1;counter <= count_tables;counter++)
    if (flag_hide || !tables(counter).SystemObject)
     if (flag_rows)
      WScript.Echo(" " + tables(counter).Name + " (" + tables(counter).Rows + ")");
     else
      WScript.Echo(" " + tables(counter).Name);
  }
 else
  {
   if (flag_rows)
    WScript.Echo(database + "\\" + table + " (" + oSQLServer.Databases(database).Tables(table).Rows + ")");
   else
    WScript.Echo(database + "\\" + table);

   columns = oSQLServer.Databases(database).Tables(table).Columns;
   count_columns = columns.Count;

   for (counter = 1;counter <= count_columns;counter++)
    WScript.Echo(" " + columns(counter).Name);
  }

oSQLServer.Close();