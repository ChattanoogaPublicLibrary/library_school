module ApplicationHelper
  def proposal_course_pth(obj)
    if obj.is_a?(Proposal)
      proposal_path(obj)
    elsif obj.is_a?(Course)
      course_path(obj)
    end
  end
end
