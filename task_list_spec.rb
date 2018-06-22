require 'rspec'
require_relative 'task_list'


describe "Task" do

  let(:task) {Task.new}

  it "can be created" do
    expect{Task.new}.to_not raise_error
  end

  it "can have a title" do
    # task = Task.new
    expect(task.title).to be
    expect(task.title).to be_a String
  end

  it "has a description" do
    # task = Task.new
    expect(task.description).to be
    expect(task.description).to be_a String
  end

  it "can be marked as done" do
    # task = Task.new
    expect(task.marker).to be false
    task.marker = true
    expect(task.marker).to be
  end

  it "is completed" do
    task.done
    expect(task.marker).to be
  end

end


describe "List" do

  let(:list) {List.new}

  it "can be created" do
    expect{List.new}.to_not raise_error
  end

  it "contains tasks" do
    expect(list.tasks).to be_empty

    task1 = Task.new
    task1.done
    list.add(task1)
    task2 = Task.new
    list.add(task2)

    expect(list.tasks.length).to eq 2

  end

  it "can present only the finished tasks" do
    task1 = Task.new
    task1.done
    list.add(task1)
    task2 = Task.new
    list.add(task2)
    expect(list.get_completed).to eq [task1]
  end

  it "can present only the incomplete tasks" do
    task1 = Task.new
    list.add(task1)
    task2 = Task.new
    task2.done
    list.add(task2)
    expect(list.get_incompleted).to eq [task1]
  end



end

describe "DueDateTask" do
  let(:due_date_task) {DueDateTask.new}

  it "adds a due date to a task" do
    expect{DueDateTask.new}.to_not raise_error
  end

  it "inherits attributes from the Task class" do

    expect(due_date_task.title).to be
    expect(due_date_task.description).to be
    expect(due_date_task.marker).to eq false
    expect(due_date_task.done).to be

  end

  it "has a method that can change the due date" do
    due_date_task = DueDateTask.new
    expect(due_date_task.due_date).to eq 'today'
    due_date_task.change_date
    expect(due_date_task.due_date).to eq "07/01/1995"
  end

end
