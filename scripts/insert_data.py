import requests
import json

for i in range(1000):
    print('Inserting row %d' %i)
    data = ( 
        {
            "body" : "%d,prueba" % i
        },
    )
    requests.post('http://localhost:9080', data=json.dumps(data))

