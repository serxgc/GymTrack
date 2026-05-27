$port = if ($env:PORT) { $env:PORT } else { "3000" }
$root = "C:\Users\sergi\Documents\Claude Code\Gymtrack"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Listening on http://localhost:$port/"

$mimes = @{
    ".html" = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".png"  = "image/png"
    ".ico"  = "image/x-icon"
}

while ($listener.IsListening) {
    try {
        $ctx = $listener.GetContext()
        $req = $ctx.Request
        $res = $ctx.Response
        $p = $req.Url.AbsolutePath.TrimStart("/")
        if ($p -eq "") { $p = "index.html" }
        $full = Join-Path $root $p.Replace("/", [System.IO.Path]::DirectorySeparatorChar)
        if (Test-Path $full -PathType Leaf) {
            $ext  = [System.IO.Path]::GetExtension($full).ToLower()
            $mime = if ($mimes[$ext]) { $mimes[$ext] } else { "application/octet-stream" }
            $data = [System.IO.File]::ReadAllBytes($full)
            $res.StatusCode  = 200
            $res.ContentType = $mime
            $res.ContentLength64 = [long]$data.LongLength
            $res.OutputStream.Write($data, 0, $data.Length)
        } else {
            $res.StatusCode = 404
            $body = [System.Text.Encoding]::UTF8.GetBytes("Not found")
            $res.ContentLength64 = $body.LongLength
            $res.OutputStream.Write($body, 0, $body.Length)
        }
        $res.OutputStream.Close()
    } catch {
        Write-Host "Error: $_"
        try { $ctx.Response.Abort() } catch {}
    }
}
