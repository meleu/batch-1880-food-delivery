require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def find_by_username(username)
    @employees.find { |e| e.username == username }
  end

  def find(id)
    @employees.find { |e| e.id == id }
  end

  def all
    @employees
  end

  def all_riders
    @employees.select { |e| e.rider? }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
    @next_id = @employees.last.id + 1 unless @employees.empty?
  end
end
