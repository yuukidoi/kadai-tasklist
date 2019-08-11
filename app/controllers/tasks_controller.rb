class TasksController < ApplicationController
    
    before_action :require_user_logged_in
    
    before_action :correct_user, only: [:show, :edit, :update, :destroy]
    
    
    def index
        if logged_in?
            
            @task = current_user.tasks.build
            @tasks = current_user.tasks.order(id: :desc).page(params[:page])
        end 
    end 
    
    def show
    end 
    
    def new
        @task = Task.new
    end 
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = 'taskが登録されました'
            redirect_to @task
        else
            flash[:danger] = '登録失敗'
            render :new
        end 
    end 
    
    def edit
        
    end 
    
    def update
      
        if @task.update(task_params)
            flash[:success] = '更新されました'
            redirect_to @task
        else
            flash[:danger] = '更新されませんでした'
            render :edit
        end 
    end 
    
    def destroy 

        @task.destroy
        
        flash[:success] = '削除されました'
        redirect_back(fallback_location: root_path)
    end 
    
    private
    

    
    def task_params
        params.require(:task).permit(:content, :status, :user)
    end 
    
    def correct_user
        @task = current_user.tasks.find_by(id: params[:id])
        unless @task
            redirect_to root_url
        end 
    end 
end
