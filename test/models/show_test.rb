require 'test_helper'

class ShowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @show = shows(:one)
  end

  test 'show is valid' do
    assert @show.valid?
  end

  test 'invalid without federation' do
    @show.federation = nil
    refute @show.valid?, 'Saved show without federation id'
    assert_not_nil @show.errors[:federation], 'no validation error for federation id present'
  end

  test 'invalid without name' do
    @show.name = nil
    refute @show.valid?, 'Saved show without name'
    assert_not_nil @show.errors[:name], 'no validation error for name present'
  end

  test 'invalid without day_of_week' do
    @show.day_of_week = nil
    refute @show.valid?, 'Saved show without day of week'
    assert_not_nil @show.errors[:day_of_week], 'no validation error for day_of_week present'
  end

  test 'invalid without number_of_matches' do
    @show.number_of_matches = nil
    refute @show.valid?, 'Saved show without number_of_matches'
    assert_not_nil @show.errors[:number_of_matches], 'no validation error for number_of_matches present'
  end
end
