namespace Nettle
{
	[CCode (has_target = false)]
	public delegate void CryptFunc(void* ctx, uint length, uint8* dst, uint8* src);
	
	[CCode (cname = "struct aes_ctx", cprefix = "aes_", cheader_filename = "nettle/aes.h")]
	public struct AES
	{
		public void set_encrypt_key(uint length, uint8* key);
		public void set_decrypt_key(uint length, uint8* key);
		public void invert_key(AES *src);
		public void encrypt(uint length, uint8* dst, uint8* src);
		public void decrypt(uint length, uint8* dst, uint8* src);
	}
	
	[CCode (cname = "cbc_encrypt", cheader_filename = "nettle/cbc.h")]
	public void cbc_encrypt(void* ctx, CryptFunc f, uint block_size, uint8* iv, uint length, uint8* dst, uint8* src);

	[CCode (cname = "cbc_decrypt", cheader_filename = "nettle/cbc.h")]
	public void cbc_decrypt(void* ctx, CryptFunc f, uint block_size, uint8* iv, uint length, uint8* dst, uint8* src);
	
	[CCode (cname = "AES_BLOCK_SIZE", cheader_filename = "nettle/aes.h")]
	public const int AES_BLOCK_SIZE;
}
