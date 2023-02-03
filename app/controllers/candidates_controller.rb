class CandidatesController < ApplicationController

  before_action :find_candidate , except: [:new , :create , :index]

        # 或 only: [:show , :edit , :update , :destroy , :vote]                          
  def index
    # @candidates = Candidate.all
    @candidates = Candidate.young_people
  end

  def new
    @candidate = Candidate.new
  end

  def create
    # clean_params = params.require(:candidate).permit(:name , :party , :age , :politics )
    @candidate = Candidate.new(candidate_params)

 
   if @candidate.save
    #  flash[:notice] = "Candidate created !"
     redirect_to "/candidates" , notice: "Candidate created !"
   else
     #NG
     render :new
   end
  end

  def show
  end

  def edit
  end

  def update

    if @candidate.update(candidate_params)
      # flash[:notice] = "Candidate updated !"
      redirect_to "/candidates" , notice: "Candidate updated !"
    else
      #NG
      render :edit
    end
  end

  def destroy

    @candidate.destroy

    # flash[:notice] = "Candidate deleted !"
      redirect_to "/candidates" , notice: "Candidate deleted !"
  end

  def vote

    #  VoteLog.create(candidate: @candidate , ip_address: request.remote_ip)

    @candidate.vote_logs.create(ip_address: request.remote_ip)
    

    # @candidate.votes = @candidate.votes + 1
    # @candidate.increment(:votes)
    # @candidate.save

    # flash[:notice] = "Voted !"
    #  VoteMailer.vote_notify('eric00471@gmail.com').deliver
    VoteMailJob.perform_later

      redirect_to "/candidates", notice: "Voted !"
  end



  private
  def candidate_params
    params.require(:candidate).permit(:name , :party , :age , :politics )
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
#測試git 的功能
