import rpc
import time

print("Demo for python-discord-rpc")
client_id = '714648715159404615' #Your application's client ID as a string. (This isn't a real client ID)
rpc_obj = rpc.DiscordIpcClient.for_platform(client_id) #Send the client ID to the rpc module
print("RPC connection successful.")

time.sleep(5)
start_time = time.time()
while True:
    activity = {
            "state": "Sentinel(SSH)",
            "details": "Working on Docker Containers",
            "timestamps": {
                "start": start_time
            },
            "assets": {
                "small_text": "WarpWing",
                "small_image": "small",
                "large_text": "Ubuntu 20.04 LTS",
                "large_image": "large"
            }
        }
    rpc_obj.set_activity(activity)
    time.sleep(30)
