require 'rails_helper'

RSpec.describe SchoolsController, type: :request do
  describe "GET /schools" do
    it "returns a list of schools" do
      school = School.create(name: "Vidya mandir", place: "Dubai")
      get "/schools"
      expect(response).to have_http_status(200)
    end

    it "return a 'No school details found' message if no school exist" do
      get "/schools"
      expect(response).to have_http_status(404)
    end
  end

  describe "Get /school/:id" do
    it "returns a specific school details" do
      school = School.create(name: "Vidya Maha Mandir", place: "Italy")
      get "/school/#{school.id}"
      expect(response).to have_http_status(200)
    end

    it "returns a no school details found" do
      get "/school/invalid_id"
      expect(response).to have_http_status(404)
    end
  end

  describe "Post/school" do
    it "creates a new school with valid params" do
      params = {name: "Ghnana nilaya", place: "Bagalkot"}
      post "/school", params: {school: params}
      expect(response).to have_http_status(201)
    end
  end

  describe "Put/school/:id" do

    it "updates the details of a specific school" do
      school = School.create(name:"sdfghj", place: "xcvbn")
      params = {name: "BGS", place: "Bangalore"}
      put "/school/#{school.id}", params: {school: params}
      expect(response).to have_http_status(200)
      updated_school = School.find(school.id)
    end
  end
  describe "Destroy /school/:id" do

    it "Deletes the details of a specific school" do
      school = School.create(name: "zxcfvghjkl", place: "dfghj")
      delete "/school/#{school.id}"
      expect(response).to have_http_status(200)
    end
  end
end