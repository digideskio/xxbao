# coding: utf-8

require "xxbao/version"
require "xxbao/config"

require "net/http"
require "command_line_reporter"

module Xxbao
  class Base
    include Config
    include CommandLineReporter

    def initialize
      @funds = Config::Funds
      fetch_funds
    end

    def run
      table(border: true) do
        row do
          column('Name', width: 17)
          column('Platform', width: 10)
          column('SevenYearRateOfReturn', width: 22)
          column('PerMillionFundNetRevenue', width: 24)
        end
        @funds.values.each do |f|
          row do
            column(f[:bao])
            column(f[:platform])
            column(f[:seven_yield])
            column(f[:per_million])
          end
        end
      end
    end

    private

      def fetch_funds
        @funds.map do |code, fund|
          Thread.new { fetch_fund(code, fund) }
        end.each { |t| t.join }
      end

      def fetch_fund code, fund
        uri = URI(Config::BaseUrl + "#{code}.shtml")
        if Net::HTTP.get(uri) =~ Regex
          fund[:per_million] ||= $1
          fund[:seven_yield] ||= $2
        end
      end

  end
end

Xxbao::Base.new.run