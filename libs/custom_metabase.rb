# frozen_string_literal: true

require 'metabase'
require 'fileutils'

# Metabase tool
class CustomMetabase
  attr_accessor :url, :username, :password

  def initialize(url:, username:, password:)
    @url = url
    @username = username
    @password = password
  end

  def download_csv(card_id, filename = 'out.csv')
    find_or_initialize_dirnam(filename)
    CustomModule.log_info "Start download of card_id #{card_id} file as csv"
    text = metabase_client.query_card(card_id, format: :csv)
    CustomModule.log_info "card_id #{card_id} is downloaded"
    File.open(filename, 'w') do |f|
      f.puts(text)
    end
    CustomModule.log_info "card_id #{card_id} is saved as #{filename}"
  end

  private

  def metabase_client(force = false)
    if force
      @metabase_client = setup_metabase_client
    else
      @metabase_client ||= setup_metabase_client
    end
  end

  def setup_metabase_client
    client = Metabase::Client.new(
      url: url,
      username: username,
      password: password
    )
    # Authenticate
    client.login
    client
  end

  def find_or_initialize_dirnam(filename)
    dirname = File.dirname(filename)
    return if Dir.exist?(dirname)

    CustomModule.log_info  "#{dirname} directory not existed"
    CustomModule.log_info  "make #{dirname} directory"
    FileUtils.makedirs(dirname)
  end
end
