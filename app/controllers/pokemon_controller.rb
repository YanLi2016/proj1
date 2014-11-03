class PokemonController < ApplicationController
	def capture
		@pokemon = Pokemon.find params[:id]
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to root_path
	end 

	def damage
		@pokemon = Pokemon.find params[:id]
		@pokemon.health -= 10
		if @pokemon.health <= 0
			@pokemon.destroy
		else 
			@pokemon.save
		end  
		redirect_to trainer_path(@pokemon.trainer_id)
	end

	def new 
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.level = 1
		@pokemon.health = 100
		@pokemon.trainer_id = current_trainer.id
		if @pokemon.valid?
			@pokemon.save
			redirect_to trainer_path(@pokemon.trainer_id)
		else 
			flash[:error] = @pokemon.errors.full_messages.to_sentence 
			redirect_to new_pokemon_path
		end 
	end

	def heal
		@pokemon = Pokemon.find params[:id]
		@pokemon.health += 10
		if @pokemon.health <= 0
			@pokemon.destroy
		else 
			@pokemon.save
		end  
		redirect_to trainer_path(@pokemon.trainer_id)
		
	end
	private
  	# filters out unwanted params
  	def pokemon_params
    	params.require(:pokemon).permit(:name)
  	end

end 
