# Prayer Request App

This Rails app allows users to share prayer requests. As I searched for a quality mobile app for prayer, I realized that none of the apps were simplified enough for any church member to share prayer requests directly with their church family. I created a backend using Ruby on Rails that utilizes two simple models: user and prayer. 

Users can sign up for an account, log in, and view all prayer requests in the community filtering different prayer types.
Users can create and edit their prayer requests.

Technologies include Ruby on Rails backend and PostgreSQL database.

## Installation

```bash
git clone https://github.com/vanwilson/prayer-request-app
```

```bash
bundle install
rails db:create db:migrate db:seed
```

## Usage

```bash
rails server
```

You can run all the API tests from the `test` folder by running: 

```bash
rails test
```

## Roadmap

List any ideas you plan on implementing in the future.
