class BranchesController < ApplicationController

    def index
        branches = Branch.all
        if branches.empty?
            render json:{
                message: "No branches found"
            }, status: 404
        else
            render json:{
                message: "Braches found",
                branch: branches
            }, status: 200
        end
    end

    def show
        branch = set_branch
        if branch
            render json:
            {
                message: "Branch found",
                branch: branch
            }, status: 200
        else
            render json:{
                message: "Branch not found"
            }, status: 404
        end
    end

    def create
        branch = Branch.create(branch_params)
        if branch.save
            render json:
            {
                message: "Branch created successfully",
                branch: branch
            }, status: 201
        else
            render json:
            {
                message: "Branch failed to create"
            }, status: 400
        end
    end

    def update
        branch = set_branch
        if branch.update(branch_params)
            render json:
            {
                message: "Branch updated successfully",
                branch: branch
            }, status: 200
        else
            render json:
            {
                message: "Branch not updated"
            }, status: 400
        end
    end

    def destroy
        branch = set_branch
        if branch.delete
            render json:{
                message: "Branch deleted successfully",
                branch: branch
            }, status: 200
        else
            render json:
            {
                message: "Branch not deleted"
            }, status: 400
        end
    end

    private
    def set_branch
        branch = Branch.find_by(id: params[:id])
        if branch
            return branch
        end
    end

    def branch_params
        params.require(:branch).permit(:stream)
    end

end
