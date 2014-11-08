### Prereqs
1. ruby
2. bundler

### Instructions
1. run `bundle install`
2. run `cp config.env.example config.env`
3. add access ID and secret key to `config.env`
4. run `CONFIG=./config.env bundle exec rake scrape['ride a bike,food,keyboard']`
  * Some rake idiosyncrasies to keep in mind:
  * terms should be surrounded by single quotes (to handle spaces)
  * do not put spaces between commas
  * for zsh we need to escape brackets `CONFIG=./config.env bundle exec rake scrape\['ride a bike,food,keyboard'\]`

### Expected Results

```
{"pda"=>91.47334822052612, "umrp"=>4.282840309591484, "umrr"=>2.2769165748150057e-11, "upa"=>64.05914663184276, "uu"=>"www.wikihow.com/Ride-a-Bicycle"}
{"pda"=>100, "umrp"=>3.6991472459861594, "umrr"=>3.566524391984878e-12, "upa"=>50.4958788474628, "uu"=>"www.youtube.com/watch?v=pRk1xZbahf0"}
{"pda"=>39.918327608172646, "umrp"=>5.1356199784352565, "umrr"=>3.4166987037344435e-10, "upa"=>50.00431865416945, "uu"=>"ridesabike.com/"}
{"pda"=>84.97257848938378, "umrp"=>4.295605922382171, "umrr"=>2.3711282027473694e-11, "upa"=>55.061651658231774, "uu"=>"www.rei.com/learn/expert-advice/teach-child-to-ride-a-bike.html"}
{"pda"=>21.917990686742694, "umrp"=>5.183644428165988, "umrr"=>3.979678278509527e-10, "upa"=>33.91593451658509, "uu"=>"www.rideabike.com/"}
{"pda"=>18.150572902923773, "umrp"=>4.1106356616400825, "umrr"=>1.3177138007888433e-11, "upa"=>29.71654345393226, "uu"=>"rideabikeright.com.au/"}
```
