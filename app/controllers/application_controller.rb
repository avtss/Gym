class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  before_action :set_base, only: %i[show edit update destroy]

  rescue_from ActiveRecord::ConnectionNotEstablished, with: :handle_db_connection_error
  rescue_from ActiveRecord::StatementInvalid, with: :handle_db_statement_error

  def index
    @bases = base_class.all
  end

  def show; end

  def new
    @base = base_class.new
  end

  def edit; end

  def create
    @base = base_class.new(base_params)

    if @base.save
      redirect_to send("#{controller_name}_path"), notice: "#{base_class.name} успешно создан."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @base.update(base_params)
      redirect_to send("#{controller_name}_path"), notice: "#{base_class.name} успешно обновлен."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @base.destroy!
    redirect_to send("#{controller_name}_path"), status: :see_other, notice: "#{base_class.name} успешно удален."
  end

  private

  def handle_db_connection_error(exception)
    Rails.logger.error "Ошибка подключения к базе данных: #{exception.message}"
    render plain: "Ошибка подключения к базе данных", status: :service_unavailable
  end

  def handle_db_statement_error(exception)
    Rails.logger.error "Ошибка выполнения SQL-запроса: #{exception.message}"
    render plain: "Ошибка базы данных.", status: :internal_server_error
  end

  def set_base
    @base = base_class.find(params[:id])
  end

  def base_class
    controller_name.classify.constantize
  end

  def base_params
    raise NotImplementedError, "base_params должен быть переопределен в #{self.class.name}"
  end
end
