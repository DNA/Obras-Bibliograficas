class Name < String
  PARENTAL_NAMES = %w[filho filha neto neta sobrinho sobrinha junior júnior].freeze

  REMOVE_UPCASE_PATTERN = / (d)[aeo]s?( |$)/i

  def bibliography
    *names, surname = downcase.split

    return upcase if names.empty?

    if surname.in?(PARENTAL_NAMES) && names.count > 1
      surname = "#{names.pop} #{surname}"
    end

    names = Name.new(names.join(' ')).titleize

    "#{surname.upcase}, #{names}"
  end

  def titleize
    super.gsub(REMOVE_UPCASE_PATTERN, &:downcase)
  end
end
