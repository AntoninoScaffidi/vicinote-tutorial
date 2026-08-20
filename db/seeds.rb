# Categories are curated by VicinoTe, not created by users — keeping the list
# small and consistent is what makes browsing by category useful at all.
[
  "Home Repair",
  "Tutoring",
  "Cleaning",
  "Gardening",
  "Pet Care",
  "Moving Help",
  "Tech Support",
  "Beauty & Wellness"
].each do |name|
  Category.find_or_create_by!(name: name)
end
