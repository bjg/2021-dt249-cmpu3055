import logging

import azure.functions as func

# curl -X GET /example.com/api/myfirstazurefunction?name="World"

# curl -X POST -H 'Content-Type: application/json' -d '{"name": "World"}' /example.com/api/myfirstazurefunction

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    a = req.params.get('a')
    b = req.params.get('b')

    r = int(a) + int(b)

    return func.HttpResponse(f"Result: {r}.")

