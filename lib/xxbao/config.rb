# coding: utf-8

module Xxbao
  @base  = 'http://jingzhi.funds.hexun.com/'
  @regex = /<font.+><span>(\d\.\d+)<\/span>.+\r\n.+<font.+>(\d\.\d+%)<\/font>/
  @funds = {
    "000343" => {
      bao: "财富宝",
      platform: "微信理财通",
      fund: "华夏财富宝货币"
    },
    "000397" => {
      bao: "全额宝",
      platform: "微信理财通",
      fund: "汇添富全额宝货币"
    },
    "000330" => {
      bao: "现金宝",
      platform: "网易理财",
      fund: "汇添富现金宝货币"
    },
    "000198" => {
      bao: "余额宝",
      platform: "支付宝",
      fund: "天弘增利宝货币"
    },
    "003003" => {
      bao: "百赚",
      platform: "百度理财",
      fund: "华夏财富宝货币"
    },
    "000464" => {
      bao: "百赚利滚利版",
      platform: "百度理财",
      fund: "嘉实活期宝货币"
    },
    "000389" => {
      bao: "零钱宝",
      platform: "苏宁",
      found: "广发天天红货币"
    }
  }
end


