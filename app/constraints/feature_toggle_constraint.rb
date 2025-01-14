# frozen_string_literal: true

require "open_food_network/feature_toggle"

class FeatureToggleConstraint
  def initialize(feature_name)
    @feature = feature_name
  end

  def matches?(request)
    OpenFoodNetwork::FeatureToggle.enabled?(@feature, current_user(request))
  end

  def current_user(request)
    request.env['warden']&.user
  end
end
