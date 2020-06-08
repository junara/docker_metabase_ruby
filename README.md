# docker_metabase_ruby
Example metabase using ruby

## Ref

* metabase-ruby
    * https://github.com/shimoju/metabase-ruby

## Setup

```
docker-compose up -d
```

* metabase
    * http://localhost:3000

## Download csv from metabase
* set .env like this

```.env
METABASE_URL=http://localhost:3000
METABASE_USERNAME=test@test.com
METABASE_PASSWORD=password
```

* get card_id from metabase and set in this

```ruby
list = [
  { card_id: 1, filename: 'csv_output' }
]
```

* execute

```shell
ruby ./bin/download.rb
```

see `./csv/` . You can seed csc files.