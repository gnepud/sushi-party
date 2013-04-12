Admin.controllers :cartes do

  get :index do
    @cartes = Carte.all
    render 'cartes/index'
  end

  get :new do
    @carte = Carte.new
    render 'cartes/new'
  end

  post :create do
    @carte = Carte.new(params[:carte])
    if @carte.save
      flash[:notice] = 'Carte was successfully created.'
      redirect url(:cartes, :edit, :id => @carte.id)
    else
      render 'cartes/new'
    end
  end

  get :edit, :with => :id do
    @carte = Carte.find(params[:id])
    render 'cartes/edit'
  end

  put :update, :with => :id do
    @carte = Carte.find(params[:id])
    if @carte.update_attributes(params[:carte])
      flash[:notice] = 'Carte was successfully updated.'
      redirect url(:cartes, :edit, :id => @carte.id)
    else
      render 'cartes/edit'
    end
  end

  delete :destroy, :with => :id do
    carte = Carte.find(params[:id])
    if carte.destroy
      flash[:notice] = 'Carte was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Carte!'
    end
    redirect url(:cartes, :index)
  end
end
