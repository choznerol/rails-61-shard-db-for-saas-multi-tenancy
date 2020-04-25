class TenantConfigsController < ApplicationController
  before_action :set_tenant_config, only: [:show, :edit, :update, :destroy]

  # GET /tenant_configs
  # GET /tenant_configs.json
  def index
    @tenant_configs = TenantConfig.all
  end

  # GET /tenant_configs/1
  # GET /tenant_configs/1.json
  def show
  end

  # GET /tenant_configs/new
  def new
    @tenant_config = TenantConfig.new
  end

  # GET /tenant_configs/1/edit
  def edit
  end

  # POST /tenant_configs
  # POST /tenant_configs.json
  def create
    @tenant_config = TenantConfig.new(tenant_config_params)

    respond_to do |format|
      if @tenant_config.save
        format.html { redirect_to @tenant_config, notice: 'Tenant config was successfully created.' }
        format.json { render :show, status: :created, location: @tenant_config }
      else
        format.html { render :new }
        format.json { render json: @tenant_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tenant_configs/1
  # PATCH/PUT /tenant_configs/1.json
  def update
    respond_to do |format|
      if @tenant_config.update(tenant_config_params)
        format.html { redirect_to @tenant_config, notice: 'Tenant config was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant_config }
      else
        format.html { render :edit }
        format.json { render json: @tenant_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenant_configs/1
  # DELETE /tenant_configs/1.json
  def destroy
    @tenant_config.destroy
    respond_to do |format|
      format.html { redirect_to tenant_configs_url, notice: 'Tenant config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_config
      @tenant_config = TenantConfig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tenant_config_params
      params.require(:tenant_config).permit(:subdomain)
    end
end
