module Support
  module Helpers

    def user_factory(attributes = {})
      User.create!({
        name: "Jonh",
        email: "jonh@me.com",
        password: "123456",
        password_confirmation: "123456"
      }.merge(attributes))
    end

    def answer_factory(attributes = {})
      Answer.create!({
        body: "You should do this ..."
      }.merge(attributes))
    end

    def question_factory(attributes = {})
      Question.create!({
        title: "How to do this?",
        body: "Lorem..."
      }.merge(attributes))
    end

    def login_and_return_user(attributes = {})
      @logged_user ||= User.create!({
        name: "Jonh",
        email: "jonh@gmail.com",
        password: "123456",
        password_confirmation: "123456"
      }.merge(attributes))

      login_as_user(@logged_user)
      @logged_user
    end

    def login_as_user(user)
      request.env['warden'] = mock(Warden, authenticate: user, authenticate!: user)
    end

  end
end
