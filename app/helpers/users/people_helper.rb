module Users::PeopleHelper
  def get_age(birthday)
    return 0 if birthday.nil?

    today = Time.zone.today
    this_years_birthday = Date.new(today.year, birthday.month, birthday.day)
    age = today.year - birthday.year

    # 今日が今年の誕生日より前であれば、年齢を1つ減らす
    age -= 1 if today < this_years_birthday

    age
  end

  def active?(index, person_id)
    (params[:id].present? && person_id == params[:id].to_i) || (params[:id].blank? && index.zero?)
  end
end
