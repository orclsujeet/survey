json.users @users.each do |user|
    json.id user.id if user.present? 
    json.name user.name if user.present?
    json.email user.email if user.present?
    json.mobile user.mobile if user.present?
    json.address user.address if user.present?
end