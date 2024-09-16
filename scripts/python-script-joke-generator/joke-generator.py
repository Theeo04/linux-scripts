import requests

# JokeAPI
BASE_URL = 'https://v2.jokeapi.dev/joke/Any'

def get_joke():
    while True:
        # API fetch
        response = requests.get(BASE_URL)
        data = response.json()

        # Check if the joke is  NSFW
        if data.get('nsfw', False):
            print("The joke is NSFW. Fetching another one...")
            continue

        if data['type'] == 'single':
            print(f"Joke: {data['joke']}")
        elif data['type'] == 'twopart':
            print(f"Question: {data['setup']}")
            print(f"Answear: {data['delivery']}")
        else:
            print("No joke available.")
        
        break

if __name__ == "__main__":
    get_joke()
