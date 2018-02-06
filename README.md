# Try Coding

This is a online website for the "Try Coding" website. The application is built using Rails 5.

### Installation

Clone the repo using the following command:

```
git clone https://github.com/smonetti/turing-try-turing
```

Install the gems by running:

```
bundle install
```

Create a `application.yml` file under the `config` folder. Set the values of `secret_key_base` and `eventbrite`. The file follows a `yaml` format.

* To obtain the `secret_key_base` value, just run `rake secret` on your terminal to create the value.
* To obtain the `eventbrite` value, log into [Eventbrite](http://eventbrite.com), go to the 'Account Settings', and then to 'App Management'. Once you are there, get the 'key' value.

Launch the app by running:

```
rails s
```

Visit the site at http://localhost:3000/

### Analytics
We use Google Analytics. The tracking code will load if the env var
`GOOGLE_ANALYTICS_ENABLED` is present.
