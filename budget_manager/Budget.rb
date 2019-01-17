#!/usr/local/bin/ruby
require 'colorize'

# A budget includes a hash that keeps track of spending, a
# constant integer that represents the budget amount, and an average
# amount of money that should be spent idealy per day

# Budget amount. Adjust before compiling
$BUDGET = 100.00
# Ideal amount that should be spent on average per day. Adjust before compiling
$AVERAGE = 10.00

class Budget

	# Record keeping of all money spent is represented in a hash,
	# where its keys are strings that represent dates with the format: #{1,2}/#{1,2} 
	# and its values are strings that represent cost spendature with the format: [#]+.##
	def initialize
		@my_spending = Hash.new
	end

	# Loads the input from input.txt into @my_spending
	def load
		line_num = 0
		File.open("input.txt", "r") { |f|
			f.readlines.each{ |line|
				if line =~ /^\s*([0-9]{1,2}\s*\/\s*[0-9]{1,2})\s*:\s*\$([0-9]+\.[0-9]{2})\s*$/ &&
					@my_spending.include?($1) == false then
					@my_spending[$1] = $2.to_f
				else
					@my_spending.clear
					puts "Error at line".red + " " + line_num.to_s.red + ". Clearing hash...".red
					return false
				end
				line_num = line_num + 1
			}
		}
		puts "...loading complete"
		return true
	end

	# Prints a list of all recorded spending
	def spending
		@my_spending.each { |k,v|
			if v > $AVERAGE then
				puts k + " " + "=>" + " " + "$".red + sprintf('%.2f', v).red
			else
				puts k + " " + "=>" + " " + "$".green + sprintf('%.2f', v).green
			end
		}
	end

	# Returns the total amount of money spent
	def total
		sum = 0.00
		@my_spending.each { |k,v|
			sum = sum + v  
		}
		return sum
	end

	# Returns net amount left in the entire budget. A negative amount indicates
	# spending has exceeded the budget
	def net
		return $BUDGET - total
	end	

	# Returns the mean of all spending
	def mean
		if @my_spending.size == 0 then
			return 0.00
		else
			return total / @my_spending.size.to_f
		end
	end

	# Returns the amount of leftover money that can be spent friverously, assuming
	# an average of $10.00 spent per day 
	def pocketMoney
		return @my_spending.size.to_f * 10.00 - total
	end
end