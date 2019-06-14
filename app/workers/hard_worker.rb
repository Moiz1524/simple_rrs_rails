class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    # Do something
    redirect_to(root_path)
  end
  
end
