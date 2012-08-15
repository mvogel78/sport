module GroupsHelper
    def termseries(group)
    @dur =  (group.ends_at - group.starts_at).to_int / 7
    @apps = (1..@dur).collect { |x| group.starts_at + (7*x).days } 
    end
end
