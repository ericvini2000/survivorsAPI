Rails.application.routes.draw do

	#rota referente ao nó index	que irá mostrar todos os survivors
	get '/survivors', to:'api/survivors#index'

	#rota referente ao nó de criar survivor no bd
	post '/survivors', to:'api/survivors#create'

	#rota referente ao nó de dar um update
	put '/survivors/:id', to:'api/survivors#update'

  	#rota referente ao nó de reportar abdução
	put '/survivors/report_abd/:id', to:'api/survivors#report_surv'

	#rota referente ao nó de obter o percentual de abduzidos 
	get '/survivors/percent_non_abd', to:'api/survivors#percentage_non_abd'

	#rota referente ao nó de obter o percentual de não abduzidos
 	get '/survivors/percent_abd', to:'api/survivors#percentage_abd'	


end
