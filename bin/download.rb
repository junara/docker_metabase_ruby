# frozen_string_literal: true

require 'dotenv'
require 'zeitwerk'
require 'logger'

loader = Zeitwerk::Loader.new
loader.push_dir('./libs')
loader.setup

envfile = '.env'
Dotenv.load(envfile)
url = ENV['METABASE_URL']
username = ENV['METABASE_USERNAME']
password = ENV['METABASE_PASSWORD']

custom_metabase = CustomMetabase.new(
  url: url,
  username: username,
  password: password
)

dirname = "csv/#{CustomModule.time_to_s}"
list = [
  { card_id: 1, filename: 'csv_output' }
]
list.each do |hash|
  custom_metabase.download_csv(hash[:card_id], "#{dirname}/#{hash[:filename]}.csv")
end
