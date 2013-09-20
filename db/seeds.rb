State.create(:name=> "New",:background => "#85FF00",:color=> "white")
State.create(:name=> "Open",:background => "#00CFFD",:color=> "white")
State.create(:name=> "Closed",:background => "black",:color=> "white")
project = Project.first
100.times do |i|
  project.tickets.create!(
    :title => "Fake ticket",
    :description => "Fake description",
    :user => User.first
  )
end
