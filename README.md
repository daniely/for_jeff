### Prereqs
1. ruby
2. bundler

### Instructions
1. run `bundle install`
2. run `cp config.env.example config.env`
3. add access ID and secret key to `config.env`
4. run `CONFIG=./config.env bundle exec rake scrape[ride a bike]`
   Note: for zsh run `CONFIG=./config.env bundle exec rake scrape\[ride+a+bike\]` (handle brackets and spaces)
