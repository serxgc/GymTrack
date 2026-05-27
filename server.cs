using System;
using System.IO;
using System.Net;

class Server {
    static void Main() {
        var root = @"C:\Users\sergi\Documents\Claude Code\Gymtrack";
        var port = Environment.GetEnvironmentVariable("PORT") ?? "3000";
        var listener = new HttpListener();
        listener.Prefixes.Add("http://localhost:" + port + "/");
        listener.Start();
        Console.WriteLine("Listening on http://localhost:" + port + "/");
        var mimes = new System.Collections.Generic.Dictionary<string,string> {
            {".html","text/html; charset=utf-8"},{".css","text/css; charset=utf-8"},
            {".js","application/javascript; charset=utf-8"},{".png","image/png"},{".ico","image/x-icon"}
        };
        while (true) {
            try {
                var ctx = listener.GetContext();
                var res = ctx.Response;
                var p = ctx.Request.Url.AbsolutePath.TrimStart('/');
                if (p == "") p = "index.html";
                var full = Path.Combine(root, p.Replace('/', Path.DirectorySeparatorChar));
                if (File.Exists(full)) {
                    var ext = Path.GetExtension(full).ToLower();
                    string mime; if (!mimes.TryGetValue(ext, out mime)) mime = "application/octet-stream";
                    var data = File.ReadAllBytes(full);
                    res.StatusCode = 200; res.ContentType = mime;
                    res.ContentLength64 = data.LongLength;
                    res.OutputStream.Write(data, 0, data.Length);
                } else {
                    res.StatusCode = 404;
                    var data = System.Text.Encoding.UTF8.GetBytes("Not found");
                    res.ContentLength64 = data.LongLength;
                    res.OutputStream.Write(data, 0, data.Length);
                }
                res.OutputStream.Close();
            } catch {}
        }
    }
}
