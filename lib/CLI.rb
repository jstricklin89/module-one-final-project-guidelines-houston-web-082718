require 'pry'

class CLI

    @@current_user = nil
    @@input = nil

    def log_in
        puts "Please enter your name."
        puts "*************************"
        @@input = gets.chomp
        puts "*************************"
        @@current_user = User.all.find_by(name: @@input)
        user_menu
    end

    def user_menu
        puts "Welcome, #{@@current_user.name}. What would you like to do?"
        puts "Please enter any of the following commands:"
        puts "Add new favorite: enter 1"
        puts "View your favorite beers: enter 2"
        puts "View your favorite breweries: enter 3"
        puts "View your favorite beer styles: enter 4"
        puts "View your favorite beer categories: enter 5"
        puts "View the average ABV of your favorite beers: enter 6"
        puts "Log out: enter 7"
        puts "*************************"
        @@input = gets.chomp
        puts "*************************"

        case @@input
        when "1"
            new_favorite
        when "2"
            favorite_beers
        when "3"
            favorite_breweries
        when "4"
            favorite_styles
        when "5"
            favorite_categories
        when "6"
            abv
        when "7"
            welcome
        end
    end

    def new_favorite
        puts "Please enter the beer ID of the beer you'd like to add to your favorites."
        puts "*************************"
        input = gets.chomp
        puts "*************************"
        @@current_user.add_favorite(input)
        
        puts "Press any key + enter to go back to the user menu."
        
        puts "*************************"
        input = gets.chomp
        puts "*************************"
        user_menu
    end

    def favorite_beers
        @@current_user.favorite_beer_names
        puts "*************************"
        
        puts "Press any key + enter to go back to the user menu."
        
        puts "*************************"
        input = gets.chomp
        puts "*************************"
        user_menu
    end

    def favorite_breweries
        puts "This will show you your favorite breweries based on how many of their beers you've favorited."
        puts "Please enter how many breweries you'd like to view:"
        
        puts "*************************"
        input = gets.chomp.to_i
        puts "*************************"
        
        @@current_user.most_popular_breweries(input)
        puts "*************************"
        
        puts "Press any key + enter to go back to the user menu."
        
        puts "*************************"
        input = gets.chomp
        puts "*************************"

        user_menu
    end

    def favorite_styles
        puts "This will show you your favorite beer styles based on how many of that style you've favorited."
        puts "Please enter how many styles you'd like to view:"

        puts "*************************"
        input = gets.chomp.to_i
        puts "*************************"

        @@current_user.most_popular_styles(input)
        puts "*************************"
        
        puts "Press any key + enter to go back to the user menu."
        
        puts "*************************"
        input = gets.chomp
        puts "*************************"

        user_menu
    end

    def favorite_categories
        puts "This will show you your favorite beer categories based on how many of that category you've favorited."
        puts "Please enter how many categories you'd like to view:"
        
        puts "*************************"
        input = gets.chomp.to_i
        puts "*************************"

        @@current_user.most_popular_categories(input)
        puts "*************************"

        puts "Press any key + enter to go back to the user menu."
        
        puts "*************************"
        input = gets.chomp
        puts "*************************"

        user_menu
    end

    def abv
        @@current_user.average_abv
        puts "*************************"

        puts "Press any key + enter to go back to the user menu."
        
        puts "*************************"
        input = gets.chomp
        puts "*************************"

        user_menu
    end

    def new_account
    end

    def explore
    end

    def invalid_input
    end

    def welcome
        puts "Welcome to (insert app name here)! Please type 1 to log in, 2 to create a new account, 3 to explore data, or 4 to quit."
        puts "*************************"
        input = gets.chomp
        puts "*************************"

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
            invalid_input
        end
    end

    def quit
    end
end