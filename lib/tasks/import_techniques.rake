require 'csv'

desc 'import the techinques from aikidotechieken.csv in the Rails.root'
task import_techniques: [:environment] do
  f = File.open Rails.root.join('aikidotechnieken.csv')
  blob = CSV.read(f)
  attack = nil
  blob[1..-1].each_with_index do |entry, index|
    puts "#{index}: #{entry.join}"
    next if entry[1].blank?

    if entry[0].present?
      attack_name = entry[0].downcase.strip
      attack = Attack.find_or_create_by!(name: attack_name)
    end

    defense = Defense.find_or_create_by!(name: entry[1].downcase.strip)


    {'tachiwaza' => 2, 'suwariwaza' => 3, 'hanmi-handachiwaza' => 4}.each do |group, column|
      level = entry[column]
      next if level.blank?

      exam_level = level == '1d' ? 7 : 7 - level.to_i
      Technique.create!(attack:, defense:, group: , exam_level:)
    end
  end
end
