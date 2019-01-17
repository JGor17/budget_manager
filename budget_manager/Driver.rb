#!/usr/local/bin/ruby

require "minitest/autorun"
require_relative "Budget.rb"

class Driver < Minitest::Test
	def setup
		@budget = Budget.new
	end

	def test_Budget

		# Tests to see if the input file is of the right format
		assert_equal(true, @budget.load)
		puts "--------------"
		@budget.spending
		puts "--------------"

		# Total money spent...
		puts "total money spent: " + "$" + sprintf('%.2f', @budget.total)

		# Net budget...
		if @budget.net < 0.00 then
			puts "net budget: " + "$+".red + sprintf('%.2f', @budget.net * -1).red
		else
			puts "net budget: " + "$-".green + sprintf('%.2f', @budget.net).green
		end

		# Mean...
		if @budget.mean > $AVERAGE then
			puts "mean: " + "$".red + sprintf('%.2f', @budget.mean).red
		else
			puts "mean: " + "$".green + sprintf('%.2f', @budget.mean).green
		end

		# Amount of pocket money...
		if @budget.pocketMoney < 0.00 then
			puts "pocket money: " + "$".red + "0.00".red
		else
			puts "pocket money: " + "$".green + sprintf('%.2f', @budget.pocketMoney).green
		end
	end
end