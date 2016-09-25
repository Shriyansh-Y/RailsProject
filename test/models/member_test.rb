require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :members
test "check if valid email" do
  m=members(:two)
  assert_match(/[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+/,m.email)
end
test "check if valid password" do
  m=members(:two)
  assert_match(/^.{5,}$/,m.password_digest)
  test "check if valid name" do
    m=members(:two)
    assert_match(/^.{,20}$/,m.name)
  end
end
  test "name not empty" do
    m=members(:two)
    assert_not_empty(m.name)
  end
  test "password not empty" do
    m=members(:two)
    assert_not_empty(m.password_digest)
  end
  test "email not empty" do
    m=members(:two)
    assert_not_empty(m.email)
  end

end