import os

from slack_bolt import App

# ${APP_HOME}/src/dynamic directory is a volume mount
from dynamic import slack_secrets


API_PORT = os.environ['API_PORT']

# Initializes your app with your bot token and signing secret
app = App(
    token=slack_secrets.SWAMIBOT_OAUTH_TOKEN,
    signing_secret=slack_secrets.SWAMIBOT_SIGNING_SECRET
)


# Listens to incoming messages that contain "hello"
# To learn available listener arguments,
# visit https://tools.slack.dev/bolt-python/api-docs/slack_bolt/kwargs_injection/args.html
@app.message("hello")
def message_hello(message, say):
    # say() sends a message to the channel where the event was triggered
    say(f"Hey there <@{message['user']}>!")


# Start your app
if __name__ == "__main__":
    app.start(port=int(API_PORT))
