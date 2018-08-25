require_relative("../db/sql_runner")

class Manufacturer

  attr_accessor :id, :name, :address, :telephone

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @telephone = options['telephone']
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name, address, telephone
    )
    VALUES
    (
      $1, $2,$3
    )
    RETURNING id"
    values = [@name, @address, @telephone]
    manufacturer = SqlRunner.run( sql, values).first
    @id = manufacturer['id'].to_i
  end

  def update()
    sql = "UPDATE manufacturers
    SET
    (
      name, address, telephone
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @address, @telephone, @id]
    SqlRunner.run( sql, values)
  end
end
