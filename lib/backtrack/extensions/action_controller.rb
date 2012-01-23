module Backtrack::Extensions::ActionController
  def self.included(base)
    base.send(:helper_method, :backtrack_params)
    base.send(:helper_method, :backtrack_path)
    base.send(:helper_method, :backtrack_stack)
  end
  
  def backtrack_stack
    [
      request.request_uri,
      (
        params[Backtrack.backtrack_param] or
          request.referrer or
          Backtrack.default_path or
          root_path
      )
    ].flatten
  end
  
  def backtrack_path
    self.backtrack_stack[1]
  end

  def backtrack_params(params = nil)
    _params = {
      Backtrack.backtrack_param => backtrack_path
    }
  
    params ? _params.merge(params) : _params
  end
end
