get '/' do
  @rolls = []

  3.times { @rolls << Roll.create }
  @win = "YOU WIIIIIIIIIN!!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

  erb :index
end

# QUE HACER?: Convierte esta ruta para que utilice Ajax y si la petición no es
# de Ajax de igual forma sirva.
post '/rolls' do
  @rolls = []

  if params[:value]
    3.times { @rolls << Roll.create({ value: value }) }
  else
    3.times { @rolls << Roll.create }
  end

  @win = "YOU WIIIIIIIIIN!!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

  if request.xhr?
    erb :_die_roll, layout: false
  else
    erb :index
  end
# TIP: Qué esté haciendo esto y qué debe hacer diferente.
end