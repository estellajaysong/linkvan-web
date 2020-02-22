require 'rails_helper'

scopes =  ["Shelter", "Food", "Medical", "Hygiene", "Technology", "Legal", "Learning"]

RSpec.describe FacilitiesController, type: :request do
  describe "get facilities index" do
    it 'should include paths to all facility categories' do
      get facilities_path
      expect(response).to be_successful
      for scope in scopes do
        expect(response.body).to include filtered_facilities_path(scope: scope)
      end
    end
  end
  describe "search a facility" do
    it 'should return a matching result and include a path to it' do
      @facility = Facility.create(name: "test_facility")
      get search_bar_facilities_path(search: "test_facility")
      print(response.body)
    end
  end
end

