require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'sharding' do
    ActiveRecord::Base.connected_to(shard: :hahow) do
      assert_equal User.count, 0
      User.create!(username: 'foo', password: 'bar', password_confirmation: 'bar')
      assert_equal User.count, 1
    end

    ActiveRecord::Base.connected_to(shard: :cathy) do
      assert_equal User.count, 0
    end
  end
end
