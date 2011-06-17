module ApplicationHelper

  def flash_messages(options = {})
    options.reverse_merge!({ :tag => :p, :id => "flashMessage" })

    flash.collect do |key, msg|
      content_tag( options[:tag], msg, id: options[:id], class: key )
    end.join.html_safe
  end

  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def submit_button(text = "Save", options = {})
    options.reverse_merge!(:class => 'submit', :disable_with => "Wait...")
    submit_tag(text, options)
  end

  def link_to_cancel(url = :back, text = "Cancel", options = {})
    options.reverse_merge!(:class => 'cancel')
    link_to text, url, options
  end

  def link_to_destroy(text, destination, options = {})
    options.reverse_merge!(:confirm => "Are you sure?", :method => :delete)
    link_to text, destination, options
  end  

  def body_css_id
    controller_name.camelize :lower
  end

  def clearfix
    content_tag :div, "", :class => "clearfix"
  end

end
