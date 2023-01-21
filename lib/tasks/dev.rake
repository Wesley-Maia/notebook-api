namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
	task setup: :environment do
		if Rails.env.development?
			spinner = TTY::Spinner.new("[:spinner] Apagando banco de dados...")
			spinner.auto_spin # Automatic animation with default interval
			%x(rails db:drop)
			spinner.success("Pronto!") # Stop animation

      spinner = TTY::Spinner.new("[:spinner] Criando banco de dados...")
			spinner.auto_spin # Automatic animation with default interval
			%x(rails db:create)
			spinner.success("Pronto!") # Stop animation

      spinner = TTY::Spinner.new("[:spinner] Migrando banco de dados...")
			spinner.auto_spin # Automatic animation with default interval
			%x(rails db:migrate)
			spinner.success("Pronto!") # Stop animation

      spinner = TTY::Spinner.new("[:spinner] Alimentando banco de dados...")
			spinner.auto_spin # Automatic animation with default interval
			%x(rails db:seed)
			spinner.success("Pronto!") # Stop animation
		else
			puts "Você não está em ambiente de desenvolvimento"
		end
	end

end
