SushiParty.controllers :pages do
  get :index, :map => '/', :cache => true do
    render 'pages/index'
  end

  get :menu_midi, :map => '/menu-midi' do
    @menus = MenuType.where(:name => 'Menu midi').first.menus.paginate(page: params[:page], per_page: 12)
    render 'pages/menu_midi'
  end

  get :menu_soir, :map => '/menu-soir' do
    @menus = MenuType.where(:name => 'Menu soir').first.menus.paginate(page: params[:page], per_page: 12)
    render 'pages/menu_soir'
  end

  get :plateaux, :map => '/plateaux' do
    render 'pages/plateaux'
  end

  get :livraison, :map => '/livraison', :cache => true do
    render 'pages/livraison'
  end
end
