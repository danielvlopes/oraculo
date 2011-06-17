module QuestionsHelper

  def actions_for_question(question)
    return unless question.owner == current_user

    html = []
    html << link_to("Edit", [:edit, question])
    html << link_to_destroy("Delete", question)
    content_tag :span, html.join(" | ").html_safe, class: "questioActions"
  end

end
