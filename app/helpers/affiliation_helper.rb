module AffiliationHelper

  def childtogroup(group,child)
    Affiliations.create!(group_id: group.id,child_id: child.id)
  end

end
