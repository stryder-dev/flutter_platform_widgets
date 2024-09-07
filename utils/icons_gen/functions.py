import argparse
import subprocess
import os
import re

from constant import *

# Get the Flutter SDK path (manually specify or automatically find)
def get_flutter_sdk_path():
    # When the Flutter SDK path is specified manually, use it directly
    parser = argparse.ArgumentParser()
    parser.add_argument('--flutter-path', help='Manually specify the Flutter SDK path')
    flutter_path = parser.parse_args().flutter_path
    if flutter_path:
        return flutter_path
    # When the Flutter SDK path is not specified, automatically find it
    try: # Run the command "flutter doctor -v" to get the Flutter SDK path
        output = subprocess.check_output(['flutter', 'doctor', '-v']).decode('utf-8')
        lines = output.split('\n')
        for line in lines:
            if line.startswith('• Flutter version'):
                return line.split(' at ')[-1]
    except subprocess.CalledProcessError:
        pass 

# Get the Flutter SDK version on the current machine
def get_flutter_version():
    output = subprocess.check_output(['flutter', '--version']).decode('utf-8')
    return output

# Extract the icon names from the specified file
def read_icons(file_path,pattern):
    icons = []
    with open(file_path, 'r') as file:
        content = file.read()
        matches = re.findall(pattern, content)
        icons.extend(matches)
    return icons

# Append new icons to the target file
def append_new_icons_to_file(new_icons, file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Find the last "}" in the file
    last_bracket_index = None
    for i in range(len(lines) - 1, -1, -1):
        if lines[i].strip() == '}':
            last_bracket_index = i
            break

    if last_bracket_index is not None:
        # Generate new code
        new_code = []
        for icon in new_icons:
            # camel_case_name = ''.join(word.capitalize() for word in icon.split('_'))
            words = icon.split('_')
            camel_case_name = words[0] + ''.join(word.capitalize() if i > 0 else word for i, word in enumerate(words[1:]))
            camel_case_name = camel_case_name[0].lower() + camel_case_name[1:]  # 将首字母转换为小写
            new_code.append(f'  /// Icons: Icons.{icon} : CupertinoIcons.{icon}\n')
            new_code.append(f'  IconData get {camel_case_name} => isMaterial(context)\n')
            new_code.append(f'      ? Icons.{icon}\n')
            new_code.append(f'      : CupertinoIcons.{icon};\n')
            new_code.append('\n')

        # Delete the last "}" line and add new icon code before it
        del lines[last_bracket_index]
        lines[last_bracket_index:last_bracket_index] = new_code

        with open(file_path, 'w') as file:
            file.writelines(lines)
        print('Icons added to the file successfully.')
    else:
        print('Error: Failed to find the last "}" in the file.')

# Generate extension class file
def generate_icons_library_file(file_path,icons):
    # If file already exists, then delete it
    if os.path.exists(file_path):
        os.remove(file_path)
    with open(file_path, 'w') as file:
        file.write(platform_icons_dart_header) # Write header of file
        for icon in icons:
            words = icon.split('_')
            icon_name_camel_case = words[0] + ''.join(word.title() for word in words[1:])
            file.write(f'  /// Icons: Icons.{icon} : CupertinoIcons.{icon}\n')
            file.write(f'  IconData get {icon_name_camel_case} => isMaterial(context)\n')
            file.write(f'      ? Icons.{icon}\n')
            file.write(f'      : CupertinoIcons.{icon};\n')
            file.write('\n')
        file.write('}\n')

# Generate icons example page file
def generate_icons_example_page_file(file_path,camel_case_icons):
    # If file already exists, then delete it
    if os.path.exists(file_path):
        os.remove(file_path)
    with open(file_path, 'w') as file:
        file.write(platform_icons_example_page_header) # Write header of file
        for icon in camel_case_icons:
            file.write(f' _IconCompared(\'{icon}\', (c) => c.platformIcons.{icon}),\n')
        file.write(platform_icons_example_page_end) # Write end of file
        
# Transform the icon name from under_score to camelCase (for example: add_alert -> addAlert)
def under_score_to_camel_case(icon_list):
    result = []
    for icon_name in icon_list:
        words = icon_name.split('_')
        camel_case_name = words[0].lower() + ''.join(word.capitalize() for word in words[1:])
        result.append(camel_case_name)
    return result

# Transform the icon name from camelCase to under_score (for example: addAlert -> add_alert)
def camel_case_to_under_score(camel_case_list):
    result = []
    for camel_case_name in camel_case_list:
        under_score_name = ''
        for i, char in enumerate(camel_case_name):
            if char.isupper():
                under_score_name += '_' + char.lower()
            else:
                under_score_name += char
        result.append(under_score_name)
    return result