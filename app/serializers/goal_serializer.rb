class GoalSerializer < ActiveModel::Serializer
  attributes :id, :name, :target_amount, :current_amount, :deadline
end
