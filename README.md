# Ultimate Scrapping App - Spammer

This work was done as a project for [The Hacking Project Bootcamp](https://www.thehackingproject.org/).
The goal was to work along with a team, learn the basics of Object-Oriented Programming and build an app that scrapps the data of a website. Then we convert that data to a JSON and CSV formats for beeing able to  used it for spamming or automatic following on twitter.

- `app.rb` is the exe file.
- `Gemfile` contains all the gems we used in this program. 
- `db` folder contains our database.
- `lib` contains two folders. First one is `app` which contains all our working files (scrapper, bot, mailer, etc) and `view` contains the files that executes each of these along with `app.rb`.

## Requirements

You need at least ruby 4.5.1 (maybe under but not tested) and bundler installed on your computer.

To run this program you also gonna need a Gmaiil account to sent emails and you need to create your own Twitter API keys.

You can get them by signing up on [Twitter for Developers website](https://developer.twitter.com/).

1. First of all `git clone the repo`
2. Run `$ cd ultimate_townhall`
3. Run `$ bundle install`
4. Create a new .env file `$ touch .env`
5. Open the .env file and paste these two lines by replacing it with your own values:
```
user_id = replace_it_with_your_gmail_id"

user_pass = "replace_it_with_your_gmail_password"

TWITTER_API_KEY = "replace_it_with_your_api_key"

TWITTER_API_SECRET_KEY = "replace_it_with_your_api_secret"

TWITTER_ACCESS_TOKEN = "replace_it_with_your_access_token"

TWITTER_ACCESS_SECRET_TOKEN = "replace_it_with_your_token_secret"
```
6. Enjoy by executing the program `$ ruby app.rb`

## Contributions

This project was build with the help of:
* [Arthur Mansuy](https://github.com/tutus06)
* [Nathaniel Debache](https://github.com/Natdenice)
* [Thomas Charvet](https://github.com/TomacTh)
* [Ysaline Macé](https://github.com/Ysalien)

## Contact

Problems or questions? File an issue at [GitHub](https://github.com/nikitavasilev/tic-tac-toe/issues).






