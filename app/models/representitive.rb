class Representitive
  attr_reader :name, :role, :party, :seniority, :district
  def initialize(args)
    @name = args["name"]
    @role = args["role"]
    @party = args["party"]
    @seniority = args["seniority"]
    @district = args["district"]
  end
end
