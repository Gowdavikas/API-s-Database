require 'rails_helper'

RSpec.describe BranchesController, type: :request do

    describe "GET /branches" do
        it "returns all branch details" do
           school = School.create(name: "Vidya Maha Mandir", place: "Italy")
           branch = Branch.create(stream: "biology", school_id: school.id)
           get "/branches"
           expect(response).to have_http_status(200)
        end

        it "returns a 'No branches found' message if no branches exist" do
           branch = Branch.create(stream: "biology", school_id: 4)
           get "/branches"
           expect(response).to have_http_status(404)
        end
    end

    describe "Get /branches/:id" do
        it "returns a specific branch details" do
            school = School.create(name: "Vidya Maha Mandir", place: "Italy")
            branch = Branch.create(stream: "biology", school_id: school.id)
            get "/branch/#{branch.id}"
            expect(response).to have_http_status(200)
        end

        it "returns a error message when specific branch not found" do
            get "/branch/invalid_id"
            expect(response).to have_http_status(404)
          end
    end

    describe "Post /branch" do
        it "Creates new branch" do
            school = School.create(name:"sdfghj", place: "sdfghj")
            params = {stream: "jagsv", school_id: school.id}
            post "/branch", params:{branch: params}
            expect(response).to have_http_status(400)
        end
        it "Returns an error when creating a new branch details" do
            params = {stream: "biology"}
            post "/branch", params: {branch: params}
            expect(response).to have_http_status(400)
        end
    end

    describe "Put /branch/:id" do
        it "Updates the specific branch detils" do
            school = School.create(name:"sdfghj", place: "xcvbn")
            branch = Branch.create(stream: "dfg", school_id: school.id)
            params = {stream: "update_stream"}
            put "/branch/#{branch.id}", params: {branch: params}
            expect(response).to have_http_status(200)
        end
    end

    describe "Delete /branch/:id" do
        it "Deletes a specific branch detail" do
            school = School.create(name:"sdfghj", place: "xcvbn")
            branch = Branch.create(stream: "dfg", school_id: school.id)
            delete "/branch/#{branch.id}"
            expect(response).to have_http_status(200)
        end
    end
end
