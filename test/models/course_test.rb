require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  setup do
    @course = courses(:eecs398)
  end

  test "open queues returns only open queues" do
    open_queues = @course.open_queues

    assert     open_queues.include? course_queues(:eecs398_queue)
    assert_not open_queues.include? course_queues(:closed_queue)
  end

  test "group string serializes correctly" do
    group_string = <<-EOF
steve@umich.edu,mterwil@umich.edu
marysmith@umich.edu,jimbob@umich.edu
EOF

    assert courses(:eecs482).get_group_string.strip == group_string.strip
  end
end
