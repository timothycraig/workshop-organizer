### Abstract
I work for a data science conference (http://odsc.com).  The conference
workshops are always extremely popular, and attendees line up to get a spot.  
I am building a web app that allows attendees to view the workshop list
and sign up in advance for workshops.

### ER Diagrams
http://prntscr.com/aqqvtl [preliminary]
http://prnt.sc/asesbo [final version]

### Building Blocks:
- __Back end:__ Ruby on Rails, pSQL
- __Front end:__ Javascript

### Models:
- Users (admin, attendees, presenters)
- Workshops
- Comments
- Category
- Location

### Core User Stories:
__Admin__
As an admin
I can view a list of users
So I can see how many users have signed up

As an admin
I can delete a user
So I can remove inappropriate users

[] Be signed as an Admin
[] Visit users index page

As an admin
I can update a workshop
So I can keep attendees up to date with changes

As an admin
I can delete a workshop
So I can remove inappropriate workshops

[] Be signed as an Admin
[] Visit workshops index page

As an admin
I can delete a comment
So I can remove inappropriate comments

[] Be signed as an Admin
[] Visit workshop show page

As an admin
I can delete a Location
So I can remove irrelevant locations

[] Visit locations index

As an admin
I can delete a workshop Category
So I can remove irrelevant categories

[] Visit categories index

__Users(attendees)__
As a prospective user
I can sign up and make an account
So I can attend workshops and write comments

[] visit root path

As a user
I can update my profile
In case my information changes

As a user
I can delete my account
In case I am no longer interested

[] Sign in
[] Visit profile

__Workshops__
As a user
I can see a list of workshops
So I can sign up and learn

[] Sign in
[] Visit workshops index

As a user
I can see workshop details
So I can get the details

[] Sign in
[] Visit workshop show

__Users (presenters)__
As a prospective presenter
I can sign up and make an account
So I can give workshops

As a presenter
I can update my profile
In case my information changes

As a presenter
I can delete my account
In case I am no longer interested

[] Sign in
[] Visit profile

__Workshops__
As a presenter
I can create a workshop
So attendees can attend my workshop

[] Sign in
[] Visit workshop new

As a presenter
I can update my workshop details
In case the details change

As a presenter
I can delete my workshop
In case I can't present

[] Sign in
[] Visit workshops index

__Comments__
As an attendee
I can comment on a workshop
To share useful information

[] Sign in
[] Visit workshop show page

### Additional User Stories:
- users can vote for their favorite workshops
- users receive email conformation about signup
- users can see recommended workshops, based on their interests
