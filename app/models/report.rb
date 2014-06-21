class Report
	attr_reader :user

	def initialize(user)
	  @user = user
	end

	def expenses_by_tag
	  @data = Hash.new

	  @expenses = @user.expenses.all

	  @expenses.each do |expense|
	  	tag_key = expense.tag_names.join ","
	  	amount_sum = 0
	  	amount_sum = @data[tag_key] unless @data[tag_key].nil?
	  	@data[tag_key] = amount_sum + expense.amount
	  end

	  @data.map { |k,v| {label:k,  value: v}}
	end
end