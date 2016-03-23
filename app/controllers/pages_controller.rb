class PagesController < ApplicationController
  def batman
    @cl = 'batman'
  end

  def superman
    @cl = 'superman'
  end

  def batman_vs_superman
  end

  def polling
    if params[:email].present?
      Vote.create(
        email: params[:email],
        heroe: params[:name]
      )

      redirect_to pages_polling_path, notice: 'Gracias por tu voto!'
    else
      flash[:alert] = 'Por favor rellenar el campo de e-mail!'
      render pages_batman_vs_superman_path
    end
  end

  def polling_report
    @vote = Vote.all
  end
end
