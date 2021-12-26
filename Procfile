web: bundle exec rails server --using puma
worker: bundle exec sidekiq -t 25
release: bundle exec rails db:migrate
