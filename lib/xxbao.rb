# coding: utf-8

require "xxbao/version"
require "xxbao/config"
require "open-uri"
require "thor"
require "formatador"
require "colorize"

module Xxbao
  Config::Funds.each do |f|
    open(Config::Base + f[:code] + ".html") do |h|
      h.each_line do |line|
        if line =~ Config::Regex
          puts f[:bao]
          puts $1, $2, $3
          break
        end
      end
    end
  end
end