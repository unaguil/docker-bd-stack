import requests
import json

for i in range(10000):
    print('Inserting row %d' % i)
    data = {
        'id': i,
        'name': '{}'.format(i)
    }
    requests.post(
        'http://localhost:9080/contentListener',
        data=json.dumps(data)
    )
