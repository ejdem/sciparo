require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  
  def setup
    @user  = users(:adam)
    @match = @user.active_matches.build(player1_id: @user.id, player2_id: 0)
  end
  
  test "Match not valid, no player id" do
    @match.player1_id = nil
    assert_not @match.valid?
  end
  
  test "Match valid" do
    assert @match.valid?
  end
end
