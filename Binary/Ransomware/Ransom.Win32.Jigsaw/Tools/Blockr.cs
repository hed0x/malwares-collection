using System;
using System.Net;
using Newtonsoft.Json.Linq;

namespace Main.Tools
{
    internal static class Blockr
    {
        private static string BlockrAddress => "http://btc.blockr.io/api/v1/";

        internal static double GetPrice()
        {
            var request = BlockrAddress + "coin/info/";
            var client = new WebClient();
            var result = client.DownloadString(request);

            var json = JObject.Parse(result);
            var status = json["status"];
            if ((status != null && status.ToString() == "error"))
            {
                throw new Exception(json.ToString());
            }

            return json["data"]["markets"]["coinbase"].Value<double>("value");
        }

        internal static double GetBalanceBtc(string address)
        {
            var request = BlockrAddress + "address/balance/" + address;
            var client = new WebClient();
            var result = client.DownloadString(request);

            var json = JObject.Parse(result);
            var status = json["status"];
            if ((status != null && status.ToString() == "error"))
            {
                throw new Exception(json.ToString());
            }

            return json["data"].Value<double>("balance");
        }
    }
}