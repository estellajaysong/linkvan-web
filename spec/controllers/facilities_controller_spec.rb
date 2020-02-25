require 'rails_helper'

# Start with clean test db
Facility.destroy_all

facilities = [
    facility1 = Facility.create!(name: "Facility 1",
                                 welcomes: " Female Transgender",
                                 services: " Hygiene Medical",
                                 lat: 0.367508424e2,
                                 long: -0.9596592679999999e2,
                                 address: "Vancouver",
                                 phone: "",
                                 website: "",
                                 description: nil,
                                 notes: "",
                                 created_at: "2020-02-22 18:43:24",
                                 updated_at: "2020-02-22 21:03:15",
                                 startsmon_at: "2000-01-01 10:42:00",
                                 endsmon_at: "2000-01-01 10:42:00",
                                 startstues_at: "2000-01-01 10:42:00",
                                 endstues_at: "2000-01-01 10:42:00",
                                 startswed_at: "2000-01-01 10:42:00",
                                 endswed_at: "2000-01-01 10:42:00",
                                 startsthurs_at: "2000-01-01 10:42:00",
                                 endsthurs_at: "2000-01-01 10:42:00",
                                 startsfri_at: "2000-01-01 10:42:00",
                                 endsfri_at: "2000-01-01 10:42:00",
                                 startssat_at: "2000-01-01 10:42:00",
                                 endssat_at: "2000-01-01 10:42:00",
                                 startssun_at: "2000-01-01 10:42:00",
                                 endssun_at: "2000-01-01 10:42:00",
                                 r_pets: false,
                                 r_id: false,
                                 r_cart: false,
                                 r_phone: false,
                                 r_wifi: false,
                                 startsmon_at2: "2000-01-01 10:42:00",
                                 endsmon_at2: "2000-01-01 10:42:00",
                                 startstues_at2: "2000-01-01 10:42:00",
                                 endstues_at2: "2000-01-01 10:42:00",
                                 startswed_at2: "2000-01-01 10:42:00",
                                 endswed_at2: "2000-01-01 10:42:00",
                                 startsthurs_at2: "2000-01-01 10:42:00",
                                 endsthurs_at2: "2000-01-01 10:42:00",
                                 startsfri_at2: "2000-01-01 10:42:00",
                                 endsfri_at2: "2000-01-01 10:42:00",
                                 startssat_at2: "2000-01-01 10:42:00",
                                 endssat_at2: "2000-01-01 10:42:00",
                                 startssun_at2: "2000-01-01 10:42:00",
                                 endssun_at2: "2000-01-01 10:42:00",
                                 open_all_day_mon: false,
                                 open_all_day_tues: false,
                                 open_all_day_wed: false,
                                 open_all_day_thurs: false,
                                 open_all_day_fri: false,
                                 open_all_day_sat: false,
                                 open_all_day_sun: false,
                                 closed_all_day_mon: false,
                                 closed_all_day_tues: false,
                                 closed_all_day_wed: false,
                                 closed_all_day_thurs: false,
                                 closed_all_day_fri: false,
                                 closed_all_day_sat: false,
                                 closed_all_day_sun: false,
                                 second_time_mon: false,
                                 second_time_tues: false,
                                 second_time_wed: false,
                                 second_time_thurs: false,
                                 second_time_fri: false,
                                 second_time_sat: false,
                                 second_time_sun: false,
                                 user_id: 1,
                                 verified: true,
                                 shelter_note: "",
                                 food_note: "",
                                 medical_note: "",
                                 hygiene_note: "",
                                 technology_note: "",
                                 legal_note: "",
                                 learning_note: "",
                                 zone_id: nil)
]


scopes =  ['Shelter', 'Food', 'Medical', 'Hygiene', 'Technology', 'Legal', 'Learning']

RSpec.describe FacilitiesController, type: :request do
  describe 'get facilities index' do
    it 'should include paths to all facility categories' do
      get facilities_path
      expect(response).to be_successful
      for scope in scopes do
        expect(response.body).to include filtered_facilities_path(scope: scope)
      end
    end
  end
  describe 'search a facility' do
    it 'should return a matching result and include a path to it' do
      get search_bar_facilities_path(search: 'Facility 1')
      expect(response.body).to include facility_path(id: facility1.id)
    end
  end
    describe "click a category" do
    it "should show a list of existing facilities" do
        get filtered_facilities_path(scope: "Hygiene")
    end
  end
  describe 'click on a facility' do
    it 'should show facility details' do
      get facility_path(id: facility1.id)
      details = ['<h2>Welcomes</h2>', ]
      expect(response.body).to include 
    end
  end
end

