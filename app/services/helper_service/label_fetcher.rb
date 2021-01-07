# frozen_string_literal: true

module HelperService
  # Label Fetcher
  class LabelFetcher < ApplicationService
    attr_reader :labels, :user, :kind

    def initialize(user, kind)
      super()
      @labels = {}
      @user = user
      @kind = kind
    end

    def execute
      handle_kind
      format_result(@labels, nil)
    end

    private

    def handle_kind
      case @kind
      when 'sign-up' then profile_labels
      end
    end

    def profile_labels
      @labels[:genders] = Profile.gender_select
    end
  end
end
