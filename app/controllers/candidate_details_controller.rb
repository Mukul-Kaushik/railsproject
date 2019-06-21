class CandidateDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate_detail, only: [:show, :edit, :update, :destroy]

  def index
    @candidate_details = CandidateDetail.all
  end
  def show
  end
  def new
    @candidate_detail = CandidateDetail.new
  end
  def edit
  end
  def create
    @candidate_detail = CandidateDetail.new(candidate_detail_params)
    respond_to do |format|
      if @candidate_detail.save
        format.html { redirect_to @candidate_detail, notice: 'Candidate detail was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_detail }
      else
        format.html { render :new }
        format.json { render json: @candidate_detail.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @candidate_detail.update(candidate_detail_params)
        format.html { redirect_to @candidate_detail, notice: 'Candidate details was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_detail }
      else
        format.html { render :edit }
        format.json { render json: @candidate_detail.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @candidate_detail.destroy
    respond_to do |format|
      format.html { redirect_to candidate_details_url, notice: 'Candidate details was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  private
    def set_candidate_detail
      @candidate_detail = CandidateDetail.find(params[:id])
    end
    def candidate_detail_params
      params.require(:candidate_detail).permit(:s_no, :src_reg, :zone, :DOR, :reg_no, :name, :gender, :age, :address, :branch, :email, :contact_no, :state, :qualification, :specialization, :experience, :remarks_mobility, :DOC, :status)
    end
end
