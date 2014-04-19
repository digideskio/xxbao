# coding: utf-8

module Xxbao
  module Config
    BaseUrl = 'http://jingzhi.funds.hexun.com/'
    Regex   = /<font.+><span>(\d\.\d+)<\/span>.+\r\n.+<font.+>(\d\.\d+%)<\/font>/
    Funds   = {
      "000343" => {
        bao: "CaiFuBao",
        platform: "WeChat",
      },
      "000397" => {
        bao: "QuanEBao",
        platform: "WeChat",
      },
      "000330" => {
        bao: "XianJinBao",
        platform: "Netease",
      },
      "000198" => {
        bao: "YuEBao",
        platform: "Alipay",
      },
      "003003" => {
        bao: "BaiZhuan",
        platform: "Baidu",
      },
      "000464" => {
        bao: "BaiZhuan(ligunli)",
        platform: "Baidu",
      },
      "000389" => {
        bao: "LingQianBao",
        platform: "Suning",
      }
    }
  end
end


