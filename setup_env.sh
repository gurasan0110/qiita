#!/bin/bash

read -p 'Client IDを入力してください: ' CLIENT_ID
read -p 'Client Secretを入力してください: ' CLIENT_SECRET

cat << EOF > .env
CLIENT_ID='$CLIENT_ID'
CLIENT_SECRET='$CLIENT_SECRET'
EOF

echo '環境変数をセットアップ'
