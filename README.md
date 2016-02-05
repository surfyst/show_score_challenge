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
   Use Bootstrap to style it, feel free to organize data however you want, you just need to use standard Bootstrap elements/class, so it looks pretty.
   Add some tests too, you can use whatever framework you like: MiniTest, RSpec, etc.

3. Even though this is a simple demo app that we're running in a development environment, if there are any special tricks you would use to increase the performance of an interface like this in a production environment (caching strategies, for instance, or special ActiveRecord functions) feel free to show those off.

#### Step 2

Change your query for top 10 shows in such a way, that it will sort shows not just by average score, but by (average score + random number from 0 to 100).
The tricky part: random number should be changed **once a minute**, not on every request, so within one minute top stays static, but it changes for every next minute.

#### Step 3

Using CoffeeScript, write polling mechanism, which will request server **every second** for updated top.
Server end-point should simulate response which takes 1.5 seconds to compute.
Replace current top shows with server response, no need to compare if there any changes or not.
It would be awesome if you could use `Class` feature of CoffeeScript to make your code namespaced and independent.

### Result

If all 3 steps are done properly, the app should work like that:

1. going to `localhost:3000` in browser presents top 10 shows (immediately, without any delays from step 3)
2. keeping browser open on that page will change top 10 shows every minute without any actions from user side (because random number changes once a minute)

That's it.

Creating small meaningful commits along the way would be a plus.
You can share your work with us by sending your project tree to us by email in a compressed directory.

Please, **don't send pull requests** to this repository.
