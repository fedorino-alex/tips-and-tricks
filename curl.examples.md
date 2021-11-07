1. Multipart form request with uploading files and specifying content-types for parts:
```bash
curl \
    --verbose \
    --progress-bar \
    --location \
    --request PUT \
    http://your-url.com \
    --header 'Content-Type: multipart/form-data' \
    --form 'Metadata=@manifest.json;type=application/vnd.uv.metadata+json' \
    --form 'Document=@1gb.txt;type=text/plain'>response-body.txt
```

2. HEAD request with viewing response headers:
```bash
curl -I -X HEAD http://your-url.com
```
