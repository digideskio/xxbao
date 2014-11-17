# coding: utf-8

require "xxbao/version"
require "xxbao/config"

require "net/http"
require "command_line_reporter"
require "unicode/display_width"

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
      puts "来源: http://fund.eastmoney.com/, 时间: #{Time.now.strftime("%F %T")}"
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
        row = CommandLineReporter::Row.new(bold: true, header: true, color: "red")
        [
          CommandLineReporter::Column.new('名称', align: 'center'),
          CommandLineReporter::Column.new('平台', align: 'center'),
          CommandLineReporter::Column.new('七日年化收益率', align: 'center'),
          CommandLineReporter::Column.new('万份收益', align: 'center')
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

    class ::CommandLineReporter::Column

      def required_width
        self.text.to_s.display_size + 2 * self.padding
      end

      def aligned_cell(str)
        case self.align
        when 'left'
          " " * (self.size - str.display_size) + str if self.size > str.display_size
        when 'right'
          str + " " * (self.size - str.display_size) if self.size > str.display_size
        when 'center'
          " " * ((self.size - str.display_size) / 2.0).floor + str + " " * ((self.size - str.display_size) / 2.0).ceil
        end
      end
    end
  end
end
