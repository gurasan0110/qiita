#!/bin/bash

cat << EOF > .env
CLIENT_ID='$1'
CLIENT_SECRET='$2'
EOF

echo '環境変数をセットアップ'
