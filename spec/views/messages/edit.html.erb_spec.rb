require 'spec_helper'

describe "messages/edit.html.erb" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :sender => 1,
      :receiver => 1,
      :content => "MyText"
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_sender", :name => "message[sender]"
      assert_select "input#message_receiver", :name => "message[receiver]"
      assert_select "textarea#message_content", :name => "message[content]"
    end
  end
end
