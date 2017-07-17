web: bin/rails server -p $PORT -e $RAILS_ENV
worker: RAILS_MAX_THREAD=10 bundle exec sidekiq -e $RAILS_ENV
release: bundle exec rails db:migrate