class PostTagsController < ApplicationController
  before_action :set_post_tag, only: %i[ show edit update destroy ]

  # GET /post_tags or /post_tags.json
  def index
    @post_tags = PostTag.all
  end

  # GET /post_tags/1 or /post_tags/1.json
  def show
  end

  # GET /post_tags/new
  def new
    @post_tag = PostTag.new
  end

  # GET /post_tags/1/edit
  def edit
  end

  # POST /post_tags or /post_tags.json
  def create
    @post_tag = PostTag.new(post_tag_params)

    respond_to do |format|
      if @post_tag.save
        format.html { redirect_to @post_tag, notice: "Post tag was successfully created." }
        format.json { render :show, status: :created, location: @post_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_tags/1 or /post_tags/1.json
  def update
    respond_to do |format|
      if @post_tag.update(post_tag_params)
        format.html { redirect_to @post_tag, notice: "Post tag was successfully updated." }
        format.json { render :show, status: :ok, location: @post_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_tags/1 or /post_tags/1.json
  def destroy
    @post_tag.destroy!

    respond_to do |format|
      format.html { redirect_to post_tags_path, status: :see_other, notice: "Post tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_tag
      @post_tag = PostTag.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_tag_params
      params.expect(post_tag: [ :title ])
    end
end
