# coding: utf-8

module Xxbao
  module Config
    BaseUrl = 'http://jingzhi.funds.hexun.com/'
    Regex = /<font.+><span>(\d\.\d+)<\/span>.+\r\n.+<font.+>(\d\.\d+%)<\/font>/
    Funds = {
        "000343" => {
            bao: "财富宝",
            platform: "微信",
        },
        "000330" => {
            bao: "现金宝",
            platform: "网易理财",
        },
        "000198" => {
            bao: "余额宝",
            platform: "支付宝",
        },
        "003003" => {
            bao: "百赚",
            platform: "百度理财",
        },
        "000464" => {
            bao: "百赚利滚利版",
            platform: "百度理财",
        },
        "000389" => {
            bao: "零钱宝",
            platform: "苏宁",
        }
    }
  end
end


