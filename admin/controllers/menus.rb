Admin.controllers :menus do

  get :index do
    @menus = Menu.includes(:menu_type).all
    render 'menus/index'
  end

  get :new do
    @menu = Menu.new
    render 'menus/new'
  end

  post :create do
    @menu = Menu.new(params[:menu])
    if @menu.save
      flash[:notice] = 'Menu was successfully created.'
      redirect url(:menus, :edit, :id => @menu.id)
    else
      render 'menus/new'
    end
  end

  get :edit, :with => :id do
    @menu = Menu.find(params[:id])
    render 'menus/edit'
  end

  put :update, :with => :id do
    @menu = Menu.find(params[:id])
    if @menu.update_attributes(params[:menu])
      flash[:notice] = 'Menu was successfully updated.'
      redirect url(:menus, :edit, :id => @menu.id)
    else
      render 'menus/edit'
    end
  end

  delete :destroy, :with => :id do
    menu = Menu.find(params[:id])
    if menu.destroy
      flash[:notice] = 'Menu was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Menu!'
    end
    redirect url(:menus, :index)
  end
end
