require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "GET /index" do
    it "returns all the students details" do
      school = School.create(name:"sdfghj", place: "xcvbn")
      branch = Branch.create(stream: "biology", school_id: school.id)
      student = Student.create(name: "George",email: "geog566@gmail.com", gender: "Male",school_id: school.id, branch_id: branch.id)
      get "/students"
      expect(response).to have_http_status(200)
    end

    it "returns a 'No student details found' error message" do
      get "/students"
      expect(response).to  have_http_status(404)
    end
  end

  describe "Get /show" do
    it "returns specific details of student" do
      school = School.create(name:"sdfghj", place: "xcvbn")
      branch = Branch.create(stream: "biology", school_id: school.id)
      student = Student.create(name: "George",email: "geog566@gmail.com", gender: "Male",school_id: school.id, branch_id: branch.id)
      get "/student/#{student.id}"
      expect(response).to  have_http_status(200)
    end

    it "returns a error message when specific student not found" do
      get "/students/invalid_id"
      expect(response).to have_http_status(404)
    end
  end

  describe "Post /student" do
    it "Creates new student details" do
      school = School.create(name:"sdfghj", place: "xcvbn")
      branch = Branch.create(stream: "biology", school_id: school.id)
      params = {name: "sdfgh", email: "sdfgh@gmai.com", gender: "Male", school_id: school.id, branch_id: branch.id}
      post "/student", params: {student: params}
      expect(response).to  have_http_status(201)
    end
    it "Returns an error when creating a new student details" do
      params = {name: "sdfgh", email: "sdfgh@gmai.com", gender: "Male"}
      post "/student", params: {student: params}
      expect(response).to have_http_status(400)
  end
  end

  describe "PUT /student/:id" do
    it "Updates a specific student details" do
      school = School.create(name:"sdfghj", place: "xcvbn")
      branch = Branch.create(stream: "biology", school_id: school.id)
      student = Student.create(name: "sdfgh", email: "sdfgh@gmai.com", gender: "Male", school_id: school.id, branch_id: branch.id)
      params = {name: "dfghjk", email: "sdfgh@gmai.com", gender: "Male", school_id: school.id, branch_id: branch.id}
      put "/student/#{student.id}", params: {student: params}
      expect(response).to  have_http_status(200)
    end
  end

  describe "DELETE /student/:id" do
    it "deletes a specific student details" do
      school = School.create(name:"sdfghj", place: "xcvbn")
      branch = Branch.create(stream: "biology", school_id: school.id)
      student = Student.create(name: "sdfgh", email: "sdfgh@gmai.com", gender: "Male", school_id: school.id, branch_id: branch.id)
      delete "/student/#{student.id}"
      expect(response).to  have_http_status(200)
    end

    it "returns an error message when student details not found" do
      delete "/student/1"
      expect(response).to  have_http_status(404)
    end
  end
end
