class CmsController < ApplicationController
  def index
    # can get rails to render something other than default by providing render plus
    # the view to render- so could switch index and hello and would swap what is rendered
    render('index')
  end

  def hello
    @array = [1, 2, 3, 4, 5]
    @id = params['id'] # string works
    @page = params[:page] # so does symbol
    render('hello')
  end

  def other_hello
    # another way to do it. only need to specify controller when changing controllers
    redirect_to(:controller => 'cms', :action => 'hello')
  end

  def lynda
    redirect_to('http://lynda.com')
  end
end
