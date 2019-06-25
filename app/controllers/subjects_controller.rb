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
    @subject = Subject.new({:name => 'Default'}) #Puts "Default" as default value on the form.
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
