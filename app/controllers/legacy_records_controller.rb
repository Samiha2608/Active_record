class LegacyRecordsController < ApplicationController
  before_action :set_legacy_record, only: [ :show, :edit, :update, :destroy ]

  def index
    @legacy_records = LegacyRecord.all
  end

  def show
  end

  def new
    @legacy_record = LegacyRecord.new
  end

  def create
    @legacy_record = LegacyRecord.new(legacy_record_params)
    if @legacy_record.save
      redirect_to @legacy_record, notice: "Record created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @legacy_record.update(legacy_record_params)
      redirect_to @legacy_record, notice: "Record updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @legacy_record.destroy
    redirect_to legacy_records_path, notice: "Record deleted successfully."
  end

  private

  def set_legacy_record
    @legacy_record = LegacyRecord.find(params[:id])
  end

  def legacy_record_params
    params.require(:legacy_record).permit(:name, :info)
  end
end
