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
    @carte = Carte.new(params[:carte].slice("name", "image"))
    params[:carte][:items].split(/\r?\n/).each do |i|
      item_name,item_price = i.split('|')
      if item_name.present? and item_price.present?
        @carte.items.build(name: item_name, price: item_price)
      end
    end
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
    if @carte.update_attributes(params[:carte].slice("name", "image"))
      if params[:carte][:items].present?
        @carte.items = params[:carte][:items].split(/\r?\n/).map do |i|
          item_name,item_price = i.split('|')
          if item_name.present? and item_price.present?
            Item.new(name: item_name, price: item_price, carte_id: @carte.id)
          end
        end
      else
        @carte.items = []
      end
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
