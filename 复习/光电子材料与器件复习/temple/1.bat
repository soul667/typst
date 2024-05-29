curl https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCxj1PyW3wLEbMxyAACokxwutOh7X_Jhp0 \
    -H 'Content-Type: application/json' \
    -X POST \
    -d '{
      "contents": [{
        "parts":[{
          "text": "Write a story about a magic backpack."}]}]}' 2> /dev/null