# coding: utf-8

require "xxbao/version"
require "xxbao/config"
require "thor"
require "formatador"
require "colorize"
require 'net/http'

module Xxbao

  class << self
    def fetch code, fund
      uri = URI(@base + "#{code}.shtml")
      if Net::HTTP.get(uri) =~ @regex
        fund[:per_million] ||= $1
        fund[:seven_yield] ||= $2
      end
    end
  end

  @funds.map do |code, fund|
    Thread.new { fetch(code, fund) }
  end.each { |t| t.join }
end