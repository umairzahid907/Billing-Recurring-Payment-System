# frozen_string_literal: true

module FeatureHelper
  def get_usage(feature, user)
    Usage.where(feature: feature, user: user).first
  end
end
