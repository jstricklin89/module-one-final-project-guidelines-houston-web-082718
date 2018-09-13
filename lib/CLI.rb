require 'pry'

class CLI

    @@current_user = nil

    def log_in
        puts "Please enter your name."
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"
        
        if User.all.find_by(name: input) 
            @@current_user = User.all.find_by(name: input)
            user_menu
        else
            puts "There is no user with this name! Press enter to try again, or enter 1 to create a new account."
            puts "*******************************************"
            input = gets.chomp
            puts "*******************************************"
            
            if input == "1"
                new_account
            else
                log_in
            end
        end
    end

    def user_menu
        puts "Welcome, #{@@current_user.name}. What would you like to do?"
        puts "Please enter any of the following commands:"
        puts "Add new favorite: enter 1"
        puts "Delete an existing favorite: enter 2"
        puts "View your favorite beers: enter 3"
        puts "View your favorite breweries: enter 4"
        puts "View your favorite beer styles: enter 5"
        puts "View your favorite beer categories: enter 6"
        puts "View the average ABV of your favorite beers: enter 7"
        puts "Log out: enter 8"
        puts "Delete your account: enter 'I prefer Boone's Farm'"
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"

        case input
        when "1"
            new_favorite
        when "2"
            delete_favorite
        when "3"
            favorite_beers
        when "4"
            favorite_breweries
        when "5"
            favorite_styles
        when "6"
            favorite_categories
        when "7"
            abv
        when "8"
            CLI.new.welcome
        when "I prefer Boone's Farm"
            delete_user
        else    
            puts "Please enter a valid command."
            puts "*******************************************"
            user_menu
        end
    end

    def new_favorite
        puts "Please enter the beer ID of the beer you'd like to add to your favorites."
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"
        
        if @@current_user.favorites.find_by(beer_id: input)
            puts "You've already favorited that beer!"
            puts "*******************************************"
        else 
            @@current_user.add_favorite(input)
            puts "You've added #{Beer.all.find(input).brewery.name} - #{Beer.all.find(input).name} to your favorites!"
            puts "*******************************************"
        end

        puts "Press enter to go back to the user menu."
        
        puts "*******************************************"
        gets.chomp
        puts "*******************************************"
        user_menu
    end

    def delete_favorite
        puts "Please enter the id of the beer you'd like to delete:"
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"

        if @@current_user.favorites.find_by(beer_id: input)
            @@current_user.favorites.find_by(beer_id: input).destroy
            puts "You've deleted #{Beer.all.find(input).brewery.name} - #{Beer.all.find(input).name} from your favorites."
            puts "*******************************************"
            puts "Press enter to return to the user menu."
            puts "*******************************************"
            gets.chomp
            puts "*******************************************"

            user_menu
        else
            puts "You haven't favorited that beer!"
            puts "*******************************************"
            user_menu
        end
    end

    def favorite_beers
        @@current_user.favorite_beer_names
        puts "*******************************************"
        
        puts "Press enter to go back to the user menu."
        
        puts "*******************************************"
        gets.chomp
        puts "*******************************************"
        user_menu
    end

    def favorite_breweries
        puts "This will show you your favorite breweries based on how many of their beers you've favorited."
        puts "Please enter how many breweries you'd like to view:"
        
        puts "*******************************************"
        input = gets.chomp.to_i
        puts "*******************************************"
        
        @@current_user.most_popular_breweries(input)
        puts "*******************************************"
        
        puts "Press enter to go back to the user menu."
        
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"

        user_menu
    end

    def favorite_styles
        puts "This will show you your favorite beer styles based on how many of that style you've favorited."
        puts "Please enter how many styles you'd like to view:"

        puts "*******************************************"
        input = gets.chomp.to_i
        puts "*******************************************"

        @@current_user.most_popular_styles(input)
        puts "*******************************************"
        
        puts "Press enter to go back to the user menu."
        
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"

        user_menu
    end

    def favorite_categories
        puts "This will show you your favorite beer categories based on how many of that category you've favorited."
        puts "Please enter how many categories you'd like to view:"
        
        puts "*******************************************"
        input = gets.chomp.to_i
        puts "*******************************************"

        @@current_user.most_popular_categories(input)
        puts "*******************************************"

        puts "Press enter to go back to the user menu."
        
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"

        user_menu
    end

    def abv
        @@current_user.average_abv
        puts "*******************************************"

        puts "Press enter to go back to the user menu."
        
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"

        user_menu
    end

    def delete_user
        puts "Are you sure? This action is not reversible. Enter 'Natty Light is the king of beers' to continue."
        puts "*******************************************"
        input = gets.chomp
        if input == "Natty Light is the king of beers"
            puts "*******************************************"
            puts "We're going to quote you on that. Adios!"
            puts "*******************************************"
            @@current_user.favorites.destroy_all
            @@current_user.destroy
            puts "Press enter to continue."
            gets.chomp
            CLI.new.welcome
        else
            puts "*******************************************"
            puts "We knew you couldn't quit us."
            puts "*******************************************"
            puts "Press enter to go back to the user menu."
            puts "*******************************************"
            gets.chomp
            user_menu
        end
    end

    def new_account
        puts "Please enter your user name and your account will be created."
        puts "*******************************************"
        input = gets.chomp
        
        if User.all.find_by(name: input)
            puts "*******************************************"
            puts "That user name is already taken! Please enter a different user name."
            puts "Press enter to continue."
            puts "*******************************************"
            gets.chomp
            puts "*******************************************"
            new_account
        else
            @@current_user = User.create(name: input)
            puts "*******************************************"
            user_menu
        end
    end

    def explore
        puts "Please enter any of the following commands:"
        puts "View the most popular beers: enter 1"
        puts "View the most popular categories: enter 2"
        puts "View the most popular styles: enter 3"
        puts "Go back to the welcome menu: enter 4"
        puts "*******************************************"
        input = gets.chomp

        case input
        when "1"
            puts "*******************************************"
            puts "How many popular beers would you like to see? Enter a number: "
            puts "*******************************************"
            beer_num = gets.chomp.to_i
            puts "*******************************************"
            Beer.most_popular(beer_num)
            puts "*******************************************"
            puts "Press enter to go back to the explore menu."
            puts "*******************************************"
            input = gets.chomp
            explore
        when "2"
            puts "*******************************************"
            puts "How many popular categories would you like to see? Enter a number: "
            puts "*******************************************"
            cat_num = gets.chomp.to_i
            puts "*******************************************"
            Category.most_popular(cat_num)
            puts "*******************************************"
            puts "Press enter to go back to the explore menu."
            puts "*******************************************"
            gets.chomp
            explore
        when "3"
            puts "*******************************************"
            puts "How many popular styles would you like to see? Enter a number: "
            puts "*******************************************"
            style_num = gets.chomp.to_i
            puts "*******************************************"
            Style.most_popular(style_num)
            puts "*******************************************"
            puts "Press enter to go back to the explore menu."
            puts "*******************************************"
            gets.chomp
            explore
        when "4"
            welcome
        else
            puts "*******************************************"
            puts "Please enter a valid command."
            puts "*******************************************"
            explore 
        end
    end

    def welcome
        puts "*******************************************"
        puts "Welcome to (insert app name here)! Please type 1 to log in, 2 to create a new account, 3 to explore data, or 4 to quit."
        puts "*******************************************"
        input = gets.chomp
        puts "*******************************************"

        case input
        when "1"
            log_in
        when "2"
            new_account
        when "3"
            explore
        when "4"
            quit
        else
            puts "Please enter a valid command."
            welcome
        end
    end

    def quit
    end
end