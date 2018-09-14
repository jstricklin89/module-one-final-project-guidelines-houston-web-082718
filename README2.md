# Module 1 Final Project - J&G Beer Tracker

The J&G Beer Tracker application is built in Ruby and is designed to run as a CLI. We used a CSV flatfile to import a large 
database of 5000+ beers into our database using ActiveRecord. Once the program is ran it will allow the end user to create a 
new login with their full name, add personal favorite beers, and then return the results they are interested in based on their
favorites. If a user does not want to create a login, they can also just browse the database and still see top results for
different beer styles, names, and categories. If a user logs out they will still be in the database and can always log in again at a later time.

## Getting Started

You can run this program by executing `ruby bin/run.rb`. It will call on the environment file which has the bundler and database connection that are required to run the program.
Before you execute the program you will need to run a few preliminary steps listed in prerequisites.

### Prerequisites

1. Run a `bundle install` once you have cloned the files locally.
2. Run a rake db:migrate to create the database and prepare it for seeding the data.
3. Run a rake db:seed to seed all the database files into the database. Notice these files are in the openbeercsv folder.
4. Run `ruby bin/run.rb`

## Running the program

Once you have ran the run.rb executable you can start by creating a new user:

Press 2+enter > type your full name +enter > follow the in menu prompts to add and view favorites.
  *Note- you have to enter the favorites by beer_id. You can use any number between 1-5000 or open the beer.csv file and grab an ID from there to use to add a favorite.*

If you just want to view data without logging in:
  You can hit 3 at the main menu and follow the next prompt screen to browse.
  
Once you are an existing user you are in the database until deleted. Next time you run the app you can just press 1 to login and then follow the same prompts to view favorites, etc.

## Built With

* [Ruby](https://ruby-doc.org/) - The language used
* [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html) - The ORM Used

## Contributing

This was a project for a programming bootcamp. You can reach out to either of us through GitHub, but this probably isnt necessary.

## Authors

* **Graham Watson** - *Shared work* - [Flatiron School](https://github.com/gwatson86)
* **Jonathan Stricklin** - *Shared work* - [Flatiron School](https://github.com/jstricklin89)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* All the instructors and students at Flatiron School Houston for getting us this far

