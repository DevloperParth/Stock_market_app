# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
    resp = RestClient::Request.execute(method: :get,
      url: "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC&tsyms=INR,EUR",
    headers:{
      'Content-Type': 'application/json'
    })
    data = JSON.parse(resp.body)

    data["RAW"].each do |currency, details|
      a = data["RAW"][currency]
      a.each do |key, value|
        Currency.create(name: value['MARKET'], price: value['PRICE'])
        # byebug
    end
  end