# Backup Databases to Telegram Servers wiht 7z and local TG
```
#!/bin/bash

# --- CONFIGURATION ---
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"
REMOTE_TELEGRAM_URL="http://192.168.1.50:8081/bot${BOT_TOKEN}/sendDocument"

BACKUP_DIR="/root/bkdb"
DATE_NOW=$(date +'%Y-%m-%d_%H-%M-%S')
ARCHIVE_NAME="db_backup_${DATE_NOW}.7z"
FULL_PATH_PREFIX="${BACKUP_DIR}/${ARCHIVE_NAME}"
LOG_FILE="${BACKUP_DIR}/backup_history.log"
ARCHIVE_PASS="SECRET"
SPLIT_SIZE="1990m"

# --- 1. PREPARATION ---
mkdir -p "$BACKUP_DIR"
echo "--- Starting Remote Backup: $DATE_NOW ---" >> "$LOG_FILE"

# --- 2. DUMP & SPLIT COMPRESSION ---
echo "📦 Dumping and Splitting..."
mysqldump --all-databases --single-transaction --quick --lock-tables=false | \
7z a "${FULL_PATH_PREFIX}" -si"db_full_${DATE_NOW}.sql" -p"${ARCHIVE_PASS}" -v${SPLIT_SIZE} -mx=3 > /dev/null

if [ $? -ne 0 ]; then
    echo "❌ Error: MySQL Dump or Compression failed!" | tee -a "$LOG_FILE"
    exit 1
fi

# --- 3. UPLOAD TO REMOTE TELEGRAM SERVER ---
FILES_TO_UPLOAD=$(ls ${FULL_PATH_PREFIX}*)

for FILE in $FILES_TO_UPLOAD; do
    FILENAME=$(basename "$FILE")
    echo "🚀 Uploading $FILENAME to Remote Telegram Server..."

    # Send files to remote TG endpoint
    RESPONSE=$(curl -s -F "chat_id=$CHAT_ID" \
         -F "document=@$FILE" \
         -F "caption=📂 Remote_Backup: $FILENAME" \
         "$REMOTE_TELEGRAM_URL")

    # Verification of uploading 
    FILE_ID=$(echo $RESPONSE | grep -oP '(?<="file_id":")[^"]+')

    if [ -n "$FILE_ID" ]; then
        echo "✅ Upload Successful: $FILENAME"
        echo "File: $FILENAME | ID: $FILE_ID" >> "$LOG_FILE"
        # remove files from local machine (Optional)
        rm -f "$FILE"
    else
        echo "❌ UPLOAD FAILED for $FILENAME" | tee -a "$LOG_FILE"
        echo "Server Response: $RESPONSE" >> "$LOG_FILE"
        exit 1
    fi
done

echo "✨ All tasks completed."
```
Change config lines and SECRET for security

## Tips
if got error check
### reverse proxy body size
in nginx config file
```
client_max_body_size 2100M;
```

### open port of remote TG
```
ufw allow from IP_DATABASE_SERVER to any port 8081
```
### becarful
if remote machine on Internet/Internanet must use https or ssh tunnel 

