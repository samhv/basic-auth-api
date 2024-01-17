# Basic auth on Rails
Account creation api. It uses bcrypt and has_secure_password.

# Files you'd like to review
```
db/migrate/20240115005625_create_users.rb
models/user.rb
controllers/users_controller.rb
config/routes.rb
```

# Run it
You need:
- Ruby 3.3.0
- PostgreSQL running

```
bin/bundle install
bin/rails db:create
bin/rails db:migrate
bin/rails s
```
