   <script language="javascript">
   <!--
     function DbCheck(){
       if(DbForm.DbStr.value == ""){
         alert("ÇëÏÈÁ¬½ÓÊý¾Ý¿â");
         FullDbStr(0);
         return false;
       }
       return true;
     }

     function FullDbStr(i){
      if(i<0){
        return false;
      }
       Str = new Array(12);
       Str[0] = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\db.mdb";
       Str[1] = "Driver={Sql Server};Server=<%=ServerIP%>,1433;Database=DbName;Uid=sa;Pwd=****";
       Str[2] = "Driver={MySql};Server=<%=ServerIP%>;Port=3306;Database=DbName;Uid=root;Pwd=****";
       Str[3] = "Dsn=DsnName";
       Str[4] = "SELECT * FROM [TableName] WHERE ID<100";
       Str[5] = "INSERT INTO [TableName](USER,PASS) VALUES(\'xpfox\',\'mypass\')";
       Str[6] = "DELETE FROM [TableName] WHERE ID=100";
       Str[7] = "UPDATE [TableName] SET USER=\'xpfox\' WHERE ID=100";
       Str[8] = "CREATE TABLE [TableName](ID INT IDENTITY (1,1) NOT NULL,USER VARCHAR(50))";
       Str[9] = "DROP TABLE [TableName]";
       Str[10]= "ALTER TABLE [TableName] ADD COLUMN PASS VARCHAR(32)";
       Str[11]= "ALTER TABLE [TableName] DROP COLUMN PASS";
       Str[12]= "µ±Ö»ÏÔÊ¾Ò»ÌõÊý¾ÝÊ±¼´¿ÉÏÔÊ¾×Ö¶ÎµÄÈ«²¿×Ö½Ú£¬¿ÉÓÃÌõ¼þ¿ØÖÆ²éÑ¯ÊµÏÖ.\n³¬¹ýÒ»ÌõÊý¾ÝÖ»ÏÔÊ¾×Ö¶ÎµÄÇ°ÎåÊ®¸ö×Ö½Ú¡£";
       if(i<=3){
         DbForm.DbStr.value = Str[i];
         DbForm.SqlStr.value = "";
         abc.innerHTML="<center>ÇëÈ·ÈÏ¼ºÁ¬½ÓÊý¾Ý¿âÔÙÊäÈëSQL²Ù×÷ÃüÁîÓï¾ä¡£</center>";
       }else if(i==12){
         alert(Str[i]);
       }else{
         DbForm.SqlStr.value = Str[i];
       }
       return true;
     }


     function FullSqlStr(str,pg){
       if(DbForm.DbStr.value.length<5){
         alert("Çë¼ì²éÊý¾Ý¿âÁ¬½Ó´®ÊÇ·ñÕýÈ·!")
         return false;
       }
       if(str.length<10){
         alert("Çë¼ì²éSQLÓï¾äÊÇ·ñÕýÈ·!")
         return false;
       }
       DbForm.SqlStr.value = str ;
       DbForm.Page.value = pg;
       abc.innerHTML="";
       DbForm.submit();
       return true;
     }
   -->
   </script>
