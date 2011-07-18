require 'spec_helper'

describe "messages/new.html.erb" do
  before(:each) do
    assign(:message, stub_model(Message,
      :sender => 1,
      :receiver => 1,
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "input#message_sender", :name => "message[sender]"
      assert_select "input#message_receiver", :name => "message[receiver]"
      assert_select "textarea#message_content", :name => "message[content]"
    end
  end
end
