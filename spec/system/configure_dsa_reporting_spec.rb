# frozen_string_literal: true

describe "Configure DSA reporting" do
  fab!(:admin)

  let(:settings_page) { PageObjects::Pages::AdminSiteSettings.new }
  let(:upcoming_changes_page) { PageObjects::Pages::AdminUpcomingChanges.new }

  before { sign_in(admin) }

  it "shows DSA configuration while its conceptual upcoming change stays hidden" do
    settings_page.visit("dsa")

    expect(settings_page).to have_search_result("dsa_notice_group")
    expect(settings_page).to have_search_result("dsa_community_rules")
    expect(settings_page).to have_search_result("dsa_moderation_appeal_email")
    expect(settings_page).to have_no_search_result("dsa_reporting_enabled")

    upcoming_changes_page.visit

    expect(upcoming_changes_page).to have_no_change(:dsa_reporting_enabled)
  end
end
