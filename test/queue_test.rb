gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/queue'
require './lib/attendee_repository'

class TheQueueTest < Minitest::Test
  attr_reader :find_results, :queue
  def setup
    attendee_repo = AttendeeRepository.load('./test/fixtures/event_attendees.csv', Attendee)
    @queue = attendee_repo.find(:first_name, 'Sarah')
  end

  def test_it_exists
    assert queue
  end

  def test_it_counts_the_queue
    assert_equal 2, queue.count_data
  end

  def test_it_clears_the_queue
    queue.clear_data
    assert queue.current.empty?
  end

  def test_it_executes_print
    assert_equal "Hi", queue.print_data_table
  end

  def test_it_executes_print_by
    assert_equal "Hello", queue.print_by
  end

  def test_it_save_to
    assert_equal "Hey", queue.save_to
  end
end
