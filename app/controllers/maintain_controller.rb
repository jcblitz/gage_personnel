class MaintainController < ApplicationController
before_filter :login_required
layout "internal"

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @job_pages, @jobs = paginate :jobs, :per_page => 10
  end

  def new
    @job = Job.new    
  end

  def create
    @job = Job.new(params[:job])
    if @job.position == nil || @job.position.to_s.empty?
      @job.position = next_sort_value(1) + 1
    end
    if @job.save
      flash[:notice] = "'#{@job.title}' was successfully created."
      redirect_to(url_for(:action=>"jobs", :controller=>"show"))
    else
      render :action => 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])    
    @job.attributes = params[:job]
    if @job.position == nil || @job.position.to_s.empty?
      logger.debug("Setting default position")
      @job.position = next_sort_value(1) + 1
    end    
    if @job.save!
      flash[:notice] = "'#{@job.title}' was successfully updated."
      redirect_to(url_for(:controller => 'show', :action => 'jobs'))
    else
      render :action => 'edit'
    end
  end

  def delete
    Job.find(params[:id]).destroy
    flash[:notice] = "Job has been deleted"
    redirect_to(url_for(:controller => 'show', :action => 'jobs'))
  end
  
  def sort_list
    @category_id = params[:id]
    if @category_id == nil
      @category_id = 1
    end
    logger.debug("Getting list for Category #{@category_id}")
    @category = Category.find(@category_id)
    @jobs = Job.find(:all, :conditions => ['category_id = ? and is_active = ?', @category_id, 1], :order=>"position")
    @categories = Category.find(:all, :order=>"sort_order")
  end
  
  def sort_list_update
    @order = params[:list]
   
    
    @order.each_with_index do |job_id, index|
      puts "Updated #{job_id} to position #{index + 1}"
      Job.update(job_id, {:position => index + 1})
    end
    sort_list
    render :partial => 'sort_list_update'
  end
  
  private 
  def next_sort_value(category_id)
    logger.debug("Category for next val: " + category_id.to_s)
    Job.maximum(:position, :conditions => ['category_id = ?', category_id]) 
  end
end
