class ExpensesController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@expenses = current_user.expenses.all
  end

  def new
  	@expense = current_user.expenses.build
  end

  def create
  	@expense = current_user.expenses.build(expense_params)
  	if @expense.save
      flash[:success] = "Expense tracked succesfully!"
      redirect_to expenses_path
    else
      flash[:error] = "Expense not tracked succesfully!"
      redirect_to expenses_path
    end
  end

  def destroy
  	expense = Expense.find(params[:id])
    expense.destroy
    redirect_to expenses_path, :notice => "Expense deleted."
  end

  def edit
  	@expense = Expense.find(params[:id])
  end

  def update
  	@expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      redirect_to expenses_path, :notice => "Changes saved."
    else
      redirect_to expenses_path, :alert => "Unable to save changes."
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:asset_id, :happened_at, :description, :amount, {:tag_ids => []})
  end
end