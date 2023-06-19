class SchoolsController < ApplicationController
    def new
        new = School.new
    end

    def index
        schools = School.all
        if schools.empty?
            render json:{
                message: "No school details found"
            }, status: 404
        else
            render json:{
                message: "School Details found",
                school: schools
            }, status: 200
        end
    end

    def show
        school = set_school
        if school
            render json:
            {
                message: "School found",
                school: school
            }, status: 200
        else
            render json:{
                message: "No details found"
            }, status: 404
        end
    end

    def edit
    end

    def update
        school = set_school
        if school.update(school_params)
            render json:
            {
                message: "School details updated successfully",
                school: school
            }, status: 200
        else
            render json:
            {
                message: "School details not updated"
            }, status: 400
        end
    end

    def create
        school = School.create(school_params)
        if school.save
            render json:{
                message: "New school details created",
                school: school
            }, status: 201
        else
            render json:{
                message: "Details couldn't Create"
            }, status: 400
        end
    end

    def destroy
        school = set_school

        if school
            render json:{
                message: "School deleted Successfully",
                school: school
            }, status: 200
        else
            render json:{
                message: "School not deleted!"
            }, status: 400
        end
    end


    private
    def set_school
        school = School.find_by(id: params[:id])
        if school
            return school
        end
    end

    def school_params
        params.require(:school).permit(:school_name, :place)
    end
end
