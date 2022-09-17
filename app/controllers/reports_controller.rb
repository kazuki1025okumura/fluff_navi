class ReportsController < ApplicationController
  def new
    @facility = Facility.find(params[:facility_id])
    @report = Report.new
  end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to facility_path(@report.facility), success: t('.success')
      ReportMailer.with(report: @report).send_mail.deliver_later
    else
      @facility = Facility.find(params[:facility_id])
      flash.now[:error] = t('.error')
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:content_id, :body, :image, :image_cache).merge(facility_id: params[:facility_id])
  end
end
