# encoding: utf-8

PadrinoBoilerplate.helpers do
  def current_action
    action = current_path[1..current_path.length]
    action == '' ? 'accueil' : action
  end
end
