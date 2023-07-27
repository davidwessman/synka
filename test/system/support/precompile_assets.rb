# frozen_string_literal: true
# Precompile assets before running tests to avoid timeouts.
# Do not precompile if webpack-dev-server is running (NOTE: MUST be launched with RAILS_ENV=test)

module PrecompileAssets
  def self.setup
    return if ENV["TEST_PRECOMPILED_ASSETS"]
    $stdout.puts("\n🐢  Precompiling assets.\n")
    original_stdout = $stdout.clone

    start = Time.current
    begin
      # Silence output
      $stdout.reopen(File.new("/dev/null", "w"))
      require("rake")
      Rails.application.load_tasks
      Rake::Task["assets:precompile"].execute
    ensure
      $stdout.reopen(original_stdout)
      $stdout.puts("Finished in #{(Time.current - start).round(2)} seconds")
    end
    ENV["TEST_PRECOMPILED_ASSETS"] = "true"
  end
end
