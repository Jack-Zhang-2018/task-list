
class Task
  attr_accessor :title, :description, :marker

  def initialize(title = "title", description = "description", marker = false)
    @title = title
    @description = description
    @marker = marker
  end

  def done
    @marker = true
  end

end

class DueDateTask < Task
  attr_accessor :due_date
  def initialize(title = "title", description = "description", marker = false, due_date = 'today')
    super(title, description, marker)
    @due_date = due_date
  end

  def change_date
    p 'enter a month'
    month = gets.chomp
    p 'enter a day'
    day = gets.chomp
    p 'enter a year'
    year = gets.chomp
    @due_date = "07/01/1995"

  end
end

class List
  attr_accessor :tasks

  def initialize(tasks = [])
    @tasks = tasks
    @completed = []
    @incompleted = []
  end

  def add(task)
    @tasks << task
  end

  def get_completed
    @tasks.each do |task|
      if task.marker == true
        @completed << task
      end
    end
    @completed
  end

  def get_incompleted
    @tasks.each do |task|
      if task.marker == false
      @incompleted << task
      end
    end
    @incompleted
  end

end



# tasklist1.addtask(task)
