### 1. Get token from Azure

 ```bash
 response=$(curl -X POST https://login.microsoftonline.com/$tenant/oauth2/v2.0/token \
                 -H "Content-Type: application/x-www-form-urlencoded" \
                 -d "grant_type=$grant_type&client_id=$client_id&client_secret=$client_secret&scope=$scope")

 token=$(echo $response | jq -r ".access_token")
 authorization_header="Authorization: Bearer $token"
 ```
   
### 2. Create file or folder

 ```bash
 curl -X PUT "$base_url/$FILENAME?resource=file" \ # resource=file|directory
      -H "$authorization_header" \
      -H "Content-Type: text/plain" \
      -d ""
 ```
   
### 3. Upload content to created file

 ```bash
 # Upload content parts
 curl -X PATCH "$base_url/$FILENAME?action=append&position=0" \
      -H "$authorization_header" \
      -H "Content-Type: text/plain" \
      --data-binary "@$FILE"

 # Finalize uploading
 curl -X PATCH "$base_url/$FILENAME?action=flush&position=$FILESIZE" \
      -H "$authorization_header" \
      -d ""
 ```
