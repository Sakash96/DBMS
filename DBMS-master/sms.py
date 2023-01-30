# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client

# Set environment variables for your credentials
# Read more at http://twil.io/secure
account_sid = "AC3f930906fe7849b6438b72b7d613b177"
auth_token = "6d78083a88fb70901ea6e42d3978d9f4"
client = Client(account_sid, auth_token)

message = client.messages.create(
  body="Hello from Twilio",
  from_="+13343800863",
  to="+919620059789"
)

print(message.sid)