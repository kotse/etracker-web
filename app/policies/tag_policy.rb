class TagPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    tag_belongs_to_user?
  end

  def create?
    tag_belongs_to_user?
  end

  def update?
    tag_belongs_to_user?
  end

  def destroy?
    tag_belongs_to_user?
  end

  private

  def tag_belongs_to_user?
    @user.id==@record.user_id
  end
end
