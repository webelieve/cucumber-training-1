Given /^I am on the login page$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.login? #check for existence
    end
  end
end

Given /^I can visit the Movies page from any page$/ do
  %w(Theaters Login).each do |page_name|
    visit page_name do |page|
      page.view_movies
      on(Movies).movie_list_element.when_present(10) #verify we are on the movies page
    end
  end
end

Given /^I can visit the Theaters page from any page$/ do
  %w(Movies Login).each do |page_name|
    visit page_name do |page|
      page.view_theaters
      on(Theaters).theater_list_element.when_present(10) #verify we are on the movies page
    end
  end
end

When(/^I select a showtime to go to$/) do
  # view first showtime on movies page
  # select first showtime on the movie showtimes page
  # verify that we are on the showtime info page
  visit(Movies).view_first_movie_showtimes
  on(MovieShowtimes).select_first_showtime
  on(ShowtimeInfo).should_contain_text 'Showtime info'
end