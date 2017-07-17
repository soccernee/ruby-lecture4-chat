web: bin/rails server -p $PORT -e $RAILS_ENV
worker: RAILS_MAX_THREAD=10 bundle exec sidekiq -e production
release: bundle exec rails db:migrate