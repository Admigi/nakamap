module BadgesHelper
  def badge_count(badge)
    count = current_user.userbadges.where(badge: badge).count
    count > 1 ? count : nil
  end

  def badge_type(badge)
    # Logic to determine the badge type based on some criteria
    # Replace this with your actual logic
    if badge.name.include?('Gold')
      'Gold Badge'
    elsif badge.name.include?('Silver')
      'Silver Badge'
    else
      'Unknown Badge Type'
    end
  end

  def has_badge?(badge)
    current_user.badges.include?(badge)
  end
end
