class PinsController < ApplicationController
  #remember before every action listed below it will find the pin
  before_action :find_pin, only: [:show, :edit, :destroy, :update]
  
  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def new 
    @pin = Pin.new
  end

  def show

  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin Successfully updated"
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
  end

  def create
    @pin = Pin.new(pin_params)

    if @pin.save 
      redirect_to @pin, notice: "Successfully created pin."
    else
      render 'new'
    end
    
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

end
