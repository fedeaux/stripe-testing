# README

```
docker-compose up
rake db:setup
rake db:migrate
rspec

# Expected not to raise errors
# Actually raises an error

Stripe::InvalidRequestError:
       Invalid token id: test_cus_3
```
