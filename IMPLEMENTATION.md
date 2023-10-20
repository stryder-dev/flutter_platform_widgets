The methid for creating the platform widgets is as follows

1. Generally each platform widget is a wrapper to the underlying Material or Cupertino widget.
2. Generally they do not include any specific styles or logic. Except Navbar and Appbar
3. Each platform widget should expose in the constructor as named arguments the same fields each Material and Cupertino underlying widgets share
4. All constructor arguments will take the same defaults from the underlying widgets and set on the platform widget being created
5. Only mark as @required if both underlying widgets also have them marked as @required
6. Each platform widget will provide a platform specifc builder to provide extra arguments targeting that platform. The name will match the platform control being created. i.e MaterialTextFieldData and CupertinoTextFieldData for PlatformTextField
7. Each data class will have all the constructor arguments of the underlying widget.
    1. If the argunent already exists on the base platform widget then the default value for the arguemnt will be removed
    2. If the argument does not exist on the base platform widget then the default value (if it has one) for the argument will be set
8. In constructing the underlying widget each argument will be of the following syntax:
    1. `value = data?.value ?? value` for arguments shared between platforms
    2. `value = data?.value` for arguments not shared between platforms and only exists on that one platform without a default argument
    3. `value = data?.value ?? _kDefaultArg` for arguments not shared between platforms and only exists on that one platform with a default argument on the underlying widget
9. If underlying widgets share the same argument but the default values are differnet than that will need to be set as part of the platform constructor. See PlatformTextField fo example
    1. `style = style ?? (isMaterial ? null : _kDefaultTextStyle),`
