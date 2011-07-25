atom_feed do |feed|
	feed.title("Oraculo Questions Feed")
	feed.subtitle("Knowledge makes us accountable")
	@questions.each do |question|
		next if question.updated_at.blank?
		feed.updated(@questions.first.updated_at)
		feed.entry(question) do |entry|
			entry.title(question.title)
			entry.content(truncate(question.body, :length => 150, :omission => link_to("[...]", question)), :type => 'html')
		end
	end
end
