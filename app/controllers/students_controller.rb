class StudentsController < ApplicationController

    def index
        students = Student.all
        if students.empty?
            render json:
            {
                message: "No student details found"
            }, status: 404
        else
            render json:
            {
                message: "Student details found",
                student: students 
            }, status: 200
        end
    end

    def show
        student = set_student
        if student
            render json:{
                message: "Student Found",
                student: student
            }, status: 200
        else
            render json:
            {
                message: "No student found"
            }, status: 404
        end
    end

    def create
        student = Student.create(student_params)
        if student.save
            render json:
            {
                message: "Student Created successfully",
                student: student
            }, status: 201
        else
            render json:
            {
                message: "Student not created",
                error: student.errors.full_messages
            }, status: 400
        end

    end

    def update
        student = set_student
        if student.update(student_params)
            render json:
            {
                message: "Student updated successfully",
                student: student
            }, status: 200
        else
            render json:
            {
                message: "Student failed to update"
            },status: 400
        end 
    end

    def destroy
        student = set_student
        if student.present?
            student.delete
            render json:
            {
                message: "Student deleted successfully",
                student: student
            }, status: 200
        else
            render json:
            {
                message: "Student failed to delete"
            }, status: 404
        end
    end

     def search
        search = params[:search].to_s
        students = Student.where("name like ? OR email like ?", "%#{search}", "%#{search}")
        if students.empty?
            render json:
            {
                message: "No student details found"
            }, status: 404
        else
            render json:
            {
                message: "Student details found",
                student: students 
            }, status: 200
        end
    end

    private
    def set_student
        student = Student.find_by(id: params[:id])
        if student
            return student
        end
    end

    def student_params
        params.require(:student).permit(:name, :email, :gender, :school_id, :branch_id)
    end
end
