require 'test_helper'

class DivisionTest < ActiveSupport::TestCase
  def setup
    @division = divisions(:one)
  end

  test 'Division is valid' do
    assert @division.valid?
  end

  test 'invalid without federation' do
    @division.federation = nil
    refute @division.valid?, 'Saved division without federation id'
    assert_not_nil @division.errors[:federation], 'no validation error for federation id present'
  end

  test 'invalid without name' do
    @division.name = nil
    refute @division.valid?, 'Saved division without name'
    assert_not_nil @division.errors[:federation], 'no validation error for name present'
  end
end
