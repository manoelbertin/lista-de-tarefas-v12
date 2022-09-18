class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[ update destroy ]

  # GET /assignments or /assignments.json
  def index
    @assignments = Assignment.order created_at: :desc
  end

  # POST /assignments or /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to assignments_url }
        # format.html { redirect_to assignment_url(@assignment), notice: "Assignment was successfully created." }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    @assignment.resolved = !@assignment.resolved
    @assignment.save

    redirect_to assignments_url
  end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy

    redirect_to assignments_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_params
      params.require(:assignment).permit(:description, :resolved)
    end
end
