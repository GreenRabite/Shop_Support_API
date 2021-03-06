require 'pg'
require 'active_support/inflector'

PRINT_QUERIES = ENV['PRINT_QUERIES'] == 'true'
# https://tomafro.net/2010/01/tip-relative-paths-with-file-expand-path
ROOT_FOLDER = File.join(File.dirname(__FILE__), '..')
SHOP_SQL_FILE = File.join(ROOT_FOLDER, 'shop_support_api.sql')
SHOP_DB_FILE = File.join(ROOT_FOLDER, 'shop_support_api.db')

class DBConnection
  def self.open(db_file_name)
    @db = PG::Database.new(db_file_name)
    @db.results_as_hash = true
    @db.type_translation = true
    @db
  end

  def self.reset
    commands = [
      "rm '#{SHOP_DB_FILE}'",
      "cat '#{SHOP_SQL_FILE}' | sqlite3 '#{SHOP_DB_FILE}'"
    ]

    commands.each { |command| `#{command}` }
    DBConnection.open(SHOP_DB_FILE)
  end

  def self.instance
    reset if @db.nil?
    @db
  end

  def self.execute(*args)
    print_query(*args)
    instance.execute(*args)
  end

  def self.execute2(*args)
    print_query(*args)
    instance.execute2(*args)
  end

  def self.last_insert_row_id
    instance.last_insert_row_id
  end

  private

  def self.print_query(query, *interpolation_args)
    return unless PRINT_QUERIES

    puts '--------------------'
    puts query
    unless interpolation_args.empty?
      puts "interpolate: #{interpolation_args.inspect}"
    end
    puts '--------------------'
  end
end
