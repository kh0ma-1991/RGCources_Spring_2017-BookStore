module ReviewsHelper
  def verified_user? user
    return false unless user
    user.orders.count{ | order | order.done? } > 0
  end

  def reviewer_name user
    return t('unknown_user') unless user
    if user.name
      user.name
    else
      user.email.split('@')[0]
    end
  end

  def reviewer_image user
    return '/images/no_avatar.jpg' unless user.image
    user.image
  end
end