# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require 'active_support/all'
require 'date'

def find(id)
    @candidates.each do |can|
      if can[:id] === id
        return can
      end
    end
    return nil
  end
  
  def experienced?(candidate)
    if candidate[:years_of_experience] > 2
      return true
    end
    return false
  end
  
  def qualified_candidates(candidates)
    
    qualified = candidates.select {|can| can[:github_points] > 100 && 
                                         experienced?(can) &&
                                         can[:languages].any? { |lang| lang == "Ruby" || lang == "Python" } && 
                                          can[:date_applied] <= Time.now  &&
                                          can[:age] > 17 
                                          }
      
  return qualified
end


  # More methods will go below

def ordered_by_qualifications()
  sort = @candidates.sort_by do |can| [-can[:years_of_experience], -can[:github_points]]
  end
end
