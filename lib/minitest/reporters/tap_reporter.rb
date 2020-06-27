module Minitest
  module Reporters
    # Based on https://github.com/kern/minitest-reporters/blob/master/lib/minitest/reporters/progress_reporter.rb
    # Tries to adhere to https://testanything.org/tap-specification.html
    class TapReporter < DefaultReporter
      def report
        puts
        puts("TAP version 13")
        puts("1..#{tests.length}")
        tests.each_with_index do |test, index|
          test_str = "#{test_class(test)} - #{test.name.tr("#", "_")}"
          if test.passed?
            puts "ok #{index + 1} - #{test_str}"
          elsif test.skipped?
            puts "ok #{index + 1} # skip: #{test_str}"
          elsif test.failure.present?
            puts "not ok #{index + 1} - failed: #{test_str}"
            test.failure.message.each_line do |line|
              print_padded_comment(line)
            end
            unless test.failure.is_a?(MiniTest::UnexpectedError)
              trace = filter_backtrace(test.failure.backtrace)
              trace.each do |line|
                print_padded_comment(line)
              end
            end
            puts
          end
        end

        super
      end

      private

      def print_padded_comment(line)
        puts "##{pad(line)}"
      end
    end
  end
end
