using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace shop0903
{
    public static class ExtensionMethod
    {
        public static string ParserJSon(this object data)
        {
            JavaScriptSerializer sc = new JavaScriptSerializer();
            string strJson = sc.Serialize(data);
            return strJson;
        }
    }
}