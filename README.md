Goodwill

Lyman Cao
lyman.cao@sv.cmu.edu
========

This website is about a goodwill store. Sellers can register online and post the product they want to sell. And buyers can browse the website and contact the seller by email.

As required on task 3:
* Create at least two controllers and two models that are related to each other. (i.e. there is foreign key or join table between the two.)

- Two models and two controllers. One is user and the other is product. A user has many products and a product belongs to a user.

* Use migrations to incrementally build your database. Because you are working by yourself, it is tempting to just use one migration file and keep altering it until it is "perfect." Instead, use multiple migrations just as if you were on a team of developers.

- create_users.rb, create_products.rb, add_devise_to_users.rb

* Write unit, functional, and integration tests for the more interesting parts of your system. We don't expect 100% code coverage.

- All in spec folder

* Have one AJAX operation.

- This website uses data-turbolinks-track, which is already an AJAX operation.

* Have one REST API and be able to test it with an XML request