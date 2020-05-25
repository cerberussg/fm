require 'test_helper'

class FederationTest < ActiveSupport::TestCase
  def setup
    @federation = federations(:one)
  end

  test "valid federation" do
    assert @federation.valid?
  end

  test 'invalid without name' do
    @federation.name = nil
    refute @federation.valid?, 'Saved federation without name'
    assert_not_nil @federation.errors[:name], 'no validation error for name present'
  end

  test "federation name must be unique" do
    @federation = Federation.new(name: @federation.name)
    refute @federation.valid?
    refute @federation.save
    assert_operator @federation.errors.count, :>, 0
    assert @federation.errors.messages.include?(:name)
    assert @federation.errors.messages[:name].include?("has already been taken")
  end
end
