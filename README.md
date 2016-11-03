# Shipping Service API
Build a stand-alone shipping service API that calculates estimated shipping cost for the bEtsy application, Petsy.

## Learning Goals
- Develop the ability to read 3rd party code
- APIs
    - design
    - build
    - test
- Continue working with JSON
- Revisit
    - HTTP interactions
    - Testing of 3rd party services
- Increased confidence in working with 3rd party APIs

## Guidelines
- Practice TDD to lead the development process for Models and Controllers
- Create user stories and keep the stories up-to-date throughout the project
- Deploy on Heroku
- Shipping API will communicate with the bEtsy app via JSON
- Integrate the [ActiveShipping](https://github.com/Shopify/active_shipping) gem to do shipping-specific logic for you

## Project Baseline

### Baseline Requirements
- a Ruby gemset that locks the Ruby version to 2.3.1
- a new Rails 4.2.7 application
- [simplecov](https://github.com/colszowka/simplecov) for code coverage reporting
- create a NEW fork from Petsy
- create a preliminary Heroku deployment of Petsy
- review Petsy code to come up with a basic understanding of the current checkout user flow

## Expectations
Given shipping addresses and a set of packages, generate a quote for the cost of shipping for these items for a given shipper.

## Requirements
### Technical Requirements
#### Your API will:
- Respond with JSON and meaningful HTTP response codes  
- Allow Users to get shipping cost quotes for different delivery types (standard, express, overnight, etc.)
- Allow Users to get a cost comparison of two or more carriers  
- Log all requests and their associated responses such that an audit could be conducted  
- Have appropriate error handling:
  - When a User's request is incomplete, return an appropriate error
  - When a User's request does not process in a timely manner, return an appropriate error

#### Your bEtsy application will:
- Integrate packaging estimates into the checkout workflow to be able to utilize the shipping API
- Present the relevant shipping information to the user during the checkout process
  - Cost
  - Delivery estimate
  - Tracking information (when available)

### Testing
- 95% test coverage for all API Controller actions, Model validations, and Model methods

### Added Fun!
- Allow merchants to view the total shipping costs for all of their products in a particular order
- Find the seam in Petsy between the shopping and payment processing, and build a payment processing service
