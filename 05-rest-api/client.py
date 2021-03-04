import requests
import sys

r = requests.get(f"http://127.0.0.1:5000/{sys.argv[1]}")
print(r.text)