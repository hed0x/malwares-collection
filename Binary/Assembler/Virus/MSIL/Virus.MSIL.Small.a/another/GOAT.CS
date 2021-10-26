class goat
{
    static void Main()
    {
        System.Int32 id = System.Diagnostics.Process.GetCurrentProcess().Id;
        System.Console.WriteLine("pid: "+id);
    }
}
