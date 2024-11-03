import os

from slack_bolt import App

# ${APP_HOME}/src/dynamic directory is a volume mount
from dynamic import slack_secrets


API_PORT_TLS = os.environ['API_PORT_TLS']

# Initializes your app with your bot token and signing secret
app = App(
    token=slack_secrets.SWAMIBOT_OAUTH_TOKEN,
    signing_secret=slack_secrets.SWAMIBOT_SIGNING_SECRET
)


# Start your app
if __name__ == "__main__":
    app.start(port=int(API_PORT_TLS))
