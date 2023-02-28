class UserSearchesController < ApplicationController
  before_action :set_user_search, only: %i[show edit update destroy]

  # GET /user_searches or /user_searches.json
  def index
    @user_searches = UserSearch.where(user_id: current_user.id)
  end

  # GET /user_searches/1 or /user_searches/1.json
  def show; end

  # GET /user_searches/new
  def new
    @user_search = UserSearch.new
  end

  # GET /user_searches/1/edit
  def edit; end

  # POST /user_searches or /user_searches.json
  def create
    @user_search = UserSearch.new(user_search_params)

    respond_to do |format|
      if @user_search.save
        format.html { redirect_to user_search_url(@user_search), notice: 'User search was successfully created.' }
        format.json { render :show, status: :created, location: @user_search }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_searches/1 or /user_searches/1.json
  def update
    respond_to do |format|
      if @user_search.update(user_search_params)
        format.html { redirect_to user_search_url(@user_search), notice: 'User search was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_search }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_searches/1 or /user_searches/1.json
  def destroy
    @user_search.destroy

    respond_to do |format|
      format.html { redirect_to user_searches_url, notice: 'User search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_search
    @user_search = UserSearch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_search_params
    params.require(:user_search).permit(:make, :model, :year_from, :year_to, :price_from, :price_to, :user_id,
                                        :date_search)
  end
end
