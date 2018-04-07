sleep 2
ls -filter "*_languages.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_countries.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_groups.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_photos.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_users.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_tags.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_ingredient_infos.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_ingredients.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_recipe_steps.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_recipes.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
ls -filter "*_cook_books.rb" | %{$prefix = (get-date -UFormat "%Y%m%d%H%M%S"); mv $_.Name ($_.Name -replace "\d+",$prefix)}
sleep 2
