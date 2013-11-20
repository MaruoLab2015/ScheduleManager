# -*- coding: utf-8 -*-
class ExpPlansController < ApplicationController
  http_basic_authenticate_with :name => "pico", :password => "2012"
  # GET /exp_plans
  # GET /exp_plans.json
  def index
#    @exp_plans = ExpPlan.all
#    @exp = sarchMember

    t = Time.now
    strDate = t.strftime("%Y-%m-%d")
    dateAry = strDate.split("-")
    @date = Date.new(dateAry[0].to_i, dateAry[1].to_i, dateAry[2].to_i)

    @year = dateAry[0]
    @month = dateAry[1]
    @day = dateAry[2]
    @fd = t.strftime("%w")
    @ld = t.at_end_of_month.day

    #作製
    @exp_new = ExpPlan.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exp_plans }
    end
  end

  def edit
    @exp_plan = ExpPlan.find(params[:id])
  end

  def update
    @exp_plan = ExpPlan.find(params[:id])
    if @exp_plan.update_attributes(params[:post])
      redirect_to root_path, notice: '更新されました！'
    else
      render action: 'edit'
    end
  end

  # POST /exp_plans
  # POST /exp_plans.json
  def create
    @exp_plan = ExpPlan.new(params[:exp_plan])

    respond_to do |format|
      if @exp_plan.save
        redirect_to(root_path)
#        format.html { redirect_to @exp_plan, notice: 'Exp plan was successfully created.' }
 #       format.json { render json: @exp_plan, status: :created, location: @exp_plan }
      else
  #      format.html { render action: "new" }
   #     format.json { render json: @exp_plan.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /exp_plans/1
  # DELETE /exp_plans/1.json
  def destroy
    @exp_plan = ExpPlan.find(params[:id])
    @exp_plan.destroy

=begin
    respond_to do |format|
      format.html { redirect_to exp_plans_url }
      format.json { head :no_content }
    end
=end
    render json: { exp: @exp_plan }
  end
end
