# Billing and Recurring Payment App
## Key Features

#### Admin
* Admin section can be opened by (https://billing-app-umair.herokuapp.com/admin)
* Signup login and logout of users(name, email, password, type[admin,buyer], profile photo)
  - users cannot sign up, only admin can manage users
* Admin can create many plans
  - Each plan will have a monthly fee and name.
* Plans can have many features
 - Features will have a name, code, unit_price, max_unit_limit. Admin can create these features
#### Buyer
* Buyer can subscribe to more than one plan
* Buyer will have to authorize payment for successful subscription
## How To Use
From your command line:

```bash
# Clone this repository
$ git clone https://github.com/umairzahid907/Billing-Recurring-Payment-System

# Go into the repository
$ cd billing-app

# Install dependencies
$ bundle install

# Run the app
$ rails s
```
