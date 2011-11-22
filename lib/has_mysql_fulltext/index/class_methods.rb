module HasMysqlFulltext
	module Index
		module ClassMethods
		  def prepare_expression(expr = "")
		    expr.to_s.gsub(/[^\w\s]/, '').tr_s(" "," ").strip.split.uniq.map {|word| word + "*"}
		  end

		end
	end
end