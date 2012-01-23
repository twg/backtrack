module Backtrack::Extensions::ActionView
  def backtrack_fields
    self.backtrack_stack.collect do |backtrack_path|
      hidden_field_tag("#{Backtrack.backtrack_param}[]", backtrack_path)
    end.join('')
  end
end
