# frozen_string_literal: true

require 'logger'

# Miscellaneous methods
module CustomModule
  module_function

  def time_to_s
    Time.now.strftime('%Y%m%dT%H%M')
  end

  def log_info(message)
    logger = Logger.new('./log/development.log')
    logger.info(message)
    pp message
    logger.close
  end
end
