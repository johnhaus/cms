class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted
    render('index') # this is not needed, but to display something
    # other than 'index', this can override defaults.
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

end
