module Backtrack
  # == Submodules ===========================================================
  
  autoload(:Extensions, 'backtrack/extensions')
  
  # == Constants ============================================================
  
  BACKTRACK_PARAM = :_back
  
  # == Module Methods =======================================================
  
  def self.install!
    ActionController::Base.send(:include, Backtrack::Extensions::ActionController)

    ActionView::Base.send(:include, Backtrack::Extensions::ActionView)
  end
  
  def self.backtrack_param
    @backtrack_param ||= BACKTRACK_PARAM
  end
  
  def self.backtrack_param=(value)
    @backtrack_param = value
  end
  
  def self.default_path
    @default_path
  end

  def self.default_path=(value)
    @default_path = value
  end
end
