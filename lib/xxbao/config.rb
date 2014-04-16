# coding: utf-8

module Xxbao
  module Config
    Base  = "http://fund.eastmoney.com/"
    Regex = /<td rowspan='2'>(\d+-\d+-\d+)<\/td>.+<span class="red bold">(\d+\.\d+)<\/span>.+<td class="datadesp">7.+(\d+\.\d+%).+class="datadesp">28/
    Funds = [
      {
        code: "000343",
        bao: "财富宝",
        platform: "微信理财通",
        found: "华夏财富宝货币"
      }, {
        code: "000397",
        bao: "全额宝",
        platform: "微信理财通",
        found: "汇添富全额宝货币"
      }, {
        code: "000330",
        bao: "现金宝",
        platform: "网易理财",
        found: "汇添富现金宝货币"
      }, {
        code: "000330",
        bao: "零钱宝",
        platform: "苏宁",
        found: "汇添富现金宝货币"
      }, {
        code: "000389",
        bao: "零钱宝",
        platform: "苏宁",
        found: "广发天天红货币"
      }, {
        code: "000198",
        bao: "余额宝",
        platform: "支付宝",
        found: "天弘增利宝货币"
      }, {
        code: "003003",
        bao: "百赚",
        platform: "百度理财",
        found: "华夏财富宝货币"
      }, {
        code: "000464",
        bao: "百赚利滚利版",
        platform: "百度理财",
        found: "嘉实活期宝货币"
      }
    ]
  end
end


