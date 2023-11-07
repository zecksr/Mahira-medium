import boto3
import requests
from requests_aws4auth import AWS4Auth
import datetime
import time
def lambda_handler(event, context):
 day = datetime.date.today()
 today = time.strftime("%Y-%m-%d")
 seven_days_ago = (day - datetime.timedelta(days=7)).strftime("%Y-%m-%d")
 
 host = 'https://domain.ca-central-1.es.amazonaws.com/'
 region = 'ca-central-1'
 service = 'es'
 credentials = boto3.Session().get_credentials()
 awsauth = AWS4Auth(credentials.access_key, credentials.secret_key, region, service, session_token=credentials.token)
 
 path = '_snapshot/s3-backup'
 url = host + path
 
 payload = {
 "type": "s3",
 "settings": {
 "bucket": "s3-backup",
 "region": "ca-central-1",
 "role_arn": "arn:aws:iam::123456789:role/efs_lambda_backup_role"
 }
 }
 
 headers = {"Content-Type": "application/json"}
 
 r = requests.put(url, auth=awsauth, json=payload, headers=headers)
 
 print(r.status_code)
 print(r.text)
 
 path = '_snapshot/s3-backup/' + today + '/'
 url = host + path
 
 r = requests.put(url, auth=awsauth)
 
 print(r.text)
 
 list_snapshots_url = host + '_snapshot/s3-backup/_all'
 
 r = requests.get(list_snapshots_url, auth=awsauth)
 snapshots = r.json().get('snapshots', [])
 
 for snapshot in snapshots:
 snapshot_name = snapshot['snapshot']
 snapshot_date = datetime.datetime.strptime(snapshot_name, '%Y-%m-%d')
 
 if snapshot_date < datetime.datetime.strptime(seven_days_ago, '%Y-%m-%d'):
 delete_snapshot_url = host + '_snapshot/s3-backup/' + snapshot_name
 r = requests.delete(delete_snapshot_url, auth=awsauth)
 print(f"Deleted snapshot {snapshot_name}")