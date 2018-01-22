# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    *Sinatra Gem loaded, The application runs using methods and conventions local to Sinatra DSL*
- [x] Use ActiveRecord for storing information in a database
    *Database has been created using sqlite3.  Ruby Objects inherit from ActiveRecord and CRUD functionality si confirmed to sqlite3 db.*
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
    *Two models were created. 1) User 2) Character*
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
    *User has_many :characters.  Character belongs_to :user.*
- [x] Include user accounts
    *Sessions is enabled and users can create accounts and login at /signup and /login.*
- [x] Ensure that users can't modify content created by other users
    *Helper method .current_user compares character.user_id to ensure that only users who 'own' a character can edit or delete.*
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    *Characters are created at /characters/new, read at /characters/:id, updated at /characters/:id/edit, deleted at /characters/:id/delete.*
- [x] Include user input validations
    *Forms have 'required' attribute on fields, User and character objects make use of validates_presence_of method.*
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
    *Flash messages appear if user attempts to create an account with an already existing username, or login with faulty information*
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    *All items are present in README.md*

Confirm
- [x] You have a large number of small Git commits
    *90 plus commits most of which contained 2-9 lines of changes.*
- [x] Your commit messages are meaningful
    *I tried to describe each change's location and effect.*
- [x] You made the changes in a commit that relate to the commit message
    *my commit messages pertained exactly to the associated changes.*
- [x] You don't include changes in a commit that aren't related to the commit message
    *changes to my program are reflected in my commit messages.*
