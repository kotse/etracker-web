class ReportsController < ApplicationController
  def index
  end

  def expenses_by_tag
  	report = Report.new current_user
  	@data = report.expenses_by_tag
  	render :json => @data, :status => 200
  end
end
