class PagesController < ApplicationController

  layout 'admin' # replaces application.html.erb

  before_action :confirm_logged_in

  # find current subject
  before_action :find_subject

  # Instead fo using   @subjects = Subject.sorted   in each of the actions
  # new, create, edit, update, can set before_action. It does, however, create
  # a dateabase call at start of create/update instead of later
  before_action :set_page_count, :only => [:new, :create, :edit, :update]

  def index
    # @pages = Page.sorted # will sort by position, can use Page.all as well
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
    # @page_count = Page.count + 1  used here thru :set_page_count with the += 1
  end

  def create
    # @subjects = Subject.sorted    is called here with before_action
    @page = Page.new(page_params)
    @page.subject = @subject
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to(pages_path(:subject_id => @subject.id))
    else
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    # set_page_count  used here
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(pages_path(@page, :subject_id => @subject.id))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page deleted successfully"
    redirect_to(pages_path(:subject_id => @subject.id))
  end

  private

  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible)
  end

  def set_page_count
    @page_count = @subject.pages.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count += 1
    end
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

end
