class AddReferenceToSuggestio < ActiveRecord::Migration
  def change
  	add_reference :suggestions, :user, index: true, foreign_key: false
  end
end
