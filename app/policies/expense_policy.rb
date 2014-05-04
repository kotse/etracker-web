class ExpensePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    asset_belongs_to_user?
  end

  def create?
    asset_belongs_to_user?
  end

  def update?
    asset_belongs_to_user?
  end

  def destroy?
    asset_belongs_to_user?
  end

  private

  def asset_belongs_to_user?
    @user.id==@record.user_id
  end
end
