# Resource Changes

## Form changes

### All Dialogs
- Tab indexes set

### Wrestler Dialog (102)
- Fixed typo (Affliliation -> Affiliation)
- Added X button
- Updated title for consistency (Wrestler Information -> Wrestler Editor)
- Set tab stop on stat increate and decrease buttons

### Team Dialog (103)
- Added X Button
- Updated title for consistency (Teams -> Team Editor)

### Title Dialog (104)
- Updated title for consistency (Titles -> Team Editor)

### About Dialog (105)
- Updated version label (4.0.5 -> 4.1.0)
- Updated copyright label ( (C) -> ©)
- Added shortcut to Ok button (Alt + O)

### Move Dialog (106)
- Added X Button

### Referee Dialog (110)
- Swapped OK, Cancel buttons for consistency
- Set tab stop on track bars.

### Commentator Dialog (111)
- Swapped OK, Cancel buttons for consistency

### Gimmick Dialog (115)
- Added X Button

### Weapon Dialog (118)
- Swapped OK, Cancel buttons for consistency

### Singles Match Dialog (123)
- Added X Button

### Battle Royal Dialog (124)
- Swapped participant add remove buttons

### Federation Dialog (134)
- Swapped OK, Cancel buttons for consistency

### Tweak Gimmick Dialog (135)
- Moved Defaults button to left

### Tournament Dialog (139)
- Swapped OK, Cancel buttons for consistency

## Add Manifest to enable modern styles
`RT_MANIFEST` -> `1`;
```
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
  <assemblyIdentity
    version="4.1.0.0"
    processorArchitecture="*"
    name="Zeus Pro"
    type="win32"
  />
  <description>Zeus Pro 4.0.6</description>
  <dependency>
    <dependentAssembly>
      <assemblyIdentity
        type="win32"
        name="Microsoft.Windows.Common-Controls"
        version="6.0.0.0"
        processorArchitecture="*"
        publicKeyToken="6595b64144ccf1df"
        language="*"
      />
    </dependentAssembly>
  </dependency>
</assembly>
```

## Icon Changes
- Added original Zeus Pro icon (143)
- Added new barbed wire icon (144)
- Renamed 2006 edition icon (101 -> 145)
- Added new main icon (101)
- Added new file type icons
	- Commentary .zcm (146)
	- Federation .zfd (147)
	- Gimmick .z3g (148)
	- Moves .zms (149)
	- Import .zim (150)

## Image Changes
- Updated commentor icons in toolbar (138) and tree view (140) images to remove stray pixel 
- Lightened tree view (140) images
