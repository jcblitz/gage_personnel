class ShowController < ApplicationController
  layout "internal"
  
  def index
    render :action => "index", :layout => "homepage"
  end
  
  def jobs     
    #render :action => "jobs_temp"
    @administrative = Category.find(1)
    logger.debug("Found Category #{@administrative.name}")
    @administrative.jobs = Job.find(:all, :conditions => "category_id = #{@administrative.id} and is_active = 't' and ((start_date <= current_date and end_date >= current_date) or (start_date is null and end_date >= current_date) or (start_date <= current_date and end_date = null) or (start_date is null and end_date is null))", :order=>"position")
  
    @industrial = Category.find(2)
    logger.debug("Found Category #{@industrial.name}")
    @industrial.jobs = Job.find(:all, :conditions => "category_id = #{@industrial.id} and is_active = 't' and ((start_date <= current_date and end_date >= current_date) or (start_date is null and end_date >= current_date) or (start_date <= current_date and end_date = null) or (start_date is null and end_date is null))", :order=>"position")
  
    @professional = Category.find(3)
    logger.debug("Found Category #{@professional.name}")
    @professional.jobs = Job.find(:all, :conditions => "category_id = #{@professional.id} and is_active = 't' and ((start_date <= current_date and end_date >= current_date) or (start_date is null and end_date >= current_date) or (start_date <= current_date and end_date = null) or (start_date is null and end_date is null))", :order=>"position")
  
  end
  
  def news    
  end
  
  def staffing_solutions     
  end
  
  def services     
  end
  
  def company_profile   
  end
  
  def contact  
  end
  
  def testimonials    
  end
  
  def temp_news
  end
  
end
