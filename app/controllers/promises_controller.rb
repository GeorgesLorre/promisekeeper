class PromisesController < ApplicationController
  before_action :set_promise, only: [:show, :edit, :update, :destroy]

  def index
    @promises = Promise.all
  end

  def show
  end

  def new
    @promise = Promise.new
    @user = current_user
  end

  def create
    @promise = Promise.new(promise_params)
    @promise.user = current_user
  end

  def edit
  end

  def update
    @promise.update(promise_params)
  end

  def destroy
    @service.destroy
  end

  private

  def set_promise
    @promise = Promise.find(params[:id])
  end

  def promise_params
    params.require(:promise).permit(:title, :description, :condition, :status, :deadline, :witness)
  end

end
