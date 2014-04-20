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

    def output
      @table = CommandLineReporter::Table.new(border: true, width: :auto)
      @table.add(first_row)
      @funds.values.each { |f| @table.add(fund_row(f)) }
      @table.output
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

      def first_row
        row = CommandLineReporter::Row.new(bold: true)
        [
          CommandLineReporter::Column.new('Name', align: 'center'),
          CommandLineReporter::Column.new('Platform', align: 'center'),
          CommandLineReporter::Column.new('SevenYearRateOfReturn', align: 'center'),
          CommandLineReporter::Column.new('PerMillionFundNetRevenue', align: 'center')
        ].each { |c| row.add(c) }
        row
      end

      def fund_row fund
        row = CommandLineReporter::Row.new
        [
          CommandLineReporter::Column.new(fund[:bao]),
          CommandLineReporter::Column.new(fund[:platform]),
          CommandLineReporter::Column.new(fund[:seven_yield]),
          CommandLineReporter::Column.new(fund[:per_million])
        ].each { |c| row.add(c) }
        row
      end

    # patch for CommandLineReporter
    # a row will not inherit bold & color from other row
    class ::CommandLineReporter::Table
      def inherit_column_attrs(row)
        row.columns.each_with_index { |c, i| use_positional_attrs(c, i) }
      end
    end

  end
end