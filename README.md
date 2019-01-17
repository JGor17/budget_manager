# budget_manager
accounting application used to record spending over a specified fixed budget

Budget.rb: source code of the entire application. There is a constant variable towards the top of the file named BUDGET at line 9 for the user to adjust to his/her fixed budget (required before starting the application, otherwise defaults to $100).
Driver.rb: contains the implementation of Budget.rb and this file is to be compiled in order to run the program. Uses visualizations like dashed lines, and uses red and green text to visualize defecit and credit.
input.txt: this file is used as input for the program. This should idealy be an archive of every transaction made by the user.

format for each line is as follows: ##/##: $##(inf).##
each line has a date and amount of money spent

Brief Summary:
This side project was created by me over the summer in order to solve a certain issue regarding fall semester of 2018. That semester I was
off campus for the first time without a meal plan and needed some way of accounting for every transaction I made, given a fixed budget from
my parents to spend on food. This application helps me to keep track of how much is left in the budget, how much I can spend luxuriously,
what the current trend of my spending is, how much above or below am I in terms of the average amount of money I should be spending daily to
optimize my spendature, and so on. This ruby application has been really useful to me in terms of me staying on track with my budget and not
overspending.
