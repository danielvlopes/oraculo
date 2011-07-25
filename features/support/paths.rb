module NavigationHelpers

  def signup_page
    "/users/sign_up"
  end

  def signin_page
    "/users/sign_in"
  end

  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the members list page/
      '/members'
    when /the new question page/
      new_question_path
    when /the questions page/
      questions_path
    when /the sign in page/
      new_user_session_path
    when /the sign out page/
      destroy_user_session_path
    when /the message page/
      '/messages/1'
    when /the new private message page/
      new_message_path
    when /the private inbox page/
      visit messages_path
    when /the main page/
      root_path
    when /the profile page/
      edit_user_registration_path

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
