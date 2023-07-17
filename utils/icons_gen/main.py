from functions import *
from constant import *

# Get the Flutter SDK path (manually specify or automatically find)
flutter_sdk_path = get_flutter_sdk_path()
print('Flutter SDK Path:', flutter_sdk_path)

# Extract the icon names of material style
material_icons = read_icons(flutter_sdk_path + '/' + material_icons_relative_path,pattern='static const IconData (\w+)')
print('Material Icons:', len(material_icons))

# Extract the icon names of cupertino style
cupertino_icons = read_icons(flutter_sdk_path + '/' + cupertino_icons_relative_path,pattern='static const IconData (\w+)')
print('Cupertino Icons:', len(cupertino_icons))

# Find the common icons of material and cupertino
common_name_icons = set(material_icons) & set(cupertino_icons)
print('Common Name Icons:', len(common_name_icons))

# Generate library file (with sorted)
generate_icons_library_file(platform_icons_gen_relative_path,sorted(list(common_name_icons)))
print('PlatformIconsGen generated:',platform_icons_gen_relative_path)

# Read the icon names in the platform_icons.dart file (the icons that have been encapsulated)
existing_platform_icons = read_icons(platform_icons_relative_path,pattern='(?<!//) IconData get (\w+) =>')
print('Existing Platform Icons:', len(existing_platform_icons))

# Calculate all platform icons(union of platform_icons.dart and platform_icons_gen.dart)
all_platform_icons = set(existing_platform_icons) | set(under_score_to_camel_case(common_name_icons))
print('All Platform Icons:', len(all_platform_icons))

# Generate example page file (with sorted)
generate_icons_example_page_file(platform_icons_example_page_relative_path,sorted(list(all_platform_icons)))
print('IconsPage generated:',platform_icons_example_page_relative_path)



# Calculate the icons that need to be added
# new_common_name_icons = set(under_score_to_camel_case(common_name_icons)) - set(existing_platform_icons)
# print('new_common_name_icons: ',len(new_common_name_icons))

# Append new icons to the target file
# append_new_icons_to_file(camel_case_to_under_score(common_name_icons),platform_icons_relative_path)
# print('Target file updated successfully.')

