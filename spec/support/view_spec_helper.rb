module ViewSpecHelper
  module ControllerViewHelpers
    def current_user
    end
  end

  def initialize_view_helpers(view)
    view.extend ControllerViewHelpers
  end
end
