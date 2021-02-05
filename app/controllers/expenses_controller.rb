class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  helper_method :sort_column, :sort_direction
  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.order(sort_column + " " + sort_direction)
  end

  # GET /expenses/1 or /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
   # @expense = Expense.new
    @expense = Current.user.expenses.build
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses or /expenses.json
  def create
    #@expense = Expense.new(expense_params)
    @expense = Current.user.expenses.build(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_url, notice: "Spending was successfully created." }
        format.json { render :index, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_url, notice: "Spending was successfully updated." }
        format.json { render :index, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: "Spending was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:name, :description, :category, :amount, :price, :user_id)
    end
    def sort_column
      Expense.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
