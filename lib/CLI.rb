class CLI

    @@current_user = nil
    @@input = nil

    def log_in
        puts "Please enter your name."
        @@input = gets.chomp
        
        @@current_user = User.all.find_by(name: @@input)
        user_menu
    end

    def user_menu
        puts "Welcome, #{@@current_user.name}. What would you like to do?"
        puts "Please enter any of the following commands:"
        puts "Add new favorite: enter 1"
        puts "View favorites: enter 2"
        puts "View your favorite breweries: enter 3"
        puts "View your favorite beer styles: enter 4"
        puts "View your favorite beer categories: enter 5"
        puts "View the average ABV of your favorite beers: enter 6"
        puts "Log out: enter 7"
        @@input = gets.chomp
    end

    def new_favorite
        puts "Please enter the beer ID of the beer you'd like to add to your favorites."
        input = gets.chomp
        @@current_user.add_favorite(input)
    end

    def new_account
    end

    def explore
    end

    def invalid_input
    end

    def welcome
        puts "Welcome to (insert app name here)! Please type 1 to log in, 2 to create a new account, or 3 to explore data."
        input = gets.chomp

        if input == "1"
            log_in
        elsif input == "2"
            new_account
        elsif input == "3"
            explore
        else
            invalid_input
        end
    end
end