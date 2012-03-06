# setup simple schema and class
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string :name
  end
end
class User < ActiveRecord::Base
  validates :name, :presence => true
end

# hack to stop #url_for error
module ActionDispatch::Routing::PolymorphicRoutes
  def polymorphic_path(record_or_hash_or_array, options = {})
    ""
  end
end

class UsersController < ActionController::Base
end