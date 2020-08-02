# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - In my gem file you can see I have the ruby gem and the rails gem installed. Which look like this: gem 'rails', '~> 6.0.3', '>= 6.0.3.2 gem 'ruby '2.6.1'.

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - In my animal model, an animal has many reasons with this line: has_many :reasons

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - In my animal model, an animal belongs to a category with this line: belongs_to :category

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - For the first one in my animal model with the following line: has_many :users, through: :reasons. My second one would be in my users model with the following line: has_many :animals, through: :reasons.

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - Animals has_many Users through Reasons, Users has_many Animals through Reasons

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - Reasons can be submitted by users filling out words for the reason which is not either of its foreign keys

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - 
    From my animal model:
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :comment, presence: true
    From my user model: 
    validates :name, presence: true
    Categories model:
    validates :value, presence: true


- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - In my animal model: scope :order_by_alphabetically, -> { order(name: :asc) }
- [x] Include signup (how e.g. Devise) - in my users new view with that form and also the new_user_path route
- [x] Include login (how e.g. Devise) - in my sessions new view with the new_session_path
- [x] Include logout (how e.g. Devise) - in my users show page this is their own home page which has a log out link that stops the session in the session destroy action, with this link session_path, method:'delete'
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - I used a google sign in link on the homepage and the log out page 
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - I wrote this nested route:
resources :animals  do
    resources :reasons, only: [:new, :create, :index] 
  end
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - My form to make a new reason is nested in the animal path, new_animal_reason GET    /animals/:animal_id/reasons/new(.:format) reasons#new

- [x] Include form display of validation errors (form URL e.g. /recipes/new) - To create a new animal I have the block of code which says to show the errors in the view if there are any in this form for example: the form I used to create my animals and their comments. There is an "@animal.errors.full_messages do" line.

Confirm:
- [x] The application is pretty DRY - I have tried to not repeat anything in the controllers or in my views
- [x] Limited logic in controllers - Yes I have used helper methods to make my controllers as short as possible which I have defined in my models and my application controller. For example to checked_log_in is in the application controller because the other controllers inherit from that one
- [x] Views use helper methods if appropriate - See above line, helper methods include among others current_user, logged_in? and checked_log_in
- [x] Views use partials if appropriate  - Yes most of my forms that can be filled out are all stored in a partial when a view has to be displayed. For example my create an animal view with the new action and the new view, it renders my animal _form