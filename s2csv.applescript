(*
	s2csv
	--
	Version 1
	Copyright 2014 Superpixel, Nico Rohrbach
*)

global client_folder_name

-- we use this property to cut of the file extension from the file name of droped files
property file_extension : ".numbers"

-- Application opens via doubleclick
on run
	try
		set proj_string to the clipboard as text
	end try
	my createProjectFolder(proj_string)
end run

-- Application opens via file drop
on open dropped_items
	set dropped_item to first item of dropped_items
	-- filter filename from full path
	tell application "Finder" to set file_name to the name of dropped_item
	-- remove file extension
	try
		set old_delims to AppleScript's text item delimiters
		set AppleScript's text item delimiters to file_extension
		set proj_string to first text item in file_name
		set AppleScript's text item delimiters to old_delims
	on error
		set AppleScript's text item delimiters to old_delims
	end try
	my createProjectFolder(proj_string)
end open
