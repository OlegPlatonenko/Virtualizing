# ADM file structure

```powershell
CLASS MACHINE
CATEGORY "Animation I hate"
	POLICY "Show first sign-in animation"
		EXPLAIN !!ShowFisrtSignInAnimation
		KEYNAME "Software\Microsoft\Windows'Currentversion\Policies\System"
		VALUENAME "EnableFirstLogonAnimation"
		VALUEON NUMERIC "1"
		VALUEOFF NUMERIC "0"
	END POLICY
END CATEGORY

[strings]
ShowFisrtSignInAnimation="When this setting is enabled, Windows will show first sign-in animation. "
```

## ADM file sections

- **CLASS USER/MACHINE** - HKEY_CURRENT_USER/HKEY_LOCAL_MACHINE
- **CATEGORY** - name of the group policy 
- **POLICY** - section with settings

![Settigs](https://github.com/OlegPlatonenko/net-sys-administration/blob/master/windows/images/Settings.png)

## POLICY section properties

- **KEYNAME** - Registry key location
- **EXPLAIN** - Help section in window
- **VALUENAME** - Registry value name
- **VALUEON** - If enable this value is stored in the Registry
- **VALUEOFF** - If disable this value is stored in the registry
- **EDITTEXT** - Adds info or input fields under the *Options* section within a policy
- **NUMERIC** - Adds a numeric field
- **CHECKBOX** - Adds checkbox
- **COMBOBOX** - Add a combo box
- **DROPDOWNLIST** - Adds dropdownlist
- **LISTBOX** - Adds a list of values to add to the Registry 
- **CLIENTTET** - Specify a DLL of GP used on client system

![Properties](https://github.com/OlegPlatonenko/net-sys-administration/blob/master/windows/images/Properties.png)