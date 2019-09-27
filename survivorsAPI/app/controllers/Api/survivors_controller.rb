module Api
		class SurvivorsController < ApplicationController   
=begin 
			index vai mostrar todos os Survivors registrados até o momento da requisição GET e ordena-los de acordo com 
			a ordem alfabética dos seus nomes 
=end
			def index
				survivors = Survivor.order(:name);
				render json: {status: 'SUCCESS', message:'Sobreviventes carregados', data:survivors},status: :ok
			end

			#create vai registrar um Survivor ( via POST method)
			def create
				survivor = Survivor.new(survivor_create_params)
				survivor.abducted = false
				survivor.abduction_reports = 0
				if survivor.save
					render json: {status: 'SUCCESS', message:'Survivor Registrado', data:survivor},status: :ok
				else
					render json: {status: 'ERROR', message:'Survivor não registrado com sucesso', data:survivor.erros},status: :unprocessable_entity
				end
			end

			#Update vai atualizar a localização do survivor(PUT method)
			#passa-se o id para fazer esse update via URL ex:localhost:3000/survivors/53
			def update
				survivor = Survivor.find(params[:id])
				if survivor.update_attributes(survivor_update_params)
					render json: {status: 'SUCCESS', message:'Localizaçao do survivor Updated ', data:survivor},status: :ok
				else
					render json: {status: 'ERROR', message:'Survivor não updated', data:article.erros},status: :unprocessable_entity
				end
			end
			#Trata a questão de reportar a abdução de um survivors e de verificar se o survivor reportado já possui 3 ou mais reports
			def report_surv
				sur_reportado = Survivor.find(params[:id])
					
				if Survivor.where(id: survivor_report_params)
				 	Survivor.update(params[:id],abduction_reports:sur_reportado.abduction_reports+=1)
					if sur_reportado.abduction_reports >= 3
						Survivor.update(params[:id],abducted:true) 
					end
					render json: {status: 'SUCCESS', message:'Denúncia de Abdução feita com Sucesso ', data:sur_reportado},status: :ok
				else
					render json: {status: 'ERROR', message:'Erro ao denunciar', data:sur_reportado.erros},status: :unprocessable_entity
				end
			end
			#apenas calcula a porcentagem de survivors abduzidos e exibe em um JSON
			def percentage_abd
				all_survivors = Survivor.count()
				abd_survivors = Survivor.where(abducted: true).count
				percentage = (abd_survivors.to_f/all_survivors.to_f) * 100
				render json: {status: 'SUCCESS', message:'Porcentagem de sobreviventes Abduzidos', percentage:percentage},status: :ok
			end
			#apenas calcula a porcentagem de survivors não abduzidos e exibe em um JSON
			def percentage_non_abd
				all_survivors = Survivor.count()
				abd_survivors = Survivor.where(abducted: false).count
				percentage = (abd_survivors.to_f/all_survivors.to_f) * 100
				render json: {status: 'SUCCESS', message:'Porcentagem de sobreviventes Abduzidos', percentage:percentage},status: :ok
			end
			#-----------PARÂMETROS----------------------------------------------------------------------------------------------
			
			# Parametros aceitos no report do Survivor
			private
			def survivor_report_params
				params.permit(:idDenunciante)
			end

			# Parametros aceitos no create do Survivor
			private
			def survivor_create_params
				params.permit(:name, :age,:gender,:lat,:long)
			end

			# Parametros aceitos no update da localização do Survivor
			private
			def survivor_update_params
				params.permit(:lat,:long)
			end
	end
end