# Simple Sourdough


## Requirements

- [ x ] Include 1 has_many, 1 belongs_to, 2 has_many through relationships.
- [ x ] Include a many to many relationship through a join table that has at least one user submittable attribute.
- [  ] Models must validate for simple attributes.
- [  ] Must use 1 ActiveRecord scope method. Must be chainable. Must use ActiveRecord Query methods.
- [ x ] Must has standard user authentication.
- [  ] Must have omniauth login.
- [  ] Must use nested routes with appropriate RESTful API.
- [  ] Forms must present validation errors with a fields_with_errors class.
- [  ] Application must be reasonably DRY. 

## Todo

- [ x ] Formula create and new.
- [ x ] Formula show, with form to start a bake.
- [  ] Formula index.
- [  ] Nested resources for bake.
- [ x ] Make a method that returns all the formulas that the user has authored.
- [ x ] Make a method that returns all the formula_ids that the user has authored.
- [  ] Refactor to include require login on all pages except for login, signup, and root.
- [ x ] Add login page and sessions controller.
- [ x ] Add static controller and root.
- [  ] Bakes index shows all users bakes. Can not see bakes that don't belong to user.
- [  ] Formula delete.
- [  ] Bake delete.
- [  ] Integrate omniauth.
- [  ] Bake show page has description of tables.
- [  ] Bake show page has form to update bake with process and rating if values nil.
- [  ] Add fields_with_errors for formula and bake.
- [  ] The only place you can start a bake is from the formula show page.

    




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
