module HasMysqlFulltext
	module Index
		module InstanceMethods
			def find_all_matching(expr, options)
				results = self.where("MATCH(data) AGAINST (? IN BOOLEAN MODE)",  expr.strip).includes(:indexable)
				results.map(&:indexable)
			end
		end
	end
end