## Leaderboard Challenge

This is a bare-bones Rails app that we've put together to see how you think.

We hesitate even to call it a "challenge" or a "test" because this isn't designed to stump you.
We just want to see what your instincts are with respect to applying Rails' abstractions to a specific and realistic problem.

So without further ado...

Please begin by running bundler.

````
bundle install
````

Then run migrations to create the schema (the development-default Sqlite3 will be used. You're welcome to swap in another DBMS if you want, but there isn't much point).

````
bin/rake db:migrate
````

Finally, seed the database:
````
bin/rake db:seed
````

The schema consists of "shows" and "reviews". We've dropped corresponding models into app/models and set up the relation between them (a show has many reviews). The seeds script that you've run will have populated the database with twenty randomly-named shows and a couple hundred random reviews (with different numbers of reviews per show, and each review giving the show a score between 1 and 100).

### Your task is simply this:

#### Step 1

1. Fix incorrect Bootstrap setup

2. Build a page that displays the top 10 shows by average score (in descending order, with the highest-rated show at the top of the list).
   The interface should display the show title, its average score (you should limit the decimals to 1, i.e. "score: 70.5") and its review count.
   Use Bootstrap to style it, feel free to organize the data however you want -- just need to use standard Bootstrap elements/class, so it looks pretty.
   Add some tests, using whatever framework you like: MiniTest, RSpec, etc.

3. Even though this is a simple demo app that we're running in a development environment, if there are any special tricks you would use to increase the performance of an app like this in a production environment (caching strategies, for instance, or special ActiveRecord functions) feel free to show those off.

#### Step 2

Change your query for the top 10 shows so that it will sort shows not by average score, but by (average score + random number from 0 to 100).
The tricky part: the random number should be changed **once a minute**, not on every request, so within a given one-minute period the top stays static, but then it changes for every next-minute period.

#### Step 3

Using CoffeeScript, write a polling mechanism, which will make a request to the server **every second** for an updated top list.
The server end-point should simulate a response that takes 1.5 seconds to compute.
Replace the current top shows with the server's response.  There is no need to compare if there any changes or not.
It would be awesome if you could use `Class` feature of CoffeeScript to make your code namespaced and independent.

### Result

If all 3 steps are done properly, the app should work like this:

1. going to `localhost:3000` in a browser presents the top 10 shows (immediately, without any delays from step 3)
2. while keeping the browser open, that page will change the top 10 shows without any actions from user side (when the random number changes)

That's it.

Creating small meaningful commits along the way would be a plus, as is good inline documentation and verbose commit descriptions.
You can share your work with us by sending your project tree to us by email in a compressed directory.

Please, **don't send pull requests** to this repository.