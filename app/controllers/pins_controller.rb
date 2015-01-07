class PinsController < ApplicationController
  
  def index
  
  end

  def new 
    @pin = Pin.new
  end

  def show

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
